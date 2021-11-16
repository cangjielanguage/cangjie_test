// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f


func main(): Int64 {
    if ( B<String>().m != 1 ){
        return 1
    }
    return 0
}

interface A1<T> {
    func foo():Int64{
        return 1
    }
}
interface A2<T> {
    func foo():Int64{
        return 2
    }
}
class B<T> <: A1<T> & A2<T> { // EXPECTED: regex error.*? function 'foo' needs to be overridden
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}
