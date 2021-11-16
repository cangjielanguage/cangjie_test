// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(){
    var i : Int64 = 1
    var x : Bool = true
    var y : Bool = true
    var flag : Bool = true
    var a : Int64 = match (i) {
        case _ if (if(flag){x} else {y}) => i
        case _ => i + 1
    }
    return (a-1)
}