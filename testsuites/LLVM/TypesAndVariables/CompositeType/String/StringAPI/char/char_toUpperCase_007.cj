// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import unicode.*

func main(): Int64 {
    var ch1 = '\u{0001}'
    var ch2 = '\u{ffff}'

    if (ch1.toUpperCase() != '\u{0001}')
    {
        return 1
    }

    if (ch2.toUpperCase() != '\u{ffff}')
    {
        return 1
    }

    var ch3 = '\0'
    let ch4:Char = '\\'
    let ch5:Char = '\''

    if (ch3.toUpperCase() != '\0')
    {
        return 1
    }

    if (ch4.toUpperCase() != '\\')
    {
        return 1
    }

    if (ch5.toUpperCase() != '\'')
    {
        return 1
    }

    if ('\"'.toUpperCase() != '\"')
    {
        return 1
    }

    if ('\b'.toUpperCase() != '\b')
    {
        return 1
    }

    if ('\t'.toUpperCase() != '\t')
    {
        return 1
    }

    return 0
}
