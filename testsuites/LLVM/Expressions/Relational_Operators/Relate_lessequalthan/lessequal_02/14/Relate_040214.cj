// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {

    //special character
    let l: Char = '\''
    let l1 = '\"'

    let m: Char = '\u{8}'
    let m1 = '\u{5}'

    if (l1<=l && '\u{2}' <= l1 && m1 <= l && m1 <= m) {
        return 0
    }

    return 1
}