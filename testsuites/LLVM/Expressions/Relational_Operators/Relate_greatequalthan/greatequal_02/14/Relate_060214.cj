// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {

    //special character
    let l: Char = '\''
    let l1 = '\"'

    let m: Char = '\u{1}'
    let m1 = '\u{1}'

    if (l>=l1 && '\"'>=l1 && l1 >= m && l >= m1) {
        return 0
    }

    return 1
}