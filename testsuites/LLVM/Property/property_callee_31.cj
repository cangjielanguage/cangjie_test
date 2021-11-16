// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

record Boo{
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
    var b:Int32 = n // EXPECTED: regex error.*?'n' is not allowed to be accessed before all member variables are initialized
    var c:Unit = ( m = 1) // a = 2,c = () // EXPECTED: regex error.*?'m' is not allowed to be accessed before all member variables are initialized
    var d:Int32 = n // a =2 ,d = 2 // EXPECTED: regex error.*?'n' is not allowed to be accessed before all member variables are initialized
    var e:Int32 = m // a = 2,e = 2 // EXPECTED: regex error.*?'m' is not allowed to be accessed before all member variables are initialized
}

