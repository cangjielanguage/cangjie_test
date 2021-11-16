// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


trait X {
    func asFunc(input:This):This
}
append String with X{
    func asFunc(input:String):String{input}
}

var a = "a"


func main(): Int64 {
    "${a()}"
    return 0
}
