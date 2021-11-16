// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() : Int64 {
    var Day(a):Int32 = TimeUnit.Day(1) //EXPECTED: regex error.*?return type for 'Day' is mismatched
    return 0
}

enum TimeUnit{
    Day(Int32)
}