// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res = Foo(1)
    if (res == 3){
        return 0
    }
    return 1
}

func Foo(a:Int64,A!:Int64=2){
    return a+A
}

