// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

var res: Int32 = 0
class Aoo{
    static var a: Int32 = 1
    var b: Int32 = 1
    init(y:Char,x!:Int32=a){} // EXPECTED: regex-not error
    init(y:Int32,x!:Int32=b){} // EXPECTED: regex error.*?'b' is not allowed to be used in default parameter value of the constructor
    init(y:Int64,x!:Int32=a){
        var m = a // EXPECTED: regex-not error
        var n = this.b // EXPECTED: regex-not error
    }
}

record Boo{
    static var a: Int32 = 1
    var b: Int32 = 1
    init(y:Char,x!:Int32=a){} // EXPECTED: regex-not error
    init(y:Int32,x!:Int32=b){} // EXPECTED: regex error.*?'b' is not allowed to be used in default parameter value of the constructor
    init(y:Int64,x!:Int32=a){
        var m = a // EXPECTED: regex-not error
        var n = this.b // EXPECTED: regex-not error
    }
}

func main():Int64 {
    return 0
}
