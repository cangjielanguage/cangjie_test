// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func test<T>(a:?T):?T{a}

func main(): Int64 {
    var a : (?Int64)->?Int64 = test<Int64>
    match (a) {
        case _ : (Int64)->Option<Int64> => 1
        case _ => 0
    }
}
