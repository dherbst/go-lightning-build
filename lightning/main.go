package lightning

import (
	"github.com/satori/go.uuid"
)

func SomeUUID() uuid.UUID {
	return uuid.NewV4()
}

func SomeFunc() int {
	return 4
}
