// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main() {
    let arr : RefArray<Int64> = RefArray<Int64>([1,2,3,4,5])
    let b = RefArray<RefArray<Int64>>([arr])
    let c = RefArray<RefArray<RefArray<Int64>>>([b])
    let d = RefArray<RefArray<RefArray<RefArray<Int64>>>>([c])

    return d[0][0][0][0] -1
}