// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Super{
	var a = 1
}
class Base <: Super{
	init(){
	  a = 2
	}
}

interface Data2{
    func foo (a: Int64) : Base{
        return Base()
    }
}

class Data3 <: Data2{
    func foo (a: Int64) : Super{ // EXPECTED: regex The return type of the override/redefine/implement function must be the same as or a subtype of the overridden/redefined/implemented function

        return Super()
    }
}

func main(): Int64 {
    var a = Data3().foo(1).a
    return Int64(a - 2)
}
