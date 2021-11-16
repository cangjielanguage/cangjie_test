// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped

func main() {
  var b = R(a: 6)
  b.c(4)
  return Int64(b.a - 16)
}

record R{
  var a : Int32 = 8
  mut func c(b : Int32) : Int32{
    if(b > 0){
      a = a + b     
      return c(b-1)
    }
    return 0
  }
  
}
