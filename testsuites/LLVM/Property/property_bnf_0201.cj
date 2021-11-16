// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

open class Boo{
    override prop var a1:Int64 { // EXPECTED: regex override property 'a1' does not have an overridden property
        get(){
             return ( a + 1 )
        }
        set(v){ a = v}
    }
}
class Coo <: Boo {
}

