// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class A{
    var i : Int64 = 1
    var y : Int64 = match (i) {
        case _ if (this()) => i // EXPECTED: regex invalid calling 'this' outside the constructor
    }
}

func main(){
    return 1
}
