// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


interface A{
    static func test(a:ArrayList<Unit>):ArrayList<Unit>{a}
    let x : (ArrayList<Unit>) -> ArrayList<Unit> = (input:ArrayList<Unit>):ArrayList<Unit> => {input}
    let a : ArrayList<Unit> = ArrayList<Unit>(10)
    let b : ArrayList<Unit> = A.test(a)
    let c : ArrayList<Unit> = A.x(a)
}

interface B<T>{
    static func test(a:ArrayList<T>):ArrayList<T>{a}
    let x : (ArrayList<T>) -> ArrayList<T> = (input:ArrayList<T>):ArrayList<T> => {input}
    let a : ArrayList<T> = ArrayList<T>(10)
    let b : ArrayList<T> = B<T>.test(a)
    let c : ArrayList<T> = B<T>.x(a)
}

func main(): Int64 {
    return 0
}