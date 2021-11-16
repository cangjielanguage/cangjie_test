// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func main(){
    var i : Int64 = 1
    var y : Int64 = match (i) {
        case _ if (throw) {} => i // EXPECTED: regex-auto expected '=>' after pattern in case body
    }
    return y-1
}