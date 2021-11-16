// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait C{
    func asFunc(input:This):Int64
}

append Int16 with C{
    func asFunc(input:Int16):Int64{0}
}



func main(): Int64 {
    var a : Int16 = 1
    return a()
}
