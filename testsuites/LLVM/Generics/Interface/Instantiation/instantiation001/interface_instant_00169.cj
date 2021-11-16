// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
interface A<X>{}
interface A2 <: A<<Int32>>{} // EXPECTED: regex generic type should be used with type argument
class B<X> <: A<X>{}
class C <: A<<Int32>>{} // EXPECTED: regex expected '{' in class
func main(){
var i : A<<Int32>> = B<<Int32>>() // EXPECTED: regex generic type should be used with type argument
var j : A<<Int32>> = C() // EXPECTED: regex generic type should be used with type argument
var k : A2
return 0
}
