// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var ch1 = '\u{0001}'
    var ch2 = '\u{ffff}'

    if (ch1.toAsciiUpperCase() != '\u{0001}')
    {
        return 1
    }

    if (ch2.toAsciiUpperCase() != '\u{ffff}')
    {
        return 1
    }

    var ch3 = '\0'
    let ch4:Char = '\\'
    let ch5:Char = '\''

    if (ch3.toAsciiUpperCase() != '\0')
    {
        return 1
    }

    if (ch4.toAsciiUpperCase() != '\\')
    {
        return 1
    }

    if (ch5.toAsciiUpperCase() != '\'')
    {
        return 1
    }

    if ('\"'.toAsciiUpperCase() != '\"')
    {
        return 1
    }

    if ('\b'.toAsciiUpperCase() != '\b')
    {
        return 1
    }

    if ('\t'.toAsciiUpperCase() != '\t')
    {
        return 1
    }

    return 0
}
