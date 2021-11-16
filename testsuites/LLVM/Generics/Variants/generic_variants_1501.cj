// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    if ( B<String>("a").a != "a" ){
        return 1
    }
    return 0
}

open class A<T> {
    var x:T
    init(y:T){
        x = y
    }
}

class B<V> <: A<V> {
    init(n:String){
        super(n) // EXPECTED: regex error.*?parameters and arguments mismatch
    }
    prop let a:V{
        get(){
            return x
        }
    }
}
