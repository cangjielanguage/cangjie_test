// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data {
    var b : Int32
    internal Data(){ //EXPECTED: regex 'internal' modifier is illegal for constructor in class body
        this.b = 3
    }   
}

func run(): Int32 {
    var data: Data = Data()
    return data.b - 3
}

func main(): Int64 {
    return Int64(run())
}

