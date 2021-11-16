// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func main():Int64{
    let scorePass: Set<Int64> = #{60, 70, 80, 90, 100}
    let score = 50
    var scoreResult: String = match (score) {
        case in $scorePass => "pass" // EXPECTED: regex unsupported type 'Set' for 'in pattern' in match case.
        case in (10, 20, 30) => "very low score"
        case in [40, 50] => "low score" // matched
    }
//    print("${scoreResult}")
    return 0
}


