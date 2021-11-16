// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a = Aoo()
    if ( a.goo1()(2) != 2){
        return 1
    }
    if ( a.goo2()() != 2){
        return 2
    }
    if ( a.goo3()() != 2){
        return 3
    }
    if ( a.goo4()() != 2){
        return 4
    }
    if ( a.goo5()() != 1){
        return 5
    }
    if ( a.goo6()() != 1){
        return 6
    }
    return 0
}

record Aoo{
    var a: Int32 = 1
    static var b:Int32 = 1
    func foo1(x!:Int32=a+b){return x}
    func foo2(){var x = a+b;return x}
    func foo3(){return a+b}
    func foo4(){ a+b ; return Int32(2)}
    func foo5(){ a }
    func foo6(){ b }

    func goo1(){
        var a = foo1
        return a
    }
    func goo2(){
        var a = foo2
        return a
    }
    func goo3(){
        var a = foo3
        return a
    }
    func goo4(){
        var a = foo4
        return a
    }
    func goo5(){
        var a = foo5
        return a
    }
    func goo6(){
        var a = foo6
        return a
    }
}
