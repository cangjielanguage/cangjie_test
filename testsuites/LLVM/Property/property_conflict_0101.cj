// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {

    return 0
}


class Foo{
    var a: Int32 = 1
    let b: Int32 = 1
    static var c: Int32 = 1
    static let d: Int32 = 1
    open prop var m:Int32 {
        get(){
             return ( this.a + b + c + d )
        }
        set(input){
             a = input + 1
             c = input + 1
        }
    }
    open prop let m:Int32 { // EXPECTED: regex redefinition of declaration 'm'
        get(){
             return ( (a + this.b + c + d)*2 )
        }
    }
}
