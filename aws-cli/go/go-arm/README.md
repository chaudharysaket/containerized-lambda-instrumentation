```
docker build --platform linux/amd64 -t docker-image:test .
```

```
aws lambda create-function \
  --function-name go-example-newrelic \
  --package-type Image \
  --code ImageUri=123456789012.dkr.ecr.us-east-1.amazonaws.com/go-example-newrelic:latest \
  --role arn:aws:iam::123456789012:role/service-role/fdnPython39OTelLayer001-role-rvq1u4pt  \
  --region us-east-1


aws lambda update-function-code \
--function-name go-example-newrelic \
--image-uri 123456789012.dkr.ecr.us-east-1.amazonaws.com/go-example-newrelic:latest \
--region us-east-1
``` 


### ARM

```
aws lambda create-function \
  --function-name go-example-newrelic-arm \
  --architectures arm64 \
  --package-type Image \
  --code ImageUri=123456789012.dkr.ecr.us-east-1.amazonaws.com/go-example-arm-newrelic:latest \
  --role arn:aws:iam::123456789012:role/service-role/fdnPython39OTelLayer001-role-rvq1u4pt  \
  --region us-east-1
```

### CREATE IMAGE AWS

```
aws ecr create-repository --repository-name go-example-arm-newrelic --region us-east-1 --image-scanning-configuration scanOnPush=true --image-tag-mutability MUTABLE
```

## References:

- https://aws.amazon.com/blogs/compute/working-with-lambda-layers-and-extensions-in-container-images/
