// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

open class Boo{
    var a: Int64 = 1
    static var b: Int64 = 1
    open protected prop var a1:Int64 {
        get(){
             return ( a + 1 )
        }
        set(v){ a = v}
    }
}

class Coo <: Boo {
    override private prop var a1:Int64 { // EXPECTED: regex do not weaken access privilege 'protected' for property 'a1' in 'Boo'
        get(){
             return ( a + 2 )
        }
        set(v){ a = v}
    }

}

