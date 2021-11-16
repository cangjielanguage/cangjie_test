// EXEC: %compiler %cmp_opt %f -o %output 2>&1|compare %f

record GenRec{
    let a: Int64
    var b: Int32
    init(x: Int64, y:Int32, str:String){
        class Data{var a=3} // EXPECTED: regex  'class' is not allowed in block, expected expression or declaration here
        this.a = Data().a
    }
    var b: Int32 = 1
}

func main():Int64{
    var rec = GenRec(3, 4,"1")
    return 0
}