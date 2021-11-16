// DEPENDENCE: b1.cj b2.cj b3.cj b.cfg
// EXEC: %compiler %cmp_opt -c b1.cj -o b1.o
// EXEC: %compiler %cmp_opt -c b2.cj -o b2.o
// EXEC: %compiler %cmp_opt -c b3.cj -o b3.o
// EXEC: %compiler %cmp_opt %f -import-config b.cfg b1.o b2.o b3.o -o %output
// EXEC: %run %run_opt %output %run_args
package pkg608
import b1.*
import b2.*
import b3.*

func test<T>() where T <: b1.A<T>, T<: b2.B<T>, T<: b3.C{}

record R<T> where T <: b1.A<T>, T<: b2.B<T>, T<: b3.C{}

enum E<T> where T <: b1.A<T>, T<: b2.B<T>, T<: b3.C{e}

class C<T> where T <: b1.A<T>, T<: b2.B<T>, T<: b3.C{}

interface I<T> where T <: b1.A<T>, T<: b2.B<T>, T<: b3.C{}


trait R_X{}
record R2<T>{}
append<T> R2<T> with R_X where T <: b1.A<T>, T<: b2.B<T>, T<: b3.C{}


func main():Int64{
    return 0
}
