// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

var res:Int32 = 0
var b: Int32 = 1
var c = if(true){
    var a: Int32 = 1
    func foo1(x!:Int32=a){return x}
    func foo2(){var x = a;return x}
    func foo3(){return a}
    func foo4(){ a ; return Int32(1)}
    func foo5(){ a }

    func foo6(x!:Int32=b){return x}
    func foo7(){ b }
    res += foo1()
    res += foo2()
    res += foo3()
    res += foo4()
    res += foo5()
    res += foo6()
    res += foo7()
}

func main():Int64 {
    if ( res != 7 ){
        return 1
    }
    return 0
}
