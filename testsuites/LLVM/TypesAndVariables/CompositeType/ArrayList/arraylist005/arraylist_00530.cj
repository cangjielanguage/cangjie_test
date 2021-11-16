// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test<T>(){
    var x : ArrayList<T> = ArrayList<T>()
    var res = match (x) {
        case _ : ArrayList<T> => 0
        case _ => 1
    }
    return res
}

func main(): Int64 {
    return test<Unit>()
}