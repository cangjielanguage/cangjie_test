// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped

func main():Int64 {
    var a : Float64 = 1.0
    var result: Int64 = match (a) {
        case Float64(1.0) => 0 // EXPECTED: regex error.*expected pattern here
        case _ => 1
    }
    return result
}