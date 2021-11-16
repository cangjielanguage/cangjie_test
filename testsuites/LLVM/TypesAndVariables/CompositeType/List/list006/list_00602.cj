// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func test(): Int64 {
    var a : List<Int64> = [1,2,3]
    var b : Int32 = a.size()  // EXPECTED: regex return type for 'size' is mismatched
    return a.size() - 3
}

func main(): Int64 {
    return test()
}
