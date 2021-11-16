// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test<T>(input:T){
    var a : ArrayList<List<T>> = ArrayList<List<T>>(1)
    a.add([input])
    return a.get(0)[0]
}

func main(): Int64 {
    return test(1) - 1
}
