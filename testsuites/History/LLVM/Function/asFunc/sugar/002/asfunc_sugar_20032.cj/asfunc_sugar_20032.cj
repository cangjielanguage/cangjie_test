// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


trait X {
    func asFunc(input:This):This
}
append Int64 with X{
    func asFunc(input:Int64):Int64{input}
}


func main(): Int64 {
    var a = (1,1)
    a[0]()
    return 0
}
