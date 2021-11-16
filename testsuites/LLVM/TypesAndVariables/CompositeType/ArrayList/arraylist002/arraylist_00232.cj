// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test<T>(a:T){
    //func x(a:T):Array<T>{[a].toArray()}
    func x(input:Int64):Array<T>{@{a}}
    var i : Int64 = 10
    var myArray : ArrayList<Array<T>> = ArrayList<Array<T>>(i,x)
}

func main(): Int64 {
    test<Int64>(1)
    return 0
}