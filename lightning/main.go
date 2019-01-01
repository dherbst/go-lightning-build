package lightning

import (
	"github.com/satori/go.uuid"
)

// SomeUUID returns a new UUID
func SomeUUID() uuid.UUID {
	return uuid.NewV4()
}

// SomeFunc returns the integer 4
func SomeFunc() int {
	return 4
}
