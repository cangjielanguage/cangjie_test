// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record MyRecord {
    MyRecord(let a : Int32) {}
}
func main(): Int64 {
    var a = MyRecord(1)
    var b = MyRecord(2)
    let myArray0 : Array<MyRecord> = @{a,b,MyRecord(3)}
    return 0
}
