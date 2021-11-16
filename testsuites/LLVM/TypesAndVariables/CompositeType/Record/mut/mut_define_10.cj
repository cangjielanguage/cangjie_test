// EXEC: %compiler %cmp_opt -c %n.cj

interface A{
	mut func c(b : Int64): Int64 
}

record R <: A {
  var a = 3
	mut func c(b : Int64): Int64 {
	  this.a = b
	  return this.a
	}
}

func main() {
  var a = R()
  a.c(9)
  return (a.a - 9)
}