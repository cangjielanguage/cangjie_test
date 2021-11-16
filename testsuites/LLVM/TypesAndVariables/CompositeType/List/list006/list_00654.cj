// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func test(): Int64 {
    var a : List<Int64> = [1]
    a[Int32(0)] // EXPECTED: regex invalid subscript operator \[\] on type 'Class-List<Int64>' and 'Int32'
    return 1
}

func main(): Int64 {
    test()
}
