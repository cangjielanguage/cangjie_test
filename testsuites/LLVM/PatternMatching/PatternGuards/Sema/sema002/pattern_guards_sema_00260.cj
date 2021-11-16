// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main():Int64{
    var a : Int64 = 1
    var i : Int64 = 1
    var y : Int64 = match (i) {
        case _ if (a!=i) => i+1
        case _ if (a==i) => i
        case _ => i + 1
    }
    return y-1
}