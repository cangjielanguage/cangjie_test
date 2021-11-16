// EXEC: %compiler %frontend %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not core dump

record GenRec{
    let b: Int32 =1
    var c: Int64 =2
    init( b: Int32, c: Int64) {
        this.b = b             // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
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
