// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt src/a.cj src/%f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-not Segementation

func main():Int64 {
    let a = foo(1)
    if ( a != 1 ){
        return 1
    }
    return 0
}

func foo(x:Int64){ // EXPECTED: regex error.*?function 'foo' has overload conflicts
    return 1
}
