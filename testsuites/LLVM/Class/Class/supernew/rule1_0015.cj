// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

abstract class Test{
    var a: Int32 = 3
    Test(let i!: Int32 = a){ //EXPECTED: regex 'a' is not allowed to be used in default parameter value of the constructor
        
    }
}

func main(): Int64 {
    return 1
}
