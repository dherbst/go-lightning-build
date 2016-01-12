all: clean get build

clean:
	mkdir -p src/vendor && mkdir -p bin
	rm -rf src/vendor/*
	rm -f bin/*

get:
	mkdir -p src/vendor
	git clone git@github.com:DramaFever/go.uuid.git --branch master src/vendor/github.com/satori/go.uuid && cd src/vendor/github.com/satori/go.uuid && git checkout 242673bbc820e051ef00033e274d32e08ece9e15

build:
	docker run --rm -i -v $(PWD):/myapp -w /myapp golang:1.5 bash -c "make build-in-container"

build-in-container:
	GO15VENDOREXPERIMENT=1 GOPATH=$(PWD) go vet lightning
	GO15VENDOREXPERIMENT=1 GOPATH=$(PWD) go build -a lightning
	GO15VENDOREXPERIMENT=1 GOPATH=$(PWD) go build -a -o bin/lightning src/lightning/cmd/main.go
	GO15VENDOREXPERIMENT=1 GOPATH=$(PWD) go test -coverprofile=coverage.out lightning
	GO15VENDOREXPERIMENT=1 GOPATH=$(PWD) go tool cover -html=coverage.out -o coverage.html
