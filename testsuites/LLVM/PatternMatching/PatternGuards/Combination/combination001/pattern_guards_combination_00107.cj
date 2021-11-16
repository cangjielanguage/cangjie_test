// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(){
    var i : Int64*Int64 = (1,1)
    var a : Int64 = match (i) {
        case (_,_) if (false) => 2
        case (_,_) if (true) => 1
        case (_,_) => 0

    }
    return (a-1)
}