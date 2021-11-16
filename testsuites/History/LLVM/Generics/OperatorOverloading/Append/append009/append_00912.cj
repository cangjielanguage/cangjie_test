// DEPENDENCE: b.cj b.cfg
// EXEC: %compiler %cmp_opt -c b.cj -o b.o
// EXEC: %compiler %cmp_opt %f -import-config b.cfg b.o -o %output
// EXEC: %run %run_opt %output %run_args
package pkg912
import b.*

external record A<T>{}

append<X> A<X> with b.update {
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
