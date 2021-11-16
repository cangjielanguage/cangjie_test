// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var l_a : Array<Int32> = @{4}
    func r_a():Int32{return 2}
    l_a[0] = r_a()
    if (l_a[0] == Int32(2)) {
        return 0
    }
    return 1
}
