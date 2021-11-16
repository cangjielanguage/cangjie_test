// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E<T> {
    | A(T)
    | B(T)
}
func f() {
    let a = A(1)  // ok, a: E<Int64>
    let b = A<Int32>(2)  // ok, b: E<Int32>
}


func main(){
    f()
    return 0
}

