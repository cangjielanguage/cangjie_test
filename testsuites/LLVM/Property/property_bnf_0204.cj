// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {

    return 0
}

external prop var a2:Int64 { // EXPECTED: regex error.*?illegal object in toplevel, toplevel must consist of declaration or definition
    get(){
         return ( a + 1 )
    }
    set(v){ a = v}
}

open class Boo{
    external prop var a2:Int64 { // EXPECTED: regex error.*?'external' modifier is illegal for property declaration in class body
        get(){
             return ( a + 1 )
        }
        set(v){ a = v}
    } 
}
class Coo <: Boo {
}

