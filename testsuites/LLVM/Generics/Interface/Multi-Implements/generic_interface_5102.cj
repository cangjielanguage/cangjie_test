// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func main(): Int64 {
    if ( B3<String>().m != 1 ){
        return 1
    }
    if ( B4<String>().m != 1 ){
        return 1
    }
    return 0
}

interface I<T> {
    func foo():Int64{
        return 1
    }
}

class B3<T> {}
extend B3<T> <: I<T> & I<T> { // EXPECTED: regex error.*? type 'Class-B3<Generics-T>' inherits or implements duplicate interface 'Interface-I<Generics-T>'
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}

class B4<String>{}
extend B4<String> <: I<String> &  I<String> { // EXPECTED: regex error.*?type 'Class-B4<Generics-String>' inherits or implements duplicate interface 'Interface-I<Generics-String>'
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}
