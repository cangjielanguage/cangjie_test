// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return run()
}

func run(): Int64 {
    if ( Foo() == ()){
        return 0
    }
    return 1
}

var a:Array<Int64> = @{0,1, 2, 3, 4}

func Foo(c!:Unit = for (i in a) {
        print(a[i].toString())
    }
):Unit{
    return c
}
