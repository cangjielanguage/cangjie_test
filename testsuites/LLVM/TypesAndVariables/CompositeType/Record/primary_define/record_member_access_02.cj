// EXEC: %compiler %cmp_opt %chircc %chir2llvm %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record GenRec{
    let b: Int32 = 1
    GenRec(str:String){
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
    print(res.toString()) //打印 rec.b==264。record改成class通过,打印rec.b==2
    if (res == 2) {
        return 0
    }
    return 1
}