// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var result = 0

class A{
  
}

interface I1 {
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

interface I2  <: I1{
  override func f() {
    super<I1>.f() //EXPECTED: regex ambiguous match for function call 'f'
  } 
}

class Data <: I2{
  
}


func main(): Int64 {
    Data<Int32>().f()
    return (result - 6)
}
