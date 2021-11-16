// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    if ( B<Int32>().a != 1 ){ // EXPECTED: regex error.*?generics type arguments do not match the constraint
        return 1
    }
    return 0
}

open class A<T> {
    func foo(){
        return 1
    }
}

class B<T> <: A<T> where  T <: Int64{
    prop let a:Int64{
        get(){
            return foo()
        }
    }
}
