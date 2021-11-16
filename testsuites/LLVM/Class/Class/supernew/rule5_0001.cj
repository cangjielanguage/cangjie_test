// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Base<T> {
    var i: Int32 = 2
    func foo(): Int32{
        return 3
    }
}

class Test <: Base<Int32>{
    var i: Int32
    init(){
        this(1)
    }

    init(x: Bool){
       super()
    }

    init(x: Int32){
        // this.i = 9
    }
}


func main(): Int64 {
    var test: Test = Test()
    var res1: Int32 = test.i
    print(res1.toString())
    return Int64(res1 - 2)
}
