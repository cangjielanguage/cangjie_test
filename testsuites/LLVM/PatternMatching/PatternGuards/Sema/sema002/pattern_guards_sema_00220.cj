// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func x():Int64{return 1}
func main(){
    var i : Int64 = 1
    var x : Int64 = 11
    var a : Int64 = match (i) {
        case _ if (x++) => i // EXPECTED: regex expected an expression of type 'Bool', but got
    }
    return (a-1)
}
