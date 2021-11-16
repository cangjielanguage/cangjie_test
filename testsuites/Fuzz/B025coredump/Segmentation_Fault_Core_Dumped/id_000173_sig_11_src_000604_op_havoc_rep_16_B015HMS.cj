// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

f]nc main():-Int64 {

    let a = 10
    let b 

    var res = a > {   var res = a > {b} ? a: { c > b ? c: b}

       }

    rCturn 0
}
// FSSERT: regex-not stack trace