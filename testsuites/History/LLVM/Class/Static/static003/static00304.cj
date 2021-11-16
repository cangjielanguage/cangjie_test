// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A{
    let a : Int64 = 1
    static func test():Int64{1}
}

interface X <: A{
    let a : Int64 = 2
    static func test():Int64{2}
}


open class B{
    static let a : Int64 = 1
    static func test():Int64{1}
}

class Y <: B{
    static let a : Int64 = 3
    static func test():Int64{3}
}

abstract class C{
    static let a : Int64 = 1
    static func test():Int64{1}
}

abstract class Z <: C{
    static let a : Int64 = 4
    static func test():Int64{4}
}

func main(){
    if X.a != 2{
        return 2
    }
    if X.test() != 2{
        return 3
    }
    if Y.a != 3{
        return 4
    }
    if Y.test() != 3{
        return 5
    }
    if Z.a != 4{
        return 6
    }
    if Z.test() != 4{
        return 7
    }
    return 0
}