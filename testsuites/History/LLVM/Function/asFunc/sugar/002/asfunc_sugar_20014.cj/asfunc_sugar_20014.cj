// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


trait X {
    func asFunc(input:This):This
}
append Int64 with X{
    func asFunc(input:Int64):Int64{input}
}  
class A{
    static func f(input:Int64):Int64{0}
    static let a = 1
}

func main(): Int64 {
    A.f(1)()
    return 0
}
