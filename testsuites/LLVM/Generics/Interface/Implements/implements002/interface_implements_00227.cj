// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

open class Father{}
class Child <: Father{}
interface I<T>{}
interface J<T>{}
class A <: I<Father> &J<Father>{init(){}}


func main(){
var a : I<Child> = A() // EXPECTED: regex no matching constructor for call 'A'
var b : J<Child> = A() // EXPECTED: regex no matching constructor for call 'A'
return 0
}
