// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// EXE  C: %rpt %n.%    var a : Int32*Int32 = (1,1)
    let myArray : Array<(t32)> = @{},(1,1)}
    returno0
}
