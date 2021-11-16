// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f


func main(): Int64 {
    if ( B<Base,Base>().m != 1 ){ // EXPECTED: regex error.*?class 'B' inherits or implements duplicate interface 'I'
        return 1
    }
    return 0
}

interface I<T> {
    func foo():Int64{
        return 1
    }
}

class B<T,V> <: I<T> & I<V> where T<: Base,V<:Base {
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}
open class Base{}
