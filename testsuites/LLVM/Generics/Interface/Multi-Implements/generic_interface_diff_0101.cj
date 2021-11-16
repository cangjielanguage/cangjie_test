// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    if ( B<String>().m != 1 ){
        return 1
    }
    return 0
}

interface I1<T> {
    func foo():Int64{
        return 1
    }
}

interface I2 {
    func foo():Int64{
        return 1
    }
}

interface J<T> <: I1<T> & I2 { // EXPECTED: regex error.*?function 'foo' needs to be overridden
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}

class B<T> <: J<T> {}