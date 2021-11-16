// EXEC-PIPE-1:%compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*
func main(): Int64 {
    let scorePass: HashSet<Int64> = HashSet<Int64>([60, 70, 80, 90, 100])
    let score = 'a'
    var scoreResult: String = match (score) {
        case in $scorePass => "pass"    // EXPECTED: regex unsupported type 'HashSet' for 'in pattern' in match case.
        case _ => "very low score"
    }
    return 0
}
