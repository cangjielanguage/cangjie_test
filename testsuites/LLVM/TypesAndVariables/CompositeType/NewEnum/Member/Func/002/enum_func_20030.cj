// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A<T>{
    a(T)
    func test(x:A<T>):C{C()}
}

class C{}


func main(): Int64 {
    var i = A<Int64>.a(1)
    var x : C = i.test(i)
    return 0
}