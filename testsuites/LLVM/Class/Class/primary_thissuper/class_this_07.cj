// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base {
    var base: Int32 = 10
}

class Test <: Base {
    var a: Int32 = 1
    var b: Int32 = 0
    Test(){
        a = a + 1
    }
    init(b: Int32){
        this()
        this.b = this.base + this.a
    }
}

class Data<T> <: Base{
    var a: T
    var b: Int32
    Data(a: T, b: Int32){
        this.a = a
        this.b = b
    }
    init(a: T){
        this(a, 0)
        this.a = a
        b = this.base
    }
}

func run(): Int64 {
    var test: Test = Test(1)
    var data: Data<Int32> = Data<Int32>(4)
    var res1: Int32 = test.b
    var res2: Int32 = data.a
    var res3: Int32 = data.b
    if (res1 == 12 && res2 == 4 && res3 == 10) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
