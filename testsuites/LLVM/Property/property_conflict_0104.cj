// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {

    return 0
}

class Eoo{
    var a: Int32 = 1
    let b: Int32 = 1
    static var c: Int32 = 1
    static let d: Int32 = 1
    open prop var m:Int32 { 
        get(){ // EXPECTED: regex function 'get' has overload conflicts
             return ( this.a + b + c + d )
        }
        set(input){ // EXPECTED: regex function 'set' has overload conflicts
             a = input + 1
             c = input + 1
        }
    }

    open prop var m:Int32 { // EXPECTED: regex redefinition of declaration 'm'
        get(){ // EXPECTED: regex function 'get' has overload conflicts
             return ( this.a + b + c + d )
        }
        set(x){ // EXPECTED: regex function 'set' has overload conflicts
             a = x + 1
             c = x + 1
        }
    }

}

