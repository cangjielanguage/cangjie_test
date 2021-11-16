// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main() {
    let arr : Array<Int64> = Array<Int64>([1,2,3,4,5])
    let b = Array<Array<Int64>>([arr])
    let c = Array<Array<Array<Int64>>>([b])
    let d = Array<Array<Array<Array<Int64>>>>([c])

    return d[0][0][0][0] -1
}