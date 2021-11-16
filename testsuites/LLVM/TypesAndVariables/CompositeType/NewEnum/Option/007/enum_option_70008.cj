// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class B{}
class A<T> where T<:B{}

func main(): Int64 {
    A<?B>() // EXPECTED: regex generics type arguments do not match the constraint
    return 0
}
