// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func main(){
    var i : Int64 = 1
    var x : Int64 = 2
    var y : Int64 = 3
    var flag : Bool = true
    var a : Int64 = match (i) {
        case _ if (x^y) => i // EXPECTED: regex expected an expression of type 'Bool', but got
    }
    return (a-1)
}
