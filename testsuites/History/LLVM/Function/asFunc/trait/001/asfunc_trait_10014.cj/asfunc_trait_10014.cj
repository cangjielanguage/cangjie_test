// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait C{
    func asFunc(input:This):Int64
}

append Unit with C{
    func asFunc(input:Unit):Int64{0}
}



func main(): Int64 {
    var a : Unit = ()
    return a()
}
