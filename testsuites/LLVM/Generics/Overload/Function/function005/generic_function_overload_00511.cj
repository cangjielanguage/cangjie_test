// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class I<T>{
    func test(a:T){return 1}
    func test(a:Int64){return 2}
}
open class A<T> <: I<T>{
    func test(a:Int32){return 3}
}

class B<T> <: A<T>{
    func test(a:Int16){return 4}
    var i : T
    init(input:T){i = input}
    func a(){
    var I = super.test(i)
    return I
    }
}


func main():Int64{
    var res1 = B<Int8>(1).a()
    if (res1 != 1) {
        return 1
    }
    return 0
}