// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E{
    e
    prop let a:Int64{
        get (){0}
    }
}
func main() {
    var i : ?E = E.e
    return i?.a ?? -1
}
