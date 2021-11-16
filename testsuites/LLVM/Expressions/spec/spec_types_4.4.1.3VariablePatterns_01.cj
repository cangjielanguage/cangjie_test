// EXEC-PIPE-0: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64{ 
    let score: Int64 = 90
    let PASS = 60
    let Full = 100
    let good =70
    var scoreResult: String = match (score) {
        case $PASS => "pass" // constant pattern
        case $Full => "Full" // ok, but not recommend.
        case good => "good"  // EXPECTED: regex warning.* 'good' has been defined in the outside of match expression, are you sure using 'good' as a variable pattern here?
    }
    return 0
}

