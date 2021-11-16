// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var aa : ??Int64 = Option<Int64>.None
    match (aa) {
        case _ : Option<Int64> => 2
        case _ : Option<Option<Int64>> => 0
        case _ => 1
    }
}
