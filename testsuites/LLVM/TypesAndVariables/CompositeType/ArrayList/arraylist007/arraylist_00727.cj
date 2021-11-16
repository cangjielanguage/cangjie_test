// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func test<T>():ArrayList<Option<T>>{
    //var a : Array<Option<T>> = [Option<T>.None].toArray()
    var a : Array<Option<T>> = @{Option<T>.None}
    var b : ArrayList<Option<T>> = ArrayList<Option<T>>(a)
    return b
}

func main(): Int64 {
    return test<Int64>().size() - 1
}