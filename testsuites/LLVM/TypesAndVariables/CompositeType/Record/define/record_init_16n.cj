// EXEC: %compiler %cmp_opt %f -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

record GenRec{
    let b: Int32 =1
    var c: Int64 =2
    init(str:String){
        if (str == "hi") {
            this.b = 2
            this()      // EXPECTED: regex call to 'this' must be first expression in constructor of record 'GenRec'
            this.c= 4
        }else{
            this.b =b+2
            this.c =this.c+1
        }
    }
}

func main():Int64{
    var rec = GenRec("hi")
    print(rec.b.toString())
    print(rec.c.toString())
    if (rec.c == 4 && rec.b == 2) {
        return 0
    }
    return 1
}
