// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type Int = ?Int64

func main(): Int64 {
    var a : Int = 1
    match (a) {
        case _ : ?Int64 => 0
        case _ : Int64 => 1
        case _ : Option<Int64> => 2
        case _ => 3
    }
}