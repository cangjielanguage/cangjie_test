// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A{
    let a = ():Unit=>{}
    static func i(input!:()->Unit=a):Unit{input()}
    let b = a()
    let c = i()
}

class B{
    static var a = ():Unit=>{}
    static func i(input!:()->Unit=a):Unit{input()}
    let b = a()
    let c = i()
}

abstract class C{
    static var a = ():Unit=>{}
    static func i(input!:()->Unit=a):Unit{input()}
    let b = a()
    let c = i()
}

func main(){
    A.a()
    B.a()
    C.a()
    return 0
}
