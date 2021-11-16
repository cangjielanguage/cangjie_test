// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I {
    prop let a: Int64 {
        get() {
            return 0
        }
    }
}
class A <: I {
}

func main() {
    return 0
}
