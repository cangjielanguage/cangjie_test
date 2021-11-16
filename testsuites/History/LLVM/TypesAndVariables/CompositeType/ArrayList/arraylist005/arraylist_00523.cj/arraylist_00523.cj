// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X<T> {
    func test(a:This,b:ArrayList<T>):ArrayList<T>
}

append<T> Unit with X<T>{
    func test(a:Unit,b:ArrayList<T>):ArrayList<T>{b}
}

func main(): Int64 {
    test((),ArrayList<Unit>())
    return 0
}