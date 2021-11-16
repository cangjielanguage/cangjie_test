// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
//The boolen type represents a logical quantity with two possible values: true false
func main(): Int64 {
    var t:Bool = true
    var f:Bool = false
    if (!t) {
        return 1
    }
    if (f){
        return 1
    }
    return 0
}