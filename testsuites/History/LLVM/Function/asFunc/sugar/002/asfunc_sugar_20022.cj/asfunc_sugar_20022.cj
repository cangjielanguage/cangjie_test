// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


trait X {
    func asFunc(input:This):This
}
append Char with X{
    func asFunc(input:Char):Char{input}
}


func main(): Int64 {
    chr(1)()
    return 0
}
