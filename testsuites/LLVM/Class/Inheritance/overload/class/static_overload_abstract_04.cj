// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

abstract class Base {
    static func foo () {
        return 1
    }
}

class Data <: Base {
    static func foo (a! : Int64 = 0, b!: Bool = true) {
        return a
    }

    static func foo (a : Int64, b: Bool , c!: Bool = true) {
        if(b){
            return 1
        } else {
            return a
        }
    }

    static func foo (a : Int64, b: Bool, c!: Float32 = 0.0) {
        if(b){
            return 1
        } else {
            return a
        }
    }

    static func inside(){
        return foo() // EXPECTED: regex ambiguous match for function call 'foo'
        + foo(0, true) // EXPECTED: regex ambiguous match for function call 'foo'
    }
}


func main(): Int64 {
    return 0
}