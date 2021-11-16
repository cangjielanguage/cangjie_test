// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data {
    Data(var a: Bool, x: Bool){ // EXPECTED: regex member variable parameters must be listed behind all regular parameter
        this.a = a
    }
}

func run(): Int32 {
    var data: Data = Data(true, true)
    if(data.a){
    return 0
    }
    return 1
}
func main(): Int64 {
    return Int64(run())
}

