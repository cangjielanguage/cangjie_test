// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(){
    var i : Bool = true
    let k : Bool = true
    var a : Int64 = match (i) {
        case $k => 1
        case _ => 0
    }
    return (a-1)
}