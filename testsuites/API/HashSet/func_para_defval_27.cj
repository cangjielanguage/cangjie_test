// EXEC: %compiler %stdx_cmp_opt %n.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
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

func Foo(a!: HashSet<Int64> = HashSet<Int64>([5, 6, 7, 5])):Int64{
    return a.size()
}

