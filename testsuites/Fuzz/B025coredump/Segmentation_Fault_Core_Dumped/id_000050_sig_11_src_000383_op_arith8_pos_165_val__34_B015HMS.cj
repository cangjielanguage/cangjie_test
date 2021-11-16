// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

foreign let a : Array<Int32>
foreign var b : Array<Int32> = @{1}

foreign{
    var c : Array<Int32>
    let d : Array<Int32> = @{1[
}
