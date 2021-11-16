// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test<T>(a:T){
    func x(a:Int64):Option<T>{Option<T>.None}
    var i : Int64 = 10
    var myArray : ArrayList<Option<T>> = ArrayList<Option<T>>(i,x)
}

func main(): Int64 {
    test<Int64>(1)
    return 0
}