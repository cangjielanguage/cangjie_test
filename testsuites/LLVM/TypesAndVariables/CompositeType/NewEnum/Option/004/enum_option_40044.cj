// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum E{
    e
    prop let a:Int64{
        get (){0}
    }
}
func main() {
    var i : ?E = E.e
    i?.a = 1 // ASSERT: scan cannot assign to value : 'Enum-E.a' is an initialized 'let' constant
    return i?.a ?? -1
}