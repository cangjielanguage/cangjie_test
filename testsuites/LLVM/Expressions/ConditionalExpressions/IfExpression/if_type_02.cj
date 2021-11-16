// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a = if (true) { Int32(1) } else { Int32(2) }
    var res = match(a){
        case x : Int32 => 0
        case _ => 1
    }
    return res
}
