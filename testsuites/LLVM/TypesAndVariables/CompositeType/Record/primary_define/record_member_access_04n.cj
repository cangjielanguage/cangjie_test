// EXEC: %compiler %cmp_opt %f -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

record GenRec{
    GenRec(let b: Int32 = 1) {}
    init(str:String){
        this.b = foo()
    }
    private func foo(): Int32 {
        return b+1
    }
}

func main():Int64 {
    var rec = GenRec()
    var res = rec.foo()  // EXPECTED: regex no matching function declaration for function call
    if (res == 2) {
        return 0
    }
    return 1
}
