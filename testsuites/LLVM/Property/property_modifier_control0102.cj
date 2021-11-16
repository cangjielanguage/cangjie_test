// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

open class Foo {
    private prop let a: Int64 {
        get() { return 0 }
    }
    protected prop let b: Int64 {
        get() { return 0 }
    }
}

class Coo <: Foo{
    var x:Int64  = 1
    var y:Int64 = 1
    var z:Int64 = 1
    init(){
        super()
        x = a // EXPECTED: regex can not access field 'a'
    }

}

func main():Int64 {
    Coo()
    var m = Foo().b // EXPECTED: regex can not access field 'b'
    return 0
}
