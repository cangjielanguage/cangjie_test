// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Data{
    var a:Int64 = 3
}

record GenRec{
    let b: String
    var c: Float64
    GenRec(){
        var tpl =(3.14,(2, "hi"))
        a = tpl
        this.b = this.a[1][1]
        this.c = this.a[0]
    }
    let a: Float64*(Int64*String)

}

func main():Int64{
    var rec = GenRec()
    if (rec.b == "hi" && rec.c == 3.14) {
        return 0
    }
    return 1
}