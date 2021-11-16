// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface Base {
    func foo (): Int64
}

interface Base1 <: Base{
    func foo (): Int64
}

interface Base2 <: Base1 {
    func foo (): Int64
}

interface Base3 <: Base1 {
    func foo (): Int64
}


interface Data <: Base3 {
    func foo () {
        return 1
    }

    func foo (a : Int64) {
        return a
    }

    func insede(){
        super.foo()  // EXPECTED: regex 'super' cannot be used in interface
    }
}

class Test <:Data{
    
}
func main(): Int64 {
    var res1 : Int64 = Test().foo()
    var res2 : Int64 = Test().foo(2)
    if ( res1 != 1 || res2 != 2) {
        return 1
    }
    return 0
}