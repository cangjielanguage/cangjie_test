// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let ch1:Char = 'a'
    let ch2:Char = 'z'

    if (ch1.toAsciiUpperCase() != 'A')
    {
        return 1
    }

    if (ch2.toAsciiUpperCase() != 'Z')
    {
        return 1
    }

    return 0
}
