// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A<T>{
    a(T)
    func test(x:A<T>):A<T>{x}
}


func main(): Int64 {
    var i = A<Int64>.a(1)
    var x : A<Int64> = i.test(i)
    return 0
}