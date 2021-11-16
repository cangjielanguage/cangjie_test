// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

open class Boo{
    prop var b:Int64 = {} // EXPECTED: regex error.*?illegal class member in class block
}
class Coo <: Boo {
}

