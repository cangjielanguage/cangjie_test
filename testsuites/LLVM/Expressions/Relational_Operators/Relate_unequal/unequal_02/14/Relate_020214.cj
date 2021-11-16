// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {

    //special character
    let l: Char = '\''
    let l1 = '\''

    let m: Char = '\"'
    let m1 = '\"'

    let n: Char = '\u{1}'
    let n1 = '\u{8}'

    if (l==l1 && l1!='\0' && m==m1 && m1!='\n' && n!=n1 && n1!='\t') {
        return 0
    }

    return 1
}