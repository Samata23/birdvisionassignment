import json

def lambda_handler(event, context):
    name = event['name']
    greeting_message = f"Hello, {name}!"
    return {
        'statusCode': 200,
        'body': json.dumps(greeting_message)
    }
