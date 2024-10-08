ECHO "UPDATAING LAMBDA DOCKER IMAGE"
# docker build --platform linux/amd64 -t docker-go-lambda-image:test .
# ARM
docker build --platform linux/arm64 -t docker-go-lambda-image:test .


# ECHO "LOGIN TO ECR"
# aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 466768951184.dkr.ecr.us-east-1.amazonaws.com

ECHO "TAGGING LAMBDA DOCKER IMAGE"
docker tag docker-go-lambda-image:test 466768951184.dkr.ecr.us-east-1.amazonaws.com/go-example-arm-newrelic:latest

ECHO "PUSHING LAMBDA DOCKER IMAGE"
docker push 466768951184.dkr.ecr.us-east-1.amazonaws.com/go-example-arm-newrelic:latest

ECHO "DEPLOYING LAMBDA FUNCTION"
aws lambda update-function-code --function-name go-example-newrelic-arm --image-uri 466768951184.dkr.ecr.us-east-1.amazonaws.com/go-example-arm-newrelic:latest
