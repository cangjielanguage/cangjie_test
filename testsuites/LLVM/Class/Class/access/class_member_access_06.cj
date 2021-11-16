// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Base {
    protected var a:Int32 = 2
    public init(x:Int32){
        a = x
    }
    func foo():Int32 {
        return a
    }
}

class GenRec <: Base {
    var b: Int32 = 1
    init(str:String){
        super(3)
        this.b = super.foo()+super.a
    }
}

func main():Int64 {
    var rec = GenRec("hi")
    var res = rec.b
    print(res.toString()) //打印 rec.b==264。class改成class通过,打印rec.b==2
    if (res == 6) {
        return 0
    }
    return 1
}
