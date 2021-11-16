// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class B{
  let b : Int64
  init(){
    this.b = 1
  }
  let a : Array<Int64> = @{1,0[
  let c = a[init()]
}

func main(): Int64 {
    var c = B()
    return c.c
}
