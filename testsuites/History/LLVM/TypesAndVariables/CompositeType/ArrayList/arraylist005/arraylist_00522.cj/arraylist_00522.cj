// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X {
    func test(a:This,b:ArrayList<Unit>):ArrayList<Unit>
}

append Unit with X{
    func test(a:Unit,b:ArrayList<Unit>):ArrayList<Unit>{b}
}

func main(): Int64 {
    return 0
}