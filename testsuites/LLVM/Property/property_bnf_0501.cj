// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

open class Boo{
    prop let a:Int64 // EXPECTED: regex error.*?property 'a' can not be abstract
}
class Coo <: Boo {
}

