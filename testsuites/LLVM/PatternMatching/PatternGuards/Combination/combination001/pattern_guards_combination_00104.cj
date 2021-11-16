// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(){
    var i : Int64 = 1
    var a : Int64 = match (i) {
        case x if (false) => x+1
        case x if (true) => x
        case _ => 0
    }
    return (a-1)
}