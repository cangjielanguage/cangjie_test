// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {

    //printable character
    let a: Char = 'A'
    let a1 = 'A'

    let b: Char = 'z'
    let b1 = 'z'

    let c: Char = '5'
    let c1 = '5'

    let d: Char = '+'
    let d1 = '+'

    if (a==a1 && a1=='A' && b==b1 && b1=='z' && c==c1 && c1=='5' && d==d1 && d1=='+') {
        return 0
    }

    return 1
}