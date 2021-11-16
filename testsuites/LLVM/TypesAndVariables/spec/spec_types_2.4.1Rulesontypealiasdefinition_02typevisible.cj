// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class LongNameClassA {
    class LongNameClassB {
    }       
}

func main(){
    type ClassB = LongNameClassB // EXPECTED: regex undeclared type name 'LongNameClassB'
    return 0
}

