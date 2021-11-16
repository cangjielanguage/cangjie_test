// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
interface Y{}

class X <: Y{}

trait R_X{ func bar(a:This):Unit }

record R2<T>{}

append<T> R2<T> with R_X where T <: X, T <: Y{ func bar(a:R2<T>){} }

func main():Int64{

    bar(R2<Y>()) // EXPECTED: regex no matching function declaration for function call

    return 0
}
