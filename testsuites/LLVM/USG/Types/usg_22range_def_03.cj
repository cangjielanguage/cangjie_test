// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() {
    let range11 = 1..10   // Define an half-open range [1, 10) with step = 1.
    let range12 = 1..=10  // Define a closed range [1, 10] with step = 1.
    let range13 = ..10    // EXPECTED: regex error.*missing 'start' in range expression
    let range14 = 1..     // EXPECTED: regex error.*missing 'stop' in range expression
    let range15 = ..      // EXPECTED: regex error.*missing 'start' in range expression

    return 0
}
