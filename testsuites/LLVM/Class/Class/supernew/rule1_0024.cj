// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Test<T, U>{
    var a: Int32 = 3

    Test(let i!: Int32 = this.a){ //EXPECTED: regex 'this' is not allowed to be used in default parameter value of the constructor
        
    }
}

func main(): Int64 {
    return 1
}
