// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args

interface A{
    func i(){}
    static func test(){X().i()}
}

class X <: A{}

class B{
    func i(){}
    static func test(){B().i()}
}

abstract class C{
    func i(){}
    static func test(){Y().i()}
}

class Y <: C{}

func main(){
    X.test()
    B.test()
    Y.test()
    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
