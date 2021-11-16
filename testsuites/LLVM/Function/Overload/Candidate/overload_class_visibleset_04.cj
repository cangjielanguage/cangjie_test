// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base {
    let base_a : Int32 = 1
    open func bar(x:Int32): Int64{1}
}

class A <: Base {
    let a: Int32 = 2
    func foo(x: Int32):Int64 {
        this.bar(this.a)
    }
    override func bar(x: Int32): Int64 { Int64(x+2) }
}

record Data {
    let d1:Int32
    let d2: Int32
    init(x: Int32) {
        this(x,x+1)
    }
    init(x: Int32, y:Int32) {
        d1= x
        d2 = d1+y
    }
    init(x:String,y:Int32) {
        d1= y+1
        d2 = d1+y+2
    }
}

func main(): Int64 {
    var res1 = A().foo(1)
    var res2 = Data(2)
    if (res1 == 4 && res2.d1 == 2 && res2.d2 == 5) {
        return 0
    }
    return 1
}
