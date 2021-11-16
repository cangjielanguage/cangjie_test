package pkgb
import pkga.A

external interface I{
	static func foo(){
	  1
	}
}

interface II <: I{
	func foo2(){
	  1
	}
}

extend A <: II{
	func plus(a: A, b: A) : Int64 {
	  foo() + foo2()
	}
}
