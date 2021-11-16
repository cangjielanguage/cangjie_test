// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {

    return 0
}

open class Boo{
    var a: Int64 = 1
    static var b: Int64 = 1

    open static prop var a1:Int64 { // EXPECTED: regex error.*?modifiers 'static' and 'open' are conflict in property declaration
        get(){
             return ( a + 1 )
        }
        set(v){ a = v}
    }

    open override prop var a2:Int64 {  // EXPECTED: regex error.*?override property 'a2' does not have an overridden property
        get(){
             return ( a + 1 )
        }
        set(v){ a = v}
    }

}

class Coo <: Boo {
}

