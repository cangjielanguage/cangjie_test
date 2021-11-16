// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test() : Bool {
    var a : Bool = true
    return a
}

func main() : Int64 {
    if (test()) {
        return 0
    }
    return 1
}
