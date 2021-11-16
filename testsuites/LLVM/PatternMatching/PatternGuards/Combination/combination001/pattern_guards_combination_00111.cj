// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(){
    var i : Int64 = 1
    var a : Int64 = match (i) {
        case _ : Int64 if (false) => 2
        case _ : Int64 if (true) => 1
        case _ => 0

    }
    return (a-1)
}