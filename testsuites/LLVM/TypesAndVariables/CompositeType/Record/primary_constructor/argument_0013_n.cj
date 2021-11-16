// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Data {
    Data(var x!: Bool = x){ // EXPECTED: regex 'x' is not allowed to be used in default parameter value of the constructor
        
    }
}

func run(): Int32 {
    var data: Data = Data()

    if(data.x){
    return 0
    }
    return 1
}
func main(): Int64 {
    return Int64(run())
}

