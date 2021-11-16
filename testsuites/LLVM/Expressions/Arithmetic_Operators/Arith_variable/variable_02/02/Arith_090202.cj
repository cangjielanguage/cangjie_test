// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let a = 2147483648
    let b = a - 5

    if (b != 2147483643) {
        return 1
    }

    return 0
}