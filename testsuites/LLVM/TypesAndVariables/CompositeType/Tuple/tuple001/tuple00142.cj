// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    func func1(a:Int32) : Int32{return 1}
    var f : (Int32)->Int32 = func1
    let myTuple : ((Int32)->Int32)*((Int32)->Int32) = (f,f)
    return 0
}
