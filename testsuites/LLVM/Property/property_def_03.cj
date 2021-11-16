// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    var b = Boo()
    return 0
}

record Boo{
    var a: Int32 = 1
    let b: Int32 = 1
    static var c: Int32 = 1
    static let d: Int32 = 1
    prop var m:Int32 {
        get(){
             return ( a + b + c + d )
        }
        set(input){
             a = input + 1
             c = input + 1
        }
    }

    func set(input:Int32){
        a = input + 1  // EXPECTED: regex instance member variable 'a' cannot be modified in immutable function
        b = input + 1  // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
        c = input + 1
    }

    prop let n:Int32 {
        get(){
             a++
             c++
             return ( (a + b + c + d)*2 )
        }
    }
}