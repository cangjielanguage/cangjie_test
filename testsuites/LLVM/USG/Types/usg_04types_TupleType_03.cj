// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let t1 = (1, 2.33, 'c')
    let t2 = (1, 3.33, 'c')

    if (t1 == t2) {
        print("t1 == t2")
    }
    if (t1 != t2) {
        print("t1 != t2")
    }
    return 0
}
