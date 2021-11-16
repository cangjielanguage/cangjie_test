// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A{
    let a : Int64 = 1
    static func i():Int64{C.a}
    static func test():Int64{B.i()}
}

class B{
    static let a : Int64 = 1
    static func i():Int64{A.a}
    static func test():Int64{C.i()}
}

abstract class C{
    static let a : Int64 = 1
    static func i():Int64{B.a}
    static func test():Int64{A.i()}
}

func main(){
    if A.a + A.test() != 2{
        return 1
    }
    if B.a + B.test() != 2{
        return 2
    }
    if C.a + C.test() != 2{
        return 3
    }
    return 0
}