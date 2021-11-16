// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    var b = Boo()
    b.m = Int64(1) // EXPECTED: regex error.*?type incompatible in this assignment
    b.m = 'a' // EXPECTED: regex error.*?type incompatible in this assignment
    b.m = foo()
    return 0
}

record Boo{
    var a: Int32 = 1
    prop var m:Int32 {
        get(){
             return 1
        }
        set(input){
             a = input + 1
        }
    }
}

