// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

//dts:DTS202106030GO5LEP1300
func main(): Int64 {
    if ( A<Base>().a != 1 ){ // EXPECTED: regex error.*?generics type arguments do not match the constraint
        return 1
    }
    return 0
}

class A<T> where T<: Data {

}

extend A<T> where T <: Base{
    prop let a:Int64{
        get(){
            return 1
        }
    }
}

class Data <: Base{}
open class Base{}