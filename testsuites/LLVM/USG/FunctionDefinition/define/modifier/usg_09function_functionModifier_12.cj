// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// check the public modifier in record
record R{
  public func a(){
      return 0
  }
}

func main(): Int64{
    let d = R().a 
    let c = d()
    return c
}