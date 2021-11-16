// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

abstract class FaData<T> {
    var b: Int32 = 1
    func f(x: T): T
}

class Data<T> <: FaData<T>{
    var b: T
    init(x: T){
        b = super.f(x)  // EXPECTED: regex-auto abstract method 'f' cannot be accessed directly
    }
    func f(x: T): T{
        return x
    }
}

func run(): Int64 {
    var data: Data<Int32> = Data<Int32>(6)
    var res2: Int32 = data.b
    if (res2 == 6) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
