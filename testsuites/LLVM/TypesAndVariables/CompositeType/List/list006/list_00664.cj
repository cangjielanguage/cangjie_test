// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func test(): Int64 {
    var a = [1,2,3]
    var b : Array<Int32> = a.toArray()  // EXPECTED: regex return type for 'toArray' is mismatched
    for (i in b) {
        print(i.toString())
    }
    return 0
}

func main(): Int64 {
    test()
}
