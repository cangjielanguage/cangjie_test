// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var result = 0

class A{
	
}

interface I1 <T>{
  func f() {
    result = 3
  }

  func f(a: Int32) {
    result = 4
  } 

  func f(a: Int64) {
    result = 5
  } 

  func f(a: Bool) {
    result = 6
  } 

  func f(a: Array<Bool>) {
    result = 7
  } 

  func f(a: A) {
    result = 8
  } 
}

class C2 <T> <: I1<T>{
  func f() {
    super<I1<T>>.f(true)
  } 
}

func main(): Int64 {
		C2<Int32>().f()
    return (result - 6)
}
