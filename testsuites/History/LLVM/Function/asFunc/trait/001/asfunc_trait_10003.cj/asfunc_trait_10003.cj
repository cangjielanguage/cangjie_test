// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait C{
    func asFunc(input:This):Int64
}

append Int32 with C{
    func asFunc(input:Int32):Int64{0}
}



func main(): Int64 {
    var a : Int32 = 1
    return a()
}
