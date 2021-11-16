// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan scoreResult = excellent

var scoreResult: String = ""

func main(): Int64 {
    let fut1: Future<Unit> = spawn {
        let score: Int64 = 90
        let PASS = 60
        let FULL = 100
        scoreResult = match (score) {
            case 0 => "zero"
            case 10 | 20 | 30 | 40 | 50 => "fail"
            case $PASS => "pass"
            case 70 | 80 => "good"
            case 90 | $FULL => "excellent" // matched
            case _ => "not a valid score"
        }
    }
    sleep(1000*1000*1000);
    print("scoreResult = " + scoreResult)
    return 0
}
