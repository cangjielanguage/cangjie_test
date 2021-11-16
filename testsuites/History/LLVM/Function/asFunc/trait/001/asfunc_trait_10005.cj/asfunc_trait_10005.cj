// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait C{
    func asFunc(input:This):Int64
}

append UInt8 with C{
    func asFunc(input:UInt8):Int64{0}
}



func main(): Int64 {
    var a : UInt8 = 1
    return a()
}
