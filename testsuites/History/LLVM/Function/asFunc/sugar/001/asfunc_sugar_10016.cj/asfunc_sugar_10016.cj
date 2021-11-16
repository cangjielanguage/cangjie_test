// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


trait X {
    func asFunc(input:This):This
}
append Bool with X{
    func asFunc(input:Bool):Bool{input}
}
record A{
    var x : Bool = true ()
    var y : Bool = false()
}


func main(): Int64 {
    
    return 0
}
