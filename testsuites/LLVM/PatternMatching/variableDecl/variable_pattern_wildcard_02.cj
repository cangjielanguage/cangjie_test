// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() : Int64 {
    var _:String = 2 // EXPECTED: regex error.*?initializer's type is incompatible with those irrefutable pattern declarations
    return 0
}
