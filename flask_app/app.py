from flask import Flask
import json
import boto3
import config as config
app= Flask(__name__)

def get_client(service):
    try:
        client = boto3.client(service,region_name=config.region)
        return client
    except Exception as e:
        return f"ERROR - Could not get the client - {e}"
    

@app.route('/list-bucket-content/<path:path>', methods=['GET'])
@app.route('/list-bucket-content/', defaults={'path': ''}, methods=['GET'])
def list_s3_files(path):
    try:
        bucket_name = config.bucket_name
        content = []
        is_correct_path = False
        client = get_client('s3')
        paginator = client.get_paginator('list_objects_v2')
        if path:
            if not path.endswith("/"):
                path = path+"/"
        page_iterator = paginator.paginate(Bucket=bucket_name, Prefix=path, Delimiter="/")
        
        for response in page_iterator:
            if 'CommonPrefixes' in response:
                for prefix in response['CommonPrefixes']:
                    directory = prefix['Prefix'].rstrip('/')
                    content.append(directory)

            if 'Contents' in response:
                is_correct_path = True
                for obj in response['Contents']:
                    file_name = obj['Key'].split('/')[-1]
                    if obj['Key'] != path :
                        content.append(file_name)
        if not is_correct_path:
            content = ["Non-existing path"]
        conv_to_json = json.dumps({'content': content})
        return conv_to_json
    except Exception as e:
        return json.dumps({'ERROR': e})
    
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)