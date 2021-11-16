// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A{
    let a = ():Unit=>{}
    static func i():Unit{C.a()}
    static func test():Unit{B.i()}
}

class B{
    static var a = ():Unit=>{}
    static func i():Unit{A.a()}
    static func test():Unit{C.i()}
}

abstract class C{
    static var a = ():Unit=>{}
    static func i():Unit{B.a()}
    static func test():Unit{A.i()}
}

func main(){
    A.a()
    A.test()
    B.a()
    B.test()
    C.a()
    C.test()
    return 0
}