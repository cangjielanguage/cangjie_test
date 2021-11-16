// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f


func main(): Int64 {
    if ( B<String>().m != 1 ){
        return 1
    }
    if ( B2<String>().m != 1 ){
        return 1
    }
    return 0
}

interface I<T> {
    func foo():Int64{
        return 1
    }
}

class B<T> <: I<T> & I<T> { // EXPECTED: regex error.*?class 'B' inherits or implements duplicate interface 'I'
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}

class B2<String> <: I<String> & I<String> { // EXPECTED: regex error.*?class 'B2' inherits or implements duplicate interface 'I'
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}