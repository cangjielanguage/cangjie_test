// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res = Foo()
    if( res == 0 ){
        return 0
    }
    return 1
}

func Foo(a!:Range<Int64>=0..10:1):Int64{
    for (i in a) {
        return i
    }
    return 1
}

