// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(){
    let errorStr = """abc // EXPECTED: regex multi-line string literal must begin on a new line
    """
    return 0 
}
