// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class A<T> where v <: A<T>{}

class AA <: A<AA>{}

func main():Int64{
    return 0
}