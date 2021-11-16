// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res = Foo()
    if( res == 2) {
        return 0
    }
    return 1
}

func Foo(a!:Array<Int64>=@{1,2,3}):Int64{
    return a[1]
}

