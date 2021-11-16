// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let a = [[[0]]]
    let c1 : ?List<List<List<Int64>>> = a
    let r1 : ?List<List<Int64>> = c1?[0]
    let r2 : ?List<Int64> = r1?[0]
    let r3 : ?Int64 = r2?[0]
    return r3 ?? 1
}
