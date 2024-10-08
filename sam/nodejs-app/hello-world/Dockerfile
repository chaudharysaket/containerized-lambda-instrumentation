FROM public.ecr.aws/q6k3q1g1/newrelic-lambda-layers-nodejs:20-arm64 AS layer

FROM public.ecr.aws/lambda/nodejs:20

COPY --from=layer /opt/ /opt

COPY app.mjs package*.json ./

RUN npm install
# If you are building your code for production, instead include a package-lock.json file on this directory and use:
# RUN npm ci --production

# Command can be overwritten by providing a different command in the template directly.
CMD ["app.lambdaHandler"]
