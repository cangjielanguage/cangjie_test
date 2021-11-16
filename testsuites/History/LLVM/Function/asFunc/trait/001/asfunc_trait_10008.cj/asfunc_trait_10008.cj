// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait C{
    func asFunc(input:This):Int64
}

append UInt64 with C{
    func asFunc(input:UInt64):Int64{0}
}



func main(): Int64 {
    var a : UInt64 = 1
    return a()
}
