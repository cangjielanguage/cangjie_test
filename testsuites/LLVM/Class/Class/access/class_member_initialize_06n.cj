// EXEC: %compiler %cmp_opt %f -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Base {
    protected var a:Int32
    init(x:Int32){
        a = x
    }
}

class Data <: Base{ 
    var b:Int32
    init(){ // EXPECTED: regex there is no non-parameter constructor in super class, please invoke super call explicitly
        b = super.a
    }
}

func main():Int64 {
    var data1 = Data()
    if (data1.b ==1) {
        return 0
    }
    return 1
}
