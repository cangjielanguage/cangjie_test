// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

interface I<T>{}
interface J<T>{}
class A <: I<Int32> &J<Int32>{init(){}}


func main(){
var a : I<Int64> = A() // EXPECTED: regex no matching constructor for call 'A'
var b : J<Int64> = A() // EXPECTED: regex return type for 'init' is mismatched
return 0
}
