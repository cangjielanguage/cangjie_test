// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait C{
    func asFunc(input:This):Int64
}

append Map<Int64,Int64> with C{
    func asFunc(input:Map<Int64,Int64>):Int64{0}
}



func main(): Int64 {
    var a : Map<Int64,Int64> = {1:1}
    return a()
}
