// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
     var a : ??Int64 = Option<Option<Int64>>.Some(Option<Int64>.None)
     return (a??1)??0
}
