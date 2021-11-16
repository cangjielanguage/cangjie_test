package pkgc
import pkga.A

external interface I2{
	func foo(){  // EXPECTED: regex-not error
	  1
	}
}

extend A <: I2{ // EXPECTED: regex function 'foo' has overload conflicts
	func plus(a: A, b: A) : Int64 {// EXPECTED: regex function 'plus' has overload conflicts
	  foo()
	}
}
