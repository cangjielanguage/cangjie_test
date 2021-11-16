// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record MyRecord{
    MyRecord(var a : Int32) { }
}

func main(): Int64 {
    var a = MyRecord(1)
    var MyTuple : MyRecord*MyRecord = (a,MyRecord(1))
    return 0
}
