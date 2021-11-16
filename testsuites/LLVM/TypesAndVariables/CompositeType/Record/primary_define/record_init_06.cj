// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record GenRec{
    var a: Int64
    GenRec(x: Int64, y:Int32, str:String){
        var x = x+1
        this.a = x
    }
    var b: Int32 = 1
}

func main():Int64{
    var data2 = GenRec(3, 4,"1")
    if (data2.a == 4 && data2.b == 1) {
        return 0
    }
    return 1
}
