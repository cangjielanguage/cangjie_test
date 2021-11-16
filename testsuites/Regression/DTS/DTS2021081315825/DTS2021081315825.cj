// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

interface B<P,Y,Z> where X <: B<X,Y,Z>, Y <: B<X,Y,Z>, Z <: B<X,Y,Z>{}

open class C <: B<C,C,C>{}

func main():Int64{
    return 0
}