// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Data{
    var a:Int64 = 3
}

class GenRec{
    let a: Int64
    init(x: Int64, y:Int32, str:String){
        this.a = Data().a
    }
    var b: Int32 = 1
}

func main():Int64{
    var rec = GenRec(3, 4,"1")
    if (rec.a == 3 && rec.b == 1) {
        return 0
    }
    return 1
}