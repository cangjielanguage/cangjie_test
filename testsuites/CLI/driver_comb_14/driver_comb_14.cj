// DEPENDENCE: ./src ./cfg-ast
// EXEC: %compiler -c -package src/aoo src/boo -verbose -no-prelude -o ./ 2>&1 | compare %f
// ASSERT: regex Cangjie Compiler: .*? \(.*? \d{4}-\d{2}-\d{2}\)
// EXEC: %ls aoo.o
