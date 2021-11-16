// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait C{
    func asFunc(input:This):Int64
}

append Float32 with C{
    func asFunc(input:Float32):Int64{0}
}



func main(): Int64 {
    var a : Float32 = 1.0
    return a()
}
