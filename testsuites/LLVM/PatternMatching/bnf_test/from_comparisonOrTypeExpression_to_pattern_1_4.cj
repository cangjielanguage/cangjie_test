// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var c =  (match(1){case _ =>1}) as Int64
    var res =match (c) {
        case Some(v) => v
        case _ => 3
    }
    return res-1
}
