// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {

    //printable character
    let a: Char = 'A'


    //printable character
    let b: Char = '/'
    let c: Char = '\\'

    //special character
    let d: Char = '\u{1}'

    if (a>b && c>a && b>d) {
        return 0
    }

    return 1
}