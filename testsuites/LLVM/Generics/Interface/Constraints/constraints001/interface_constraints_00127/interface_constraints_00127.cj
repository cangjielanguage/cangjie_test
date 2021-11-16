// DEPENDENCE: ./a import.cfg
// EXEC: %compiler %cmp_opt -c ./a/a.cj -o ./a/a.%middle 
// EXEC: %compiler %cmp_opt  %f ./a/a.%middle -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import a.*
interface I<X>
where X<:a.A{}
func main(){return 0}
