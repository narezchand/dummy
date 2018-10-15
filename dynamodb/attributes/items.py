import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('Account')

table.put_item(
   Item={
        'CustomerId': 2,
        'City': 'Banglore',
        'Account_number': 67849,
    }
)
