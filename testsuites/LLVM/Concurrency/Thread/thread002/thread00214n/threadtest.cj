// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var result: Int32 = 1

    let fut: Future<Int32> = spawn {
        var a: Int32 = 2
        return a
    }

    let opt: Result<Int64> = fut.getResult() // EXPECTED: regex return type for 'getResult' is mismatched
    return 0
}
