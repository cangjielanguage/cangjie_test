// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex array size must be of type Int64
class A{
  let a : Int64
  init(){
    this.a = 5
  }
  let myArray = Array<Int32>(this(),0)
}



func main(): Int64{
    let a = A()
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
