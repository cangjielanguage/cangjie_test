// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T>{
    static func test(a:Int64){return 1}
    static func test(a:T){return 2}
}
class Test<T> <: A<T>{}

class B<T>{
    static func test(a:Int64){return 1}
    static func test(a:T){return 2}
}

record C<T>{
    static func test(a:Int64){return 1}
    static func test(a:T){return 2}
}

func main():Int64{
    var res1 = Test<Int32>.test(1)
    if (res1 != 1) {
        return 1
    }
    var res2 = B<Int32>.test(1)
    if (res2 != 1) {
        return 1
    }
    var res3 = B<Int32>.test(1)
    if (res3 != 1) {
        return 1
    }
    return 0
}