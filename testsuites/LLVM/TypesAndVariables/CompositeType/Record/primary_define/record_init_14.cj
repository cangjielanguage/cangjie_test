// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record GenRec{
    var b: Int32 =1
    var c: Int64 =2
    GenRec( b: Int32, c: Int64) {
        this.b = b
        this.c = c
    }
    init(str:String){
        this()
    }
    init() {}
}

func main():Int64{
    var rec = GenRec("hi")
    if (rec.c == 2) {
        return 0
    }
    return 1
}
