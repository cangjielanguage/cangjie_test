// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test<T>(input:T){
    //var a : Array<T> = [input].toArray()
    var a : Array<T> = @{input}
    var b : ArrayList<T> = ArrayList<T>(a)
    return b
}


func main(): Int64 {
    return test<Int64>(1).size() - 1
}