// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(){
    var i : Int64 = 1
    var a : Int64 = match (i) {
        case 2 if (false) => i + 1
        case _ => i
    }
    return (a-1)
}