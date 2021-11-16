// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(){
    var i : Int64 = 1
    var flag : Bool = true
    var a : Int64 = match (i) {
        case _
        if
        (flag)
        => i
        case _ => 2
    }
    return (a-1)
}