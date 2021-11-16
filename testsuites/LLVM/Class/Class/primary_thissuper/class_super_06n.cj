// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

open class Base<T> {
    var i3: Int32 = 2
    open func foo(): Int32{
        return 3
    }
}

class Test <: Base<Int32>{
    var i: Int32
    Test(){
        i = super.i + 1     // EXPECTED: regex type incompatible in this assignment
    }
}

class Data<T> <: Base<T> {
    var i: Int32
    Data(){
        i = super.i + 2        // EXPECTED: regex type incompatible in this assignment
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    var res1: Int32 = test.i
    var res2: Int32 = data.i
    if(res1 == 3 && res2 == 4){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
