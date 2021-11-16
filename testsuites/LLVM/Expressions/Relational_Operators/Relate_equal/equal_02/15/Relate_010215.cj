// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {

    //printable character
    let a: Char = 'A'
    let a1: Char = 'a'
    let a2: Char = 'Z'
    let a3: Char = '9'
    let a4: Char = '+'

    if (a==a1 || a==a2 || a==a3 || a==a4) {
        return 1
    }

    //printable character
    let b: Char = '\\'
    let b1: Char = '\b'
    let b2: Char = '\n'
    let b3: Char = '\r'
    let b4: Char = '\t'
    let b5: Char = '\''
    let b6: Char = '\0'

    if (b==b1 || b==b2 || b==b3 || b==b4 || b==b5 || b==b6 || b==a) {
        return 1
    }

    return 0
}