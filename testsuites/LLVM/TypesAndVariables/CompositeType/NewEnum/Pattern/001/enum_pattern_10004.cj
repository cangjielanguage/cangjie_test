// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : ?Int64 = None
    match (a){
        case Some(v) => v
        case None => 0
        case $None => 1
        case $None => 2
        case Some(v) => v
    }
}
