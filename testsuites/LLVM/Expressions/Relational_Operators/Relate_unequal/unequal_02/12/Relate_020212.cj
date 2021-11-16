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
    let d1 = '*'

    if (a!=a1 && a1!='a' && b!=b1 && b1!='A' && c!=c1 && c1!='6' && d!=d1 && d1!='-') {
        return 0
    }

    return 1
}