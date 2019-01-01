package main

import (
	"fmt"
	"github.com/dherbst/go-lightning-build/lightning"
)

func main() {
	fmt.Printf("Here is the uuid %v\n", lightning.SomeUUID())
}
