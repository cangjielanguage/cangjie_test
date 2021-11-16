// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A{
    let a = ():Unit=>{}
    static func i():Unit{a()}
    static func test():Unit{i()}
}

class B{
    static var a = ():Unit=>{}
    static func i():Unit{a()}
    static func test():Unit{i()}
}

abstract class C{
    static var a = ():Unit=>{}
    static func i():Unit{a()}
    static func test():Unit{i()}
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