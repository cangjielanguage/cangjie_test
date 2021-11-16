// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {

    //unprintable character
    let h: Char = '\0'
    let h1 = '\0'

    let j: Char = '\n'
    let j1 = '\n'

    let k: Char = '\t'
    let k1 = '\t'

    if (h==h1 && h1=='\0' && j==j1 && j1=='\n' && k==k1 && k1=='\t') {
        return 0
    }

    return 1
}