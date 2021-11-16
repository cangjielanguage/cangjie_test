package pkgb
import pkga.A

external interface I{
	func foo(){ // EXPECTED: regex-not error
	  1
	}
}

extend A <: I{ // EXPECTED: regex function 'foo' has overload conflicts
	func plus(a: A, b: A) : Int64 {// EXPECTED: regex function 'plus' has overload conflicts
	  foo()
	}
}
