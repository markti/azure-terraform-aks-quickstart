BINARY_NAME=sample

build:
	GOARCH=amd64 GOOS=linux go build -o ${BINARY_NAME}-linux main.go

run:
	./${BINARY_NAME}

build_and_run: build run

clean:
	go clean
	rm ${BINARY_NAME}-linux

test:
	go test ./...

test_coverage:
	go test ./... -coverprofile=coverage.out

dep:
	go mod download

vet:
	go vet

lint:
	golangci-lint run --enable-all