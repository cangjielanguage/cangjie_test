// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-not core dumped

func main() {
  return 2
}

record R{
  var a : Int32 = 8
}


interface I {
  func c(b : Int32) : Int32{
    let a = cc   //EXPECTED: regex immutable function 'c' cannot access mutable function 'cc'
    return 0
  }

  mut func cc(){

  }
}
