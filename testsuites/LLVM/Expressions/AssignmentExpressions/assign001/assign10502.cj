// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class LA{
  var a : Array<Unit>*Array<Unit>
  init(a:Unit){
    this.a = (@{a},@{a})
  }
}

func main(): Int64 {
    var l_a = LA(())
    
    l_a.a[0][0] = return 0 // EXPECTED: regex expression of Nothing type cannot appear here currently
    if (l_a.a[0][0] == ()) {
        return 0
    }
    return 1
}
