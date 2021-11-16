// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

abstract class FaTest {
    var a: Int32 = 0
    func f(x: Int32): Int32
}

class Test <: FaTest{
    init(){}
    Test(x: Int32){
        this.a = this.f(x)
    }
    func f(x: Int32):Int32{
        return x+1
    }
}

abstract class FaData<T> {
    var b: T
    FaData(b: T) {this.b = b}
    func f(x: T): T
}

class Data<T> <: FaData<T>{
    Data(x: T, y: T) {
        super(x)
    }
    init(x: T){
        this(x, x)
        this.b = this.f(x)
    }
    func f(x: T): T{
        return x
    }
}

func run(): Int64 {
    var test: Test = Test(3)
    var res1: Int32 = test.a
    var data: Data<Int32> = Data<Int32>(6)
    var res2: Int32 = data.b
    if (res1 == 4 && res2 == 6) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
