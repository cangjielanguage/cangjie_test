// EXEC: %compiler %frontend %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not core dump

abstract class R{
    var c: Int32 = 0
    open func a(): Int32{
        c = 10
        return 1
    } 
}

open class C <: R{
    override func a(): Int32{
        c = 10
        return 1
    }
}

class D <: C{
    let b : ()->Int32
    init(){
        b = { => 3}
        b = super.a   // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
    }
}

var a = D().b

func main(): Int64{
	var c = a()
	return Int64(c - 1)
}
