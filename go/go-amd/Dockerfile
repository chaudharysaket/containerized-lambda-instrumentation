FROM public.ecr.aws/newrelic-lambda-layers-for-docker/newrelic-lambda-layers-lambdaextension:2.3.13 AS extensions-layer

FROM golang:1.20 AS build

WORKDIR /go-nr-example

COPY go.mod go.sum ./

RUN go mod download

COPY main.go .

RUN go build -o main main.go

FROM public.ecr.aws/lambda/provided:al2023

COPY --from=extensions-layer /opt/extensions/ /opt/extensions/

COPY --from=build /go-nr-example/main ./main

ENTRYPOINT [ "./main" ]