// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func main(){
    var i : Int64 = 1
    var flag : Bool = true
    var a : Int64 = match (i) {
        case if (flag) => i // EXPECTED: regex expected pattern here
    }
    return (a-1)
}