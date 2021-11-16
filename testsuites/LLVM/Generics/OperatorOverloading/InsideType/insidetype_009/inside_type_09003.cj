// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A<T>{
    static func test():Int64{1}
    static let i : Int64 = 1
    operator func *(input_b:A<T>):Bool  {
        var a = i
        var b = test()
        return true
    }
}


func main(): Int64 {
    return 0
}
