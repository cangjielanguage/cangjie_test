// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Data {
    var i: Int32 = 0
    Data(var a!: Int32 = i){// EXPECTED: regex 'i' is not allowed to be used in default parameter value of the constructor
    }
}

func run(): Int32 {
    var data: Data = Data()
    Data.i = 9
    var data2: Data = Data(a: 5)

    if( data.a == 0 && data2.a == 5){
        return 0
    }
    return 1
}

func main(): Int64 {
    return Int64(run())
}

