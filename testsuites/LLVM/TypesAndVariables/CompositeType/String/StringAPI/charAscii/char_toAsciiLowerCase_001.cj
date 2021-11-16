// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var ch1 = 'A'
    var ch2 = 'Z'

    if (ch1.toAsciiLowerCase() != 'a')    {
        return 1
    }

    if (ch2.toAsciiLowerCase() != 'z')    {
        return 1
    }

    if ('H'.toAsciiLowerCase() != 'h')    {
        return 1
    }

    if ('P'.toAsciiLowerCase() != 'p')    {
        return 1
    }

    if ('h'.toAsciiLowerCase() != 'h')    {
        return 1
    }

    return 0
}
