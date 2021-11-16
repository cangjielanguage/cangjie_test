// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func x<T>(input:T):T{input}

func test<T>():ArrayList<(T)->T>{
    //var a : Array<((T)->T)> = [x<T>].toArray()
    var a : Array<((T)->T)> = @{x<T>}
    var b : ArrayList<(T)->T> = ArrayList<(T)->T>(a)
    return b
}
func main(): Int64 {
    var res = test<Int64>()
    return res.size() - 1
}