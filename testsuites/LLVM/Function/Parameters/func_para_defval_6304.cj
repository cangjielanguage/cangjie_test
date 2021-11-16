// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return run()
}

var x:Int64 = 2

func run(): Int64 {
    var res1 = Foo
    var res2 = res1(3)
//    print(res2.toString()+"\n")
    if (res2 == 6){
        return 0
    }
    return 1
}

func Foo(a!:Int64=x):Int64{
    return a*2
}



