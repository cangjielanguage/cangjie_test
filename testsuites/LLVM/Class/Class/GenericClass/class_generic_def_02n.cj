// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data T> {  // EXPECTED: regex-auto expected '<:' to inherit or '{' to open a scope
    let count: T

    init(x: T){
        count = x
    }
}

func main(): Int64 {
    var i: Int32 = 2
    let data: Data<Int64> = Data<Int64>(i)
    return 0
}

