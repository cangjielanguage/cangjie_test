// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f


func main(): Int64 {
    if ( B<String>().m != 1 ){
        return 1
    }
    return 0
}

interface I<T> {
    func foo():Int64{
        return 1
    }
}

interface J1<T> <: I<T> & I<T> { // EXPECTED: regex error.*?interface 'J1' inherits or implements duplicate interface 'I'
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}

interface J2<T> <: I<String> & I<String> { // EXPECTED: regex error.*?interface 'J2' inherits or implements duplicate interface 'I'
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}

class B<T> <: J1<T> & J2<T>{}