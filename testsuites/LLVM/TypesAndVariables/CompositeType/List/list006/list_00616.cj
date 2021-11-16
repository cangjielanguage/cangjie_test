// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test(): Bool {
    var a : List<Int64> = []
    return a.isEmpty()
}

func main(): Int64 {
    if (test()) {
        return 0
    }
    return 1
}
