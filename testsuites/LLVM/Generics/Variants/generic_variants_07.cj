// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

//spec issue 755
func main(): Int64 {
    if ( A<String>().a != 1 ){
        return 1
    }
    return 0
}

class A<A> where A<:A {
    prop let a:Int64{
        get(){
            return 1
        }
    }
}