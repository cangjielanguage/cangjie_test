// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


trait X {
    func asFunc(input:This):This
}
append<T> T with X{
    func asFunc(input:T):T{input}
}


func main(): Int64 {
    var a = 1..10:1
    a()
    (1..10:1)()
    return 0
}
