// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f


func main(): Int64 {
    if ( C<String>().m != 1 ){
        return 1
    }
    return 0
}

open class A<T> {
    func foo(){
        return 1
    }
}

interface I<T> <: A<T> { // EXPECTED: regex error.*?interface 'I' can only inherit interface
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}

class C<T> <: I<T>{}
