// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res = Foo()
    if( res == (1,1)) {
        return 0
    }
    return 1
}

func Foo(a!:Int32*Int32 = (1,1)):Int32*Int32{
    return a

}
