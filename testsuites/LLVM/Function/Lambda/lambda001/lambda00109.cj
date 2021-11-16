// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    let sum = {a: Int64,
               b: Int64,
               c: Int64,
               d: Int64,
               e: Int64,
               f: Int64,
               g: Int64,
               h: Int64,
               i: Int64,
               j: Int64,
               k: Int64 => 0}
    return 0
}

func main(): Int64 {
    return test()
}
