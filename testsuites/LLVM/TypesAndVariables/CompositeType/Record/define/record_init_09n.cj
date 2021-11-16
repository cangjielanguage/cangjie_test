// EXEC: %compiler %cmp_opt %f -o %output 2>&1|compare %f

record GenRec{
    init(x: Int64, y:Int32, str:String){
        record Data{}       // EXPECTED: regex 'record' is not allowed in block, expected expression or declaration here
    }
}

func main():Int64{
    var data2 = GenRec(3, 4,"1")
    return 0
}