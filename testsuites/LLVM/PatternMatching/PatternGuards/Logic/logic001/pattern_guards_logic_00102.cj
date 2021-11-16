// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(){
    var i : Int64 = 1
    var flag : Bool = false
    var a : Int64 = match (i) {
        case _ if (flag) => i
        case _ => i + 1
    }
    return (a-2)
}
