// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Data{
    var i: Int64
    private init(x: Int32){
        var i = 3
        this.i = i
    }
}
class Data2{
    var i: Int64
    static private init(x: Int32){  //EXPECTED: regex 'static' modifier is illegal for constructor in class body
        var i = 3
        this.i = i
    }
}

func main():Int64{
    var data = Data(Int32(3))   //EXPECTED: regex no matching constructor for call 'Data'
    if (data.i == 3) {
        return 0
    }
    return 1
}
