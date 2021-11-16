// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return run()
}

func run(): Int64 {
    if ( Foo2() == ()){
        return 0
    }
    return 1
}

var a: Int32 = 3
var b: Int32 = 4
func Foo2(c!:Unit = if(a<b){a+1}):Unit{
    return c
}
