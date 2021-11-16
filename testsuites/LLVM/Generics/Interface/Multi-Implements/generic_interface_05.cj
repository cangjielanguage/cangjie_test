// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f


func main(): Int64 {
    if ( C<String>().m != 1 ){
        return 1
    }
    return 0
}

open class A1<T> {
    func foo(){
        return 1
    }
}
open class A2<T> {
    func foo(){
        return 1
    }
}
class B<T> <: A1<T> & A2<T>{ // EXPECTED: regex error.*?only one super class may appear in supertype list of class 'B'
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}


