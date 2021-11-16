// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {

    let a: Float16 = 1023.2
    let b: Float16 = 1023.19
    print(a.toString()+"\n")
    print(b.toString()+"\n")
    if (a > b) {
        return 1
    }

    if (a <= 1023.2) {
        return 0
    }

    return 1
}
