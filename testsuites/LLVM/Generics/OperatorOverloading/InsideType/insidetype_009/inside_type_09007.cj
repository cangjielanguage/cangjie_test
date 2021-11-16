// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A<T>{
    static func test():Int64{1}
    static let i = 1
    operator func *(input_b:A<T>):Bool  {
        var a = i
        var b = test()
        var f = A<Int32>.i
        var g = A<Int32>.test()
        return true
    }
}

class B <: A<Int32>{}


func main(): Int64 {
    var a : B = B()
    if (a*a) {return 0}
    return 1
}