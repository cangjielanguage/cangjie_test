// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


trait X {
    func asFunc(input:This):This
}
append List<Bool> with X{
    func asFunc(input:List<Bool>):List<Bool>{input}
}


func main(): Int64 {
    [true,false]()
    return 0
}
