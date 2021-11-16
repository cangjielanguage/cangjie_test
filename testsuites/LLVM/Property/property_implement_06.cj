// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

record Boo{
    var a: Int32 = 1
    prop var m1:Int32 {
        get(){
             return 1
        }
        set(input){
             a = input + 1
             return 1 // EXPECTED: regex error.*?type of return expression is incompatible with return type
        }
    }
    prop var m2:Int32 {
        get(){
             return 1
        }
        set(input){
             a = input + 1
             if(true){ return 1 } // EXPECTED: regex error.*?type of return expression is incompatible with return type
        }
    }
    prop var m3:Int32 {
        get(){
             return 1
        }
        set(input){
             a = input + 1
             match (a) {
                 case _ => 1
             }
        }
    }
}

