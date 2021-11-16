// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var l_a : Array<Int32>*Array<Int32> = (@{4},@{4})
    l_a[0][0]++
    if (l_a[0][0] != Int32(5)) {
        return 1
    }
    l_a[0][0]--
    if (l_a[0][0] != Int32(4)) {
        return 2
    }
    return 0
}
