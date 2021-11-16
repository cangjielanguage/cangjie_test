// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func main(): Int64 {
    var a : (List<Int64>*List<Int64>) = ([0],[0])
    return a[1][0]
}
