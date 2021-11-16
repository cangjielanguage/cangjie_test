// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface Base {
    static func foo () {
        return 1
    }
}

interface Data <: Base {
    static func foo (a : Int64) {
        return a
    }

    static func foo (a : Int64, b: Bool , c!: Bool = true) { // EXPECTED: regex parameter 'c' cannot have default value in abstract function 'foo'
        if(b){
            return 1
        } else {
            return a
        }
    }

    static func inside(){
        return foo() + foo(2) + foo(0, true)
    }
}

class Test <:Data{
    
}

func main(): Int64 {
    var res1 : Int64 = Test.foo()
    var res2 : Int64 = Test.foo(2)
    var res3 : Int64 = Test.foo(0, true)
    var res4 : Int64 = Test.inside()
    if ( res1 != 1 || res2 != 2 || res3 != 1 || res4 != 4) {
        return 1
    }
    return 0
}