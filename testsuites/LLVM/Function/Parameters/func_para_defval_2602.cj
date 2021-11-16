// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return run()
}

var x:String="opq"

func run(): Int64 {
    var res = Foo()
    if(res == "abc123\n456xyz\\nxyzlmnopq"){
        return 0
    }
    return 1
}

func Foo(a!:String="abc",b!:String="""
123\n456""",c!:String=##"xyz\nxyz"##,d!:String=String(['l','m','n']),e!:String=x):String{
    return a+b+c+d+e
}

