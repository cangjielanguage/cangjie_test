// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
interface A{}
interface A<T>{} // EXPECTED: regex redefinition of declaration 'A'

class B{}
class B<T>{} // EXPECTED: regex redefinition of declaration 'B'

func main(){
return 0
}
