// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait C{
    func asFunc(input:This):Int64
}

append String with C{
    func asFunc(input:String):Int64{0}
}



func main(): Int64 {
    var a : String = "a"
    return a()
}
