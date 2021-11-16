// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


open class Base {
    open func foo(): Int64{1}
}

class A <: Base {
    func foo(x:Int32):String {
        x.toString()
    }
    func foo(x:Int64):Int64 {
        x+x
    }
    override func foo(): Int64 { 3 }
}

func main(): Int64 {
    var i1:Int16 = 2
    var i2:Int64 = 2
    var res = A()
    var res1 = res.foo(i1) // EXPECTED: regex no matching function declaration for function call 'foo'
    var res2 = res.foo(i2)
    var res3 = res.foo()
    if (res1 == "2" && res2 == 4 && res3 == 3) {
        return 0
    }
    return 1
}