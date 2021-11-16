// DEPENDENCE: a1.cj a2.cj a3.cj a.cfg
// EXEC: %compiler %cmp_opt -c a1.cj -o a1.o
// EXEC: %compiler %cmp_opt -c a2.cj -o a2.o
// EXEC: %compiler %cmp_opt -c a3.cj -o a3.o
// EXEC: %compiler %cmp_opt %f -import-config a.cfg a1.o a2.o a3.o -o %output
// EXEC: %run %run_opt %output %run_args
package pkg608
import a1.*
import a2.*
import a3.*

func test<T>() where T <: a1.A, T<: a2.B, T<: a3.C{}

record R<T> where T <: a1.A, T<: a2.B, T<: a3.C{}

enum E<T> where T <: a1.A, T<: a2.B, T<: a3.C{e}

class C<T> where T <: a1.A, T<: a2.B, T<: a3.C{}

interface I<T> where T <: a1.A, T<: a2.B, T<: a3.C{}


trait R_X{}
append<T> R<T> with R_X where T <: a1.A, T<: a2.B, T<: a3.C{}


func main():Int64{
    return 0
}
