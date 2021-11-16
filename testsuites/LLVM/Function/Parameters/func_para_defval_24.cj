// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res = Foo()
    if( res == "a\n") {
        return 0
    }
    return 1
}

func Foo(a!:Char='a',b!:Char='\n'):String{
    var res = a.toString()+b.toString()
    return res
}

