// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class GenRec{
    var a: Int64
    var b: Int32
    init(x: Int64, y:Int32, str:String){
        // this.a = x
        init(x)
        this.b = y
    }
    private init(x:Int64){  // EXPECTED: regex the uninitialized member variable 'b' is not initialized in the constructor of class or record
        this.a = x
    }
}

func main():Int64{
    var data2 = GenRec(3, 4,"1")
    if (data2.a == 3 && data2.b == 4) {
        return 0
    }
    return 1
}