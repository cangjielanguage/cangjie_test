// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(){
    var i : Int64 = 1
    var x : Bool = true
    var y : Int64 = match (i) {
        case _ if (x) => i
        case _ => i + 1
    }
    return (y-1)
}