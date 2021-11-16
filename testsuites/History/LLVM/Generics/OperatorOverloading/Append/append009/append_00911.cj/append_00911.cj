// DEPENDENCE: c.cj c.cfg
// EXEC: %compiler %cmp_opt -c c.cj -o c.o
// EXEC: %compiler %cmp_opt %f -import-config c.cfg c.o -o %output
// EXEC: %run %run_opt %output %run_args
package pkg911
import c.*

trait update{
    operator func + (a:This,b:This):Bool
}

append<X> c.A<X> with update {
    operator func +(a:c.A<X>,b:c.A<X>):Bool  {true}
}

func main(): Int64 {
    var a : c.A<Int8> = c.A<Int8>()
    var b : c.A<Int8> = c.A<Int8>()
    if (!(b+a)) {
        return 1
    }
    return 0
}
