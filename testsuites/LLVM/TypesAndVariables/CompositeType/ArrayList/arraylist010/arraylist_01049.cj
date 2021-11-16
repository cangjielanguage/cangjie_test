// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var l: Int64 = 10
    var a: ArrayList<Int64> = ArrayList<Int64>(l)
    a[Int32(0)] // EXPECTED: regex invalid subscript operator \[\] on type 'Class-ArrayList<Int64>' and 'Int32'
    return 1
}
