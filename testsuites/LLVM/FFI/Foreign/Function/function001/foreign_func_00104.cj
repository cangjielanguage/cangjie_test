// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(){
foreign func test():Unit // EXPECTED: regex 'foreign' modifier is illegal for function declaration in function body
}
