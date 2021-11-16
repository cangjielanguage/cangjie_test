// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var ch1 = 'a'
    var ch2 = 'z'

    if (ch1.toAsciiUpperCase() != 'A')    {
        return 1
    }

    if (ch2.toAsciiUpperCase() != 'Z')    {
        return 1
    }

    if ('H'.toAsciiUpperCase() != 'H')    {
        return 1
    }

    if ('p'.toAsciiUpperCase() != 'P')    {
        return 1
    }

    if ('Q'.toAsciiUpperCase() != 'Q')    {
        return 1
    }

    return 0
}
