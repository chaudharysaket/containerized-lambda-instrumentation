package main

import (
	"context"
	"fmt"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

func handler(ctx context.Context, event events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	fmt.Println("Received body: ", event.Body)
	fmt.Println("Received headers: ", event.Headers)
	response := events.APIGatewayProxyResponse{
		StatusCode: 200,
		Body:       "\"Hello from Lambda testing Seventeen mile drive!!!\"",
	}
	return response, nil
}

func main() {
	lambda.Start(handler)
}
