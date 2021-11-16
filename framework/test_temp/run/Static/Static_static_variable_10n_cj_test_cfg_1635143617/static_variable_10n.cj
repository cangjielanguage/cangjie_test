// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex is used before initialization

class Data<T>  {
    static func foo(x:Int32):T{
        return a
    }
    static let a: T = foo(1)
}

func run(): Int64 {
    var v0: Int32 = 1
    if (Data<Int32>.foo(v0) !=  Data<Int32>.a) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
