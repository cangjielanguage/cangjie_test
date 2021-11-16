// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(){
    var i : Int64 = 1
    let j : Int64 = 1
    var a : Int64 = match (i) {
        case $j if (false) => i+1
        case $j if (true) => i
        case _ => 0
    }
    return (a-1)
}