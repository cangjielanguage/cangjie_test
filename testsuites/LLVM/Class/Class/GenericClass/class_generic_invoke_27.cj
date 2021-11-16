// EXEC: %compiler %cmp_opt %f -o %n.%suffix 2>&1 | compare %f

// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Base{
    var a: Int32 = 3
}

class Data<T> <: Base{
    var a: Int32 = 2
    var b: Int32
    init(){
        b = 5
    }
    init(x: T){
        init()
        super // EXPECTED: regex invalid super expression, it can only be used on the left-hand side of a dot
    }
}

func run(): Int64 {
    let data: Data<Int32> = Data<Int32>(45)
    var res1: Int32 = data.a
    var res2: Int32 = data.b
    if (res1 == 2 && res2 == 5) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
