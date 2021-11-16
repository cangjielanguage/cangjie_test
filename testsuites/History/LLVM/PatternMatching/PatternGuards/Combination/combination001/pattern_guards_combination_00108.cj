// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(){
    var i : List<Int32> = [50,60,70,80,90]
    var a : Int64 = match (i) {
        case [50,...] if (false) => 2
        case [50,...] if (true) => 1
        case _ => 0

    }
    return (a-1)
}
