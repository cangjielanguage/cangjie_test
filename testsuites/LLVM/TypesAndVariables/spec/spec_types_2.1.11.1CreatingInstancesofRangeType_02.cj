// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(){
    let range9 = 0..10: 0  // EXPECTED: regex step cannot be zero in range expression
    let range10 = 0..=10: 0  // EXPECTED: regex step cannot be zero in range expression
    let range13 = ..10  // EXPECTED: regex missing 'start' in range expression
    let range14 = 1..  // EXPECTED: regex missing 'stop' in range expression
    let range15 = ..  // EXPECTED: regex missing 'start' in range expression
    return 0
}

