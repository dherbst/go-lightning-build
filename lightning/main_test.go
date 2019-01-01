package lightning

import (
	"testing"
)

func TestSomeFunc(t *testing.T) {
	value := SomeFunc()
	if value != 4 {
		t.Errorf("Did not get expected value\n")
	}
}
