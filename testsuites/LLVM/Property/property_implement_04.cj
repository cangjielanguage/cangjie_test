// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

record Boo{
    var a: Int32 = 1
    prop var m:Int32 {
        get(){
             return 'a' // EXPECTED: regex error.*?type of return expression is incompatible with return type
        }
        set(input){
             a = input + 1
        }
    }

    prop let n:Int32 {
        get(){
             return Int64(1) // EXPECTED: regex error.*?type of return expression is incompatible with return type
        }
    }
}

