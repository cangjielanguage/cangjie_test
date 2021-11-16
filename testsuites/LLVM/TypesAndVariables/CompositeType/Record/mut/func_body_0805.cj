// EXEC-PIPE-1: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-not core dumped

func main() {
  var b = R(a: 6)
  b.c(7)
  return Int64(b.a - 8)
}

interface I {
  mut func c(b : Int32) : Int32
  func cc(): Int32
}

record R{
  var a : Int32 = 8
  mut func c(b : Int32) : Int32{
    let c = cc // EXPECTED: regex undeclared identifier 'cc'
    a = c() + b
    return a
  }
  
}

extend R <: I{
  func cc(): Int32{
    return 1
  }
}