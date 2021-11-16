// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func x():Bool{return true}
func main(){
    var i : Int64 = 1
    var a : Int64 = match (i) {
        case _ if (x()) => i
        case _ => i + 1
    }
    return (a-1)
}