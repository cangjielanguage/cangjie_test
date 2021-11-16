// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A{
    a(Int64)
}
func main(){
    var i : A = A.a(1)
    var x : Int64 = 11
    var y : A = match (i) {
        case _ if (.a(x)) => i // EXPECTED: regex expected identifier before '\.'
    }
    return 1
}
