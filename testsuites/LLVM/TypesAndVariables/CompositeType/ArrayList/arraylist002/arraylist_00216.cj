// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func y<T>(a:T):T{a}
func x<T>(a:Int64):(T)->T{y<T>}

func test<T>(a:T){
    var i : Int64 = 10
    var myArray : ArrayList<(T)->T> = ArrayList<(T)->T>(i,x<T>)
}

func main(): Int64 {
    var i : Int64 = 10
    test<Int64>(1)
    return 0
}