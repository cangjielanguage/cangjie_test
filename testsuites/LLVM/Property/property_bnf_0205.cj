// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

open class Boo{
    var a: Int64 = 1
    static var b: Int64 = 1
    abstract prop var a8:Int64 { // EXPECTED: regex error.*?'abstract' modifier is illegal for property declaration in class body
        get(){
             return ( b + 1 )
        }
        set(v){ b = v}
    }
}

class Coo <: Boo {
}
