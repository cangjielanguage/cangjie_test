// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X{
    func test(a:This):This
}

append ArrayList<Unit> with X{
    func test(a:ArrayList<Unit>):ArrayList<Unit>{a}
}

func main(): Int64 {
    return 0
}