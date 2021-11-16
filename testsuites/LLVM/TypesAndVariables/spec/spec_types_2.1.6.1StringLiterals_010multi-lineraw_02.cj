// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(){
    let errorStr1 = ##" error string "#  // EXPECTED: regex multi-line raw string literal is unterminated
    """
    return 0 
}
