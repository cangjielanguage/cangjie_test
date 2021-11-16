// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a : Bool = true
    var i : Int64 = 1
    var opt: Option<Bool> = Option<Bool>.None
    var res: Bool = match (opt) {
        case Some(x) => true
        case $None => false
    }
    var y : Int64 = match (i) {
        case _ if (res) => i
        case _ => i + 1
    }
    return y-2
}


