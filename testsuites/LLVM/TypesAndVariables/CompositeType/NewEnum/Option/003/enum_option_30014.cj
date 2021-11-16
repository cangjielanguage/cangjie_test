// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var b : ??Int64 = 1
    var c = match (b){
        case Some(v) => v
        case $None => Some<Int64>(0)
    }
    var res : Int64 = match (c){
        case Some(v) => v
        case $None => 0
    }
    return res - 1
}
