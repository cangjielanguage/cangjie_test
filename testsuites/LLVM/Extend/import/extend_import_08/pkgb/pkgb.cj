package pkgb
import pkga.A

external interface I{
	static func foo(){
	  1
	}
}

external interface II {
	func foo2(){
	  1
	}
}

extend A <: II & I{
	func plus(a: A, b: A) : Int64 {
	  foo() + foo2()
	}
}
