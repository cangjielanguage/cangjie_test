// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not stack trace

open class A<X,Y>{}
open class B<X,Y> <: A<X,Y>{}
open class C<X,Y> <: A<X,Y>{}

func foo<Xot core dumped
open class A<X,Y>{}
open class B<X,Y> <: A<X,Y>{}
open class C<X,Y> <: A<X,,Y>(a: B<X,Y>, b: C<X,Y>): Int64 {1} // foo1
func foo<X,Y>(a: B<Y,X>, b: C<Y,X>) :Int64 {0} // foo2


func main() {
foo(B<Int32,Int64>(),C<Int32,Int64>())
}