FROM public.ecr.aws/x6n7b2o2/newrelic-lambda-layers-python:311 AS layer

FROM public.ecr.aws/lambda/python:3.11


# Layer code
WORKDIR /opt
COPY --from=layer /opt/ .

WORKDIR ${LAMBDA_TASK_ROOT}
# Copy requirements.txt
COPY app/requirements.txt ${LAMBDA_TASK_ROOT}

# Copy function code
COPY app/lambda_function.py ${LAMBDA_TASK_ROOT}

# Install the specified packages
RUN pip freeze > requirements.txt

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "lambda_function.handler" ]