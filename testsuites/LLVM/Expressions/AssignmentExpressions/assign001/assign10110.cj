// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var l_a : Array<Int32>*Array<Int32> = (@{4},@{4})
    var r_a : Array<Int32> = @{1,1}
    l_a[0][0] = Int32(r_a.size)
    if (l_a[0][0] == Int32(2)) {
        return 0
    }
    return 1
}
