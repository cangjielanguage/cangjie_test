// DEPENDENCE: ./src ./cfg-ast
// EXEC: %compiler %cmp_opt -c -package src/aoo src/boo -verbose -o ./ 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex Cangjie Compiler: .*? \(.*? \d{4}-\d{2}-\d{2}\)
// EXEC: %ls aoo.%middle
