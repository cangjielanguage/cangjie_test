// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-auto array init expression must has type (Int64)->T
class A{
  let a : Int32
  init(){
    this.a = 5
  }
  let b = Array<Int32>(5,init())
}

func main(){
    let a = A()
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
