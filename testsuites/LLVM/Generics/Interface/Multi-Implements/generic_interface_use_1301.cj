// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    return 0
}

interface I1<T,V> {
    func foo():Int64{
        return 1
    }
}

interface J<T,V> <: I1<T,V> & I1<T,Int32> {
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}

class B<T> where T <:  J<String,Int32> {} // EXPECTED: regex error.*?interface 'J' inherits or implements duplicate interface 'I1'