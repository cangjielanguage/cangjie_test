// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Data {
    var b : Int32
    abstract Data(){//EXPECTED: regex 'abstract' modifier is illegal for constructor in record body
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

