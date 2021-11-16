// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() {
    let range9 = 0..10:0   // EXPECTED: regex error.*step cannot be zero in range expression
    let range10 = 0..=10:0 // EXPECTED: regex error.*step cannot be zero in range expression

    return 0
}
