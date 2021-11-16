// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record R<T>{}

func test<T>():ArrayList<R<T>>{
    //var a : Array<R<T>> = [R<T>()].toArray()
    var a : Array<R<T>> = @{R<T>()}
    var b : ArrayList<R<T>> = ArrayList<R<T>>(a)
    return b
}

func main(): Int64 {
    return test<Int64>().size() - 1
}