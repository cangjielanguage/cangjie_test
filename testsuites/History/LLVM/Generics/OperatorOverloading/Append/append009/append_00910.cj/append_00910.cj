// DEPENDENCE: c.cj c.cfg
// EXEC: %compiler %cmp_opt -c c.cj -o c.o
// EXEC: %compiler %cmp_opt %f -import-config c.cfg c.o -o %output
// EXEC: %run %run_opt %output %run_args
package pkg910
import c.*

trait update{
    operator func + (a:This,b:This):Bool
}

append<X> A<X> with update {
    operator func +(a:A<X>,b:A<X>):Bool  {true}
}

func main(): Int64 {
    var a : A<Int8> = A<Int8>()
    var b : A<Int8> = A<Int8>()
    if (!(b+a)) {
        return 1
    }
    return 0
}
