package main

import "testing"

func TestMath(t *testing.T) {
if 3*3 != 9 { t.Fatalf("math broke") }
}