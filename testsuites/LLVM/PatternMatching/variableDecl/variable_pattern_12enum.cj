// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() : Int64 {
    var Some(a) = Option<Int32>.Some(1) // EXPECTED: regex error.*the pattern isn't irrefutable pattern and it can not be initialized
    return 0
}
