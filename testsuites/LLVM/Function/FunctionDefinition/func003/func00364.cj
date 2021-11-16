// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
enum A{
  a1
}

func test(a : A): A {
    return a
}

func main(): Int64 {
    return 0
}
