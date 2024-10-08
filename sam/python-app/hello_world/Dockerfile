FROM public.ecr.aws/q6k3q1g1/newrelic-lambda-layers-python:312 AS layer

FROM public.ecr.aws/lambda/python:3.12

COPY --from=layer /opt/ /opt

COPY app.py requirements.txt ./

RUN python3.12 -m pip install -r requirements.txt -t .

# Command can be overwritten by providing a different command in the template directly.
CMD ["newrelic_lambda_wrapper.handler"]
