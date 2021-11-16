// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A{
   a(?A) | a
}

func main(): Int64 {
    var x = a(a)
    return 0
}
