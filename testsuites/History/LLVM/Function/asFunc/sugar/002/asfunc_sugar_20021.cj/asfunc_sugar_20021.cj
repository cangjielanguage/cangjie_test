// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


trait X {
    func asFunc(input:This):This
}
append UInt32 with X{
    func asFunc(input:UInt32):UInt32{input}
}


func main(): Int64 {
    ord('1')()
    return 0
}
