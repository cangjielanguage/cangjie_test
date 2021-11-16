// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

abstract class FaTest {
    func foo(){
        return this.f(3)
    }

    func f(x: Int32): Int32
}

class Test <: FaTest{
    func f(x: Int32):Int32{
        return x+1
    }
}

abstract class FaData<T> {
    func foo(){
        return this.f(4)
    }
    func f(x: Int32): Int32
}

class Data <: FaData<Int32>{
    func f(x: Int32): Int32{
        return x+2
    }
}

func run(): Int64 {
    var test: Test = Test()
    var res1: Int32 = test.foo()
    var data: Data = Data()
    var res2: Int32 = data.foo()
    if (res1 == 4 && res2 == 6) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
