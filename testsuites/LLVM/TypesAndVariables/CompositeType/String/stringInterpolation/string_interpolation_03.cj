// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    var b = """a // EXPECTED: regex-auto multi-line string literal must begin on a new line
    bc"""
    var a = """ // xxxx // EXPECTED: regex-auto multi-line string literal must begin on a new line
    a
    bc"""
    return 0
}