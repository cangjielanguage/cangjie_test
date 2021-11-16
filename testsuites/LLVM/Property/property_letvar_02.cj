// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {

    return 0
}

open class Boo{
    prop var a1:Int64 {
        get(){
            return 0
        }
        set(v) {}
    }
    prop var a2:Int64 {
        get(){
            return 0
        }
        set(v) // EXPECTED: regex error.*?function declaration must have function body
    }
    prop var a3:Int64 { // EXPECTED: regex illegal prop member in prop block
        get(){
            return 0
        }
    }
    prop var a4:Int64 { // EXPECTED: regex illegal prop member in prop block
        set(v) {}
    }
    prop let b1:Int64 {
        get(){
            return 0
        }
    }
    prop let b2:Int64 { // 'let' property cannot have setter
        get() {
            return 0
        }
        set(v) {}
    }

}
class Coo <: Boo {
}

