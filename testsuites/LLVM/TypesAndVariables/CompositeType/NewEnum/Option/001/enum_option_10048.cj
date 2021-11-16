// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func test(a:?Int64):Int64{0}

func main(): Int64 {
    var a : (?(Int64))->Int64 = test
    match (a) {
        case _ : (Option<Int64>)->Int64 => 0
        case _ => 1
    }
}
