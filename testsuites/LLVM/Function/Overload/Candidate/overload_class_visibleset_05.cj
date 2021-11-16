// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Base{
    func base(){1}
}
class A <: Base {

    let a: Int32 = 2
    func foo(x: Int32):Int64 {
        this.bar(this.a)  // EXPECTED: regex object cannot access static member 'bar'
        this.base()
    }
    static func bar(x: Int32): Int64 { Int64(x+2) }
}

record Data {
    let d1:Int32
    let d2: Int32
    init(x: Int32) {
        this(x,x+1)
        this.bar()  // EXPECTED: regex object cannot access static member 'bar'
    }
    init(x: Int32, y:Int32) {
        d1= x
        d2 = d1+y
    }
    static func bar() {1}
}

func main(): Int64 {
    var res1 = A().foo(1)
    var res2 = Data(2)
    if (res1 == 4 && res2.d1 == 2 && res2.d2 == 5) {
        return 0
    }
    return 1
}