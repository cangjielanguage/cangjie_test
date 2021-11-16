// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(){
foreign var a = 1 // EXPECTED: regex 'foreign' modifier is illegal for variable declaration in function body
foreign let b = 1 // EXPECTED: regex 'foreign' modifier is illegal for variable declaration in function body
}
