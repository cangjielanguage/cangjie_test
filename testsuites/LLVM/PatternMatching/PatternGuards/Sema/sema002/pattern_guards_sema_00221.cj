// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

enum A{
    a(Int64)
}
func main(){
    var i : Int64 = 1
    var x : Int64 = 11
    var a : Int64 = match (i) {
        case _ if (A.a(1)) => i // EXPECTED: regex return type for 'a' is mismatched
    }
    return (a-1)
}
