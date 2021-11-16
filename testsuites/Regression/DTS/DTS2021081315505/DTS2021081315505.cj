// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

interface A<T> where T<:B<T>{}
interface B<T> where T<:A<T>{}

open class C<T> t %f -o %output

interface A<T> where T<:B<T>{}
interface B<T> where T<: A<C<T>> &B<C<T>>{}

class D <: C<D>{}

func main(){
    return 0
