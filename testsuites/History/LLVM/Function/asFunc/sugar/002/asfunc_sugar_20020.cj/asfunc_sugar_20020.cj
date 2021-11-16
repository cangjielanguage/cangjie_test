// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


trait X {
    func asFunc(input:This):This
}
append Int32 with X{
    func asFunc(input:Int32):Int32{input}
}


func main(): Int64 {
    Int32(1)()
    return 0
}
