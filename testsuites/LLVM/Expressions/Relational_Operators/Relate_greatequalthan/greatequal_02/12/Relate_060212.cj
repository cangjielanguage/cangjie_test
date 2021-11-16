// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {

    //printable character
    let a: Char = 'A'
    let a1 = 'Z'

    let b: Char = 'z'
    let b1 = 'a'

    let c: Char = '5'
    let c1 = '9'

    let d: Char = '+'
    let d1 = '-'

    if (a1>=a && 'Z'>=a1 && b1>=b && b>='z' && c1>=c && '9'>=c1 && d1>=d && '-'>=d1) {
        return 0
    }

    return 0
}