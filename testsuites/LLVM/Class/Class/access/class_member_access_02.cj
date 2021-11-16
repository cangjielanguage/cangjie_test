// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class GenRec{
    var b: Int32 = 1
    init(str:String){
        this.b = foo()
    }
    private func foo(): Int32 {
        var a = b+1
        return a
    }
//    public func bar():Int32{
//        foo()
//    }
}

func main():Int64 {
    var rec = GenRec("hi")
    var res = rec.b
    print(res.toString())
    if (res == 2) {
        return 0
    }
    return 1
}
