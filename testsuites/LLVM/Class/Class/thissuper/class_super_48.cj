// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class A {
    var a_i: Int32 = 1
    open func foo(): Int32 {
        return 1
    }
}
open class B <: A{
    var b_i: Int32 = 3
    override func foo(): Int32{
        var num: Int32 = super.foo()   //  Segmentation fault (core dumped)
        return num
    }
}
open class Test <: B{
    var i: Int32 = 2
    var b: Int32 = 1
    func f(){
        // var num: Int32 = super.i + 2
        var num: Int32 = super.foo() + 2
        return num
    }
}

func run(): Int64 {
    var test: Test = Test()
    var res1: Int32 = test.f()
    print("Test.f() : " + res1.toString() + "\n")
    if (res1 == 3){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
