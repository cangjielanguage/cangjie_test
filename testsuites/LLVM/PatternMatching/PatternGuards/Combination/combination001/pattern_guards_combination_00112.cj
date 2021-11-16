// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(){
    var i : Int64 = 1
    var a : Int64 = match (i) {
        case x : Int64 if (x!=1) => 2
        case x : Int64 if (x==1) => 1
        case _ => 0

    }
    return (a-1)
}