// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex 'tuple element' can not be assigned
// ASSERT: regex expression of Nothing type cannot appear here currently

class LA{
  var a : Array<(Unit*Unit)>
  init(a:Unit){
    this.a = @{(a,a)}
  }
}

func main(): Int64 {
    var l_a = LA(())
    
    l_a.a[0][0] = return 0
    if (l_a.a[0][0] == ()) {
        return 0
    }
    return 1
}
