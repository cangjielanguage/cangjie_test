// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func fib(n: Int64) : Int64 {
  if (n < 2) {
    return n
  }
  return fib(n - 1) + fib(n - 2)
}

func main() {
  var n = 10
  var x = fib(n)
  print("${x}")
  return 0
}
