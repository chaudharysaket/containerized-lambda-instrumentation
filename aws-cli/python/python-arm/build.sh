ECHO "UPDATAING LAMBDA DOCKER IMAGE"

# ARM
docker build --platform linux/arm64 -t docker-python-lambda-image:test .

# TEST LOCALLY
# docker run --platform linux/arm64 -p 9005:8080 docker-python-lambda-image:test .

ECHO "LOGIN TO ECR"
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 466768951184.dkr.ecr.us-east-1.amazonaws.com

ECHO "TAGGING LAMBDA DOCKER IMAGE"
docker tag docker-python-lambda-image:test 466768951184.dkr.ecr.us-east-1.amazonaws.com/python-example-arm-newrelic:latest

ECHO "PUSHING LAMBDA DOCKER IMAGE"
docker push 466768951184.dkr.ecr.us-east-1.amazonaws.com/python-example-arm-newrelic:latest

ECHO "DEPLOYING LAMBDA FUNCTION"
aws lambda update-function-code --function-name python-containerized-example-newrelic-arm --image-uri 466768951184.dkr.ecr.us-east-1.amazonaws.com/python-example-arm-newrelic:latest


# docker run -d -p 9002:8080 \
# --entrypoint /usr/local/bin/aws-lambda-rie \
# docker-python-lambda-image:test ./main