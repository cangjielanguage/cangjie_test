// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {

    //printable character
    let a: Char = 'A'


//printable character
    let b: Char = '/'
    let c: Char = '\\'

    //special character
    let d: Char = '\u{��'

    if b<a && a<c && d<b{
        return 0
    }

    return 1
}