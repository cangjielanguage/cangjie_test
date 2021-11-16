// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


open class Base<T> {
    var i: Int32 = 2
    func foo(): Int32{
        return 3
    }
}

class Test <: Base<Int32>{
    var i: Int32
    init(){
        this(super.i) // EXPECTED: regex 'super' is not allowed to be used in arguments of constructor call
    }
    init(x: Int32){
        i = x
    }
}

class Data<T> <: Base<T> {
    var i: Int32
    init(){
        this(super.i) // EXPECTED: regex 'super' is not allowed to be used in arguments of constructor call
    }
    init(x: Int32){
        i = x + 1
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    var res1: Int32 = test.i
    var res2: Int32 = data.i
    print(res1.toString())
    print(res2.toString())
    if(res1 == 2 && res2 == 3){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
