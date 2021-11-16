// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    var x = Doo()
    if(x.a != 1 ){
        return 1
    }
    if(x.b != 1 ){
        print("${x.b}")
        return 2
    }
    if(x.c != () ){
        return 3
    }
    if(x.d != 2 ){
        return 4
    }
    if(x.e != 2 ){
        return 5
    }
    return 0
}

open class Boo{
    prop var m:Int32 {
        get(){
             return a
        }
        set(input){
             a = input + 1
        }
    }
    prop let n:Int32 {
        get(){
             return a
        }
    }
    var a:Int32 = 1 // a = 1
}

class Doo <: Boo{
    var b:Int32 = n // EXPECTED: regex 'n' is not allowed to be accessed before all member variables are initialized
    var c:Unit = ( m = 1) // EXPECTED: regex 'm' is not allowed to be accessed before all member variables are initialized
    var d:Int32 = n // EXPECTED: regex 'n' is not allowed to be accessed before all member variables are initialized
    var e:Int32 = m // EXPECTED: regex 'm' is not allowed to be accessed before all member variables are initialized
}

