import json
import boto3
import os

sns = boto3.client("sns")

SNS_TOPIC_ARN = os.environ["SNS_TOPIC_ARN"]

def lambda_handler(event, context):

    print("Event:", json.dumps(event))

    bucket = event["Records"][0]["s3"]["bucket"]["name"]

    file_name = event["Records"][0]["s3"]["object"]["key"]

    message = f"File uploaded: {file_name} in bucket: {bucket}"

    sns.publish(
        TopicArn=SNS_TOPIC_ARN,
        Message=message,
        Subject="S3 File Upload Alert"
    )

    return {

        "statusCode": 200,

        "body": json.dumps("Notification sent!")
    }