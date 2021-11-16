// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

open class Foo {
    private prop let a: Int64 {
        get() { return 0 }
    }
    protected prop let b: Int64 {
        get() { return 0 }
    }
    public prop let c: Int64 {
        get() { return 0 }
    }
    prop var d: Int64 {
        get() {
            return 0
        }
        set(v){}
    }
}

class Coo <: Foo{
    var a:Int64  = 1
    var m:Int64 = 1
    init(){
        super()
        a = b
        d = 2
        m = d
    }

}

func main():Int64 {
    if (Coo().a != 0 ){
        return 1
    }
    if (Coo().m != 0 ){
        return 1
    }
    return 0
}
