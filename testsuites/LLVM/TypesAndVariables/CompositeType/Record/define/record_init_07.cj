// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record GenRec{
    let a: ()->Int64
    init(x: Int64, y:Int32, str:String){
        func foo():Int64{ return x }
        this.a = foo
    }
    var b: Int32 = 1
}

func main():Int64{
    var rec = GenRec(3, 4,"1")
    print(rec.a().toString() +"\n")
    print(rec.b.toString())
    if (rec.a() == 3 && rec.b == 1) {
        return 0
    }
    return 1
}