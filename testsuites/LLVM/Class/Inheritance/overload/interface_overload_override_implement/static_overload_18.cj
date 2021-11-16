// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Super{
	var a = 1
}
class Base <: Super{
	init(){
	  a = 2
	}
}

interface Data2{
    static func foo (a: Int64) : Super{
        return Super()
    }
}

class Data3 <: Data2{
    static func foo (a: Int64) : Base{
        return Base()
    }
}

func main(): Int64 {
    var a = Data3.foo(1).a
    return Int64(a - 2)
}
