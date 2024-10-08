aws_account_id=$1
region=$2

ECHO "UPDATAING LAMBDA DOCKER IMAGE"
docker build --platform linux/amd64 -t docker-python-amd-lambda-image:test .

# TEST LOCALLY AMD
# docker run --platform linux/amd64 -p 9005:8080 docker-python-lambda-image:test .

ECHO "LOGIN TO ECR"
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $aws_account_id.dkr.ecr.us-east-1.amazonaws.com

ECHO "TAGGING LAMBDA DOCKER IMAGE"
docker tag docker-python-amd-lambda-image:test 123456789012.dkr.ecr.us-east-1.amazonaws.com/python-example-newrelic:latest

ECHO "PUSHING LAMBDA DOCKER IMAGE"
docker push 123456789012.dkr.ecr.us-east-1.amazonaws.com/python-example-newrelic:latest

ECHO "DEPLOYING LAMBDA FUNCTION"
aws lambda update-function-code --function-name python-containerized-example-newrelic --image-uri 123456789012.dkr.ecr.us-east-1.amazonaws.com/python-example-newrelic:latest
