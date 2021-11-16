// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res = Foo()
    if (res == ()){
        return 0
    }
    return 1
}

var b:Int32 = 2
var c:Int32 = 3
func Foo(a!: Unit = (b += c)) :Unit{
    return a
}
