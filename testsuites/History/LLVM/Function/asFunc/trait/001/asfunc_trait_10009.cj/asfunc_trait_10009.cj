// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait C{
    func asFunc(input:This):Int64
}

append Float16 with C{
    func asFunc(input:Float16):Int64{0}
}



func main(): Int64 {
    var a : Float16 = 1.0
    return a()
}
