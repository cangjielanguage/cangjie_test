// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Base {
    protected var a:Int32 = 2
    protected init(x:Int32){
        a = x
    }
}

class Data <: Base {
    var b:Int32
    init(){
        super(3)
        b = super.a
    }
}

func main():Int64 {
    var data1 = Data()
    if (data1.b ==3) {
        return 0
    }
    return 1
}