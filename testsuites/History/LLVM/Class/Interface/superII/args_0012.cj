// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var result = 0

class A{
	
}

interface I1 <T>{
  func f() {
    result = result + 3
  }

  func f(a: Int32) {
    result = result + 4
  } 

  func f(a: Int64) {
    result = result + 5
  } 

  func f(a: Bool) {
    result = result + 6
  } 

  func f(a: Array<Bool>) {
    result = result + 7
  } 

  func f(a: A) {
    result = result + 8
  } 
}

interface I2 <T> <: I1<T>{
  func f() {
    super<I1<T>>.f()
    super<I1<T>>.f(0)
    super<I1<T>>.f(true)
    super<I1<T>>.f(A())
  } 
}

class Data<T> <: I2<T>{
	
}


func main(): Int64 {
		Data<Int32>().f()
    return (result - 22)
}
