// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
interface I{
    let x : Int64 = 1
}

func main(){
    var i : Int64 = 1
    var a : Int64 = match (i) {
        case _ if (I.x) => i // EXPECTED: regex expected an expression of type 'Bool', but got
    }
    return (a-1)
}
