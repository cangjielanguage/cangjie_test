// EXEC-PIPE-1: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-not core dumped

func main() {
  let b = R(a: 6)
  b.c(4) //EXPECTED: regex let instance of record 'b' cannot access the mutable function 'c'
  return Int64(b.a - 16)
}

record R{
  var a : Int32 = 8
  mut func c(b : Int32) : Int32{
    a = a + b
    return 0
  }
  
}
