// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a = if (true) { 1 }
    var res = match(a){
        case x : Unit => 0
        case _ => 1
    }
    return res
}
