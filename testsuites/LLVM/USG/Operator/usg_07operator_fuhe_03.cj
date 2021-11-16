// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var a = true
    var b = false
    a ||= b
    if (!a) {
        return 1
    }
    a &&= b
    if (a) {
        return 1
    }
    0
}
