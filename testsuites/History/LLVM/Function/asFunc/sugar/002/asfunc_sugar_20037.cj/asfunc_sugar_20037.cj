// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


trait X {
    func asFunc(input:This):This
}
append List<Int64> with X{
    func asFunc(input:List<Int64>):List<Int64>{input}
}



func main(): Int64 {
    [1]()
    return 0
}
