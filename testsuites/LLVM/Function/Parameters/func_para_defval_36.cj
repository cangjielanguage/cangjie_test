// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res =  Foo()
    if(res == 11) {
        return 0
    }
    return 1
}

class Data{
    var a:Int64 =1
    var b:Int64 =2
    init(x:Int64,y:Int64) {
        a = x
        b = y
    }
    func foo():Int64 {
        return a+b
    }
}

func Foo(a!:Data=Data(5,6)):Int64{
    return a.foo()
}

