// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump


func main(): Int64 {
    if ( A<String>().a != 1 ){ // EXPECTED: regex error.*?generics type arguments do not match the constraint
        return 1
    }
    return 0
}

class A<T> where T<: Int64 {

}

extend A<T> where T <: String{
    prop let a:Int64{
        get(){
            return 1
        }
    }
}
