// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    let b = Boo()
    b.m = 1 // EXPECTED: regex-auto cannot assign to value which is an initialized 'let' constant
    b.a = 3 // EXPECTED: regex-auto cannot assign to value which is an initialized 'let' constant
    return 0
}

record Boo{
    var a: Int32 = 1
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
}

