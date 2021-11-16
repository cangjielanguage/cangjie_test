// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


record A{
    func test(a:ArrayList<Unit>):ArrayList<Unit>{a}
    let x : (ArrayList<Unit>) -> ArrayList<Unit> = { input:ArrayList<Unit> => input}
    let a : ArrayList<Unit> = ArrayList<Unit>(10)
    // let b : ArrayList<Unit> = test(a) // non static member function 'test' cannot be accessed before finishing initialization of the record
    let c : ArrayList<Unit> = x(a)
}

record B<T>{
    func test(a:ArrayList<T>):ArrayList<T>{a}
    let x : (ArrayList<T>) -> ArrayList<T> = { input:ArrayList<T> => input}
    let a : ArrayList<T> = ArrayList<T>(10)
    // let b : ArrayList<T> = test(a) // non static member function 'test' cannot be accessed before finishing initialization of the record
    let c : ArrayList<T> = x(a)
}

func main(): Int64 {
    A()
    B<Unit>()
    return 0
}