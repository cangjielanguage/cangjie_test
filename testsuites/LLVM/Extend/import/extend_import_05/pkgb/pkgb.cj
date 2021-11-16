package pkgb
import pkga.II

external class A {
  
}

extend A <: II{
	func plus(a: A, b: A) : Int64 {
	  foo() + foo2()
	}
}