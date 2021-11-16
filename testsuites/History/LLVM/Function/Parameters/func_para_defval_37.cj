// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res =  Foo()
    if( res == 11 ) {
        return 0
    }
    return 1
}

interface Data{
    let a:Int64 =1
    let b:Int64 =2
    func foo():Int64
}

class Time <: Data{
    var a:Int64
    var b:Int64
    func foo():Int64 {
        return a+b
    }
    init(x:Int64,y:Int64){
        this.a = x
        this.b = y
    }

}


func Foo(a!:Data=Time(5,6)):Int64{
    return a.foo()
}

