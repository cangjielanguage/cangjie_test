// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


trait X {
    func asFunc(input:This):This
}
append Float64 with X{
    func asFunc(input:Float64):Float64{input}
}



func main(): Int64 {
    0XFP-1()
    return 0
}
