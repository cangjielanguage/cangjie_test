// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T>{
    static func test():Int64{1}
    let i = 1
    operator func *(input_a:A<T>,input_b:A<T>):Bool  {
        var a = i
        var b = test()
        //var f = A<Int32>.i  // not supported yet
        var g = A<Int32>.test()
        return true
    }
}


func main(): Int64 {
    return 0
}