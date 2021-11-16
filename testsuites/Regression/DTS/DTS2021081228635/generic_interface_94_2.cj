// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f


func main(): Int64 {
    if ( B<String,String>().m != 1 ){ // EXPECTED: regex error.*?class 'B' inherits or implements duplicate interface 'I1'
        return 1
    }
    return 0
}

interface I1<T> {
    func foo():Int64{
        return 1
    }
}
interface I2<T> <: I1<T>{}
interface J<T,V> <: I1<T> & I1<V> {
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}

class B<T,V> <: J<T,V> {}