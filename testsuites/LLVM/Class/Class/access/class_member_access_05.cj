// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Base {
    protected var a:Int32 = 2
    static var b: Int32 = 3
    public init(x:Int32){
        a = x
    }
    static func foo():Int32 {
        return 4
    }
}

class GenRec <: Base {
    var bb: Int32 = 1
    init(str:String){
        super(3)
        this.bb = Base.foo()+super.a+ Base.b
    }
}

func main():Int64 {
    var rec = GenRec("hi")
    var res = rec.bb
    print(res.toString())
    if (res == 10) {
        return 0
    }
    return 1
}
