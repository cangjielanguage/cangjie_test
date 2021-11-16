// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res = Foo()
    if (res == 4){
        return 0
    }
    return 1
}

func Foo(a!: Int64 = -(1+2-3*6/2%2)**2): Int64{
    return a
}
