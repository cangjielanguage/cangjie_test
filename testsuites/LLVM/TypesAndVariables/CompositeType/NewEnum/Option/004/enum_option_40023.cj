// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let a = [0]
    let c1 : ?List<Int64> = a
    let r1 : ?Int64 = c1?[0]
    return r1 ?? 1
}
