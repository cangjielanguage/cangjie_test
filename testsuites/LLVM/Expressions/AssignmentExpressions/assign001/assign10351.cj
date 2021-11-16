// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var l_a : Array<Bool>*Array<Bool> = (@{false},@{false})
    var r_a = true
    var r_b = true
    l_a[0][0] = r_a || r_b
    if (l_a[0][0] == true) {
        return 0
    }
    return 1
}
