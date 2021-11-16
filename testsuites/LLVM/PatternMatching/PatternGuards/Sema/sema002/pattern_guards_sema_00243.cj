// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var i : Int64 = 1
    var y : Int64 = match (i) {
        case _ if
        (if (true) {true}else{true}) => i
        case _ => i + 1
    }
    return y-1
}