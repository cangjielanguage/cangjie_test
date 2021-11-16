// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {

    //unprintable character
    let h: Char = '\0'
    let h1 = '\f'

    let j: Char = '\b'
    let j1 = '\v'

    let k: Char = '\t'
    let k1 = '\n'

    if (h<=h1 && h1<='\"' && j<=j1 && j1<='\\' && k<=k1 && k1<='\'') {
        return 0
    }

    return 1
}