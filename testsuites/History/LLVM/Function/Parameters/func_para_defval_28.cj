// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res = Foo()
    if( res == "fir") {
        return 0
    }
    return 1
}

func Foo(a!:Map<Int32, String> = #{1 : "Aa", 2 : "Bb", 3 : "Cc", 1 : "fir"}):String{

    return match( a.get(1)){
        case Some(x) => x
        case _ => ""
    }
}

