// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<T>{}

class X<T> <: A<T>{}

func test<T>(a:T){
    func x(a:Int64):A<T>{X<T>()}
    var i : Int64 = 10
    var myArray : ArrayList<A<T>> = ArrayList<A<T>>(i,x)
}

func main(): Int64 {
    test<Int64>(1)
    return 0
}