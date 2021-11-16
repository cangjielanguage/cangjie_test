// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() : Int64 {
    var 2 = 2 // EXPECTED: regex error.*?expected variable pattern, tuple pattern or enum pattern after 'var'
    return 0
}
