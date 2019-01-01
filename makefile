all: clean get build

clean:
	mkdir -p vendor && mkdir -p bin
	rm -rf vendor/*
	rm -f bin/*

get:
	mkdir -p vendor
	git clone git@github.com:DramaFever/go.uuid.git --branch master vendor/github.com/satori/go.uuid && cd vendor/github.com/satori/go.uuid && git checkout 242673bbc820e051ef00033e274d32e08ece9e15

build:
	docker run --rm -i -v $(PWD):/go/src/github.com/dherbst/go-lightning-build -w /go/src/github.com/dherbst/go-lightning-build golang:1.11 bash -c "make build-in-container"

build-in-container:
	go vet github.com/dherbst/go-lightning-build/lightning
	go build -a github.com/dherbst/go-lightning-build/lightning
	go build -a -o bin/lightning cmd/main.go
	go test -coverprofile=coverage.out github.com/dherbst/go-lightning-build/lightning
	go tool cover -html=coverage.out -o coverage.html

lint-in-container:
	go get golint
