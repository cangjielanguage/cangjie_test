// EXEC: %compiler %cmp_opt %f -o %output  2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    let a : Int32 = 1
    var MyTuple = (
    try
   )   // EXPECTED: regex expected identifier here
    return 0
}
