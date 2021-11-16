// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {

    let a: Bool = true
    let b: Bool = false
    let c: Bool = true

    if (a==b) {
        return 1
    }

    if (a==c) {
        return 0
    }

    return 1
}