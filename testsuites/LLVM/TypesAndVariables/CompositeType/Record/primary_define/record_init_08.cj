// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record GenRec{
    let a: ()->Int64
    GenRec(x: Int64, y:Int32, str:String){
        var foo = {  => return x}
        this.a = foo
    }
    var b: Int32 = 1
}

func main():Int64{
    var data2 = GenRec(3, 4,"1")
    print(data2.a().toString() +"\n")
    print(data2.b.toString())
    if (data2.a() == 3 && data2.b == 1) {
        return 0
    }
    return 1
}
