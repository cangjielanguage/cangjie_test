// DEPENDENCE: a importcfg
// EXEC: %compiler %cmp_opt -c ./a/a.cj -o a.%middle
// ERRCHECK: %compiler %cmp_opt %f a.%middle -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


import a.*

func main(){
a.test(1) // EXPECTED: regex ambiguous match for function call
return 1
}


