// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res = Foo()
    print("${res}")
    if( res == 3) {
        return 0
    }
    return 1
}

func Foo(a!: Set<Int64> = #{5, 6, 7, 5}):Int64{
    return a.size()
}

