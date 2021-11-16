// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


trait X {
    func asFunc(input:This):This
}
append Unit with X{
    func asFunc(input:Unit):Unit{input}
}


func main(): Int64 {
    (do {false} while (false)())
    return 0
}
