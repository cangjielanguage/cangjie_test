// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record GenRec{
    var a: Int64
    var b: Int32 =1
    init(x: Int64, y:Int32, str:String){
        // this.a = x
        this(y,x)
        this.b = y
    }
    private GenRec(x: Int32, y: Int64){
        this.a = y
    }
}

func main():Int64{
    var data2 = GenRec(3, 4,"1")
    if (data2.a == 3 && data2.b == 4) {
        return 0
    }
    return 1
}
