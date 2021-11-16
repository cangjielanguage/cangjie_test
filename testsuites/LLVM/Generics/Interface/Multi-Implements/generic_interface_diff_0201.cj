// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    if ( B<Int32>().m != 1 ){ // EXPECTED: regex error.*?class 'B' inherits or implements duplicate interface 'I1'
        return 1
    }
    return 0
}

interface I1<T> {
    func foo():Int64{
        return 1
    }
}

interface J<T> <: I1<T> & I1<Int32> {
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}

class B<T> <: J<T> {}