// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {

    return 0
}

func foo<T>(x:A):A{return x}
func foo<T>(x:T):T{return x}

open class A {
    var a:Int32
    init(x:Int32){ a = x + 1 }
    func foo(x:B){
        return 1
    }
}

class B <: A {
    var b:Int32
    init(x:Int32){
        super(x)
        b = x
    }
    func foo(x:A){
        return 2
    }
}

