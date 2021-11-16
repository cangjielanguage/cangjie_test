// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type bl<T> = T

func main(): Int64 {
    var b1: bl<Bool> = true
    var b2: Bool = true
    if (b1 && b2) {
        return 0
    }
    return 1
}