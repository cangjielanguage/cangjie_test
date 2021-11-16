// EXEC-PIPE-1: %compiler %cmp_opt -c %f 2>&1 | compare %f

record Test {i  // EXPECTED: regex illegal record member in record block
    let b: Int32 =
}
