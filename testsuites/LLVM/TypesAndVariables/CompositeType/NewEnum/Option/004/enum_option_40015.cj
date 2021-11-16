// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var x : ()->Int64 = {=>0}
    let c1 = Option<()->Int64>.Some(x)
    var res = match (c1) {
        case Some(v) => Some(v())
        case $None => None<Int64>
    }
    return res ?? 1
}
