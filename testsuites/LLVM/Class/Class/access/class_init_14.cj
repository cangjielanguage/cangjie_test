// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class GenRec{
    var b: Int32 =1
    var c: Int64 =2
    init(str:String){
        this()
    }
    init(){
        this.b=1
        this.c=3
    }
}

func main():Int64{
    var rec = GenRec("hi")
    if (rec.c == 3) {
        return 0
    }
    return 1
}
