

//DEPENDENCE: ./pkg1
// EXEC: %compiler %cmp_opt -c pkg1/pkg1.cj -o pkg1.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f pkg1.%middle -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


import pkg1 as renmae // EXPECTED:regex error.*?it doesn't support importing package by package name.

func main(): Int64 {
    var b=renmae.A()
    return a-1
}
