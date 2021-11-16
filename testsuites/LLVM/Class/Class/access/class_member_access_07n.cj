// EXEC: %compiler %cmp_opt %f -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Base {
    protected var a:Int32 = 2
    static var b: Int32 = 3
    private init(x:Int32){
        a = x
    }
    public init(x:String){
        a = 3
    }
    static func foo():Int32 {
        return a
    }
}

class GenRec <: Base {
    let b: Int32 = 1
    init(str:String){
        super(3)        // EXPECTED: regex no matching function declaration for function call 'super'
        this.b = super.foo()+super.b
    }
}

class Data <: Base {
    let b: Int32 = 1
    init(str:String){
        super("3")
        this.b = super.foo()+super.a    // EXPECTED: regex object cannot access static member 'foo'
    }
}

func main():Int64 {
    GenRec("hi")
    Data("hello")
    return 0

}
