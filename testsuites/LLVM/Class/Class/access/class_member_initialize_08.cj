// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT:regex-not core dump

open class Base {
    var a:Int32 = 2
    protected init(x:Int32){
        a = x
    }
    func foo():Int32{
        this.a+1
    }
}

class Data <: Base {
    var b:Int32
    init(){
        super(3)
        b = super.foo() //EXPECTED: regex 'foo' is not allowed to be accessed before all member variables are initialized
    }
}

func main():Int64 {
    var data1 = Data()
    if (data1.b == 4) {
        return 0
    }
    return 1
}