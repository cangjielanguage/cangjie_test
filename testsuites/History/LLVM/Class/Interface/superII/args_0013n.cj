// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var result = 0

class A{
  
}

interface I1 <T>{
  func f() {
    result = 3
  }

  func f(a!: Int32 = 0) {
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

interface I2 <T> <: I1<T>{
  override func f() {
    super<I1<T>>.f() //EXPECTED: regex ambiguous match for function call 'f'
  } 
}

class Data<T> <: I2<T>{
  
}


func main(): Int64 {
    Data<Int32>().f()
    return (result - 6)
}
