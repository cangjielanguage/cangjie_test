// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return run()
}

var a:Float64 = 3.14
var b:Float64 = 3.14
var c:Float64 = 3.15

func run(): Int64 {
    var res = Foo()
    if (res == false){
        return 0
    }
    return 1
}

func Foo(a!: Bool = (a==b)&&(a!=c)&&(a<c)&&(a<=c)&&(c>=a)&&(a>c)): Bool{
    return a
}
