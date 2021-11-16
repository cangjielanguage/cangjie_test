// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

abstract class Base {
    func foo (): Int64
}

abstract class Base1 <: Base{
    func foo (): Int64
}

abstract class Base2 <: Base1 {
    func foo (): Int64
}

abstract class Base3 <: Base1 {
    func foo (): Int64
}


class Data <: Base3 {
    func foo () {
        return 1
    }

    func foo (a : Int64) {
        return a
    }

    func insede(){
        super.foo()  // EXPECTED: regex abstract method 'foo' cannot be accessed directly
    }
}

func main(): Int64 {
    var res1 : Int64 = Data().foo()
    var res2 : Int64 = Data().foo(2)
    if ( res1 != 1 || res2 != 2) {
        return 1
    }
    return 0
}