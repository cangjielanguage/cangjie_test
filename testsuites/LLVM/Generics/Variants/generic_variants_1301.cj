// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    if ( B<String>().a != 1 ){
        return 1
    }
    return 0
}

open class A<T> {
    func foo(){
        return 1
    }
}

class B<T> <: A { // EXPECTED: regex error.*?generic type should be used with type argument
    prop let a:Int64{
        get(){
            return foo()
        }
    }
}
