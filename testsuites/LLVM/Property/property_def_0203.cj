// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    var a = Doo()
    return 0
}

interface Boo{
    prop var m:Int32
    prop let n:Int32
}

interface Coo <: Boo  {
    prop var n:Int32 { // EXPECTED: regex property 'n' should be 'let'
        get(){
             return 1
        }
        set(input){
            ()
        }
    }
    prop let m:Int32 // EXPECTED: regex property 'm' should be 'var'
}

interface Eoo <: Boo  {
    prop var m:Int64 { // EXPECTED: regex The return type of the override/implement property must be the same
        get(){
             return 1
        }
        set(input){
            ()
        }
    }
    prop let n:Int64 // EXPECTED: regex The return type of the override/implement property must be the same
}

class Doo <: Coo{
    override prop var m:Int32 {
        get(){
             return ( 10 )
        }
        set(input){
             ()
        }
    }
    prop let n:Int32 {
        get(){
             return 20
        }
    }
}