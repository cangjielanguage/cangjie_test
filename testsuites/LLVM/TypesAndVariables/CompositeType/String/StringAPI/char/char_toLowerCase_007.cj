// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import unicode.*

func main(): Int64 {
    var ch1 = '\u{0001}'
    var ch2 = '\u{ffff}'

    if (ch1.toLowerCase() != '\u{0001}')
    {
        return 1
    }

    if (ch2.toLowerCase() != '\u{ffff}')
    {
        return 1
    }

    var ch3 = '\0'
    let ch4:Char = '\\'
    let ch5:Char = '\''

    if (ch3.toLowerCase() != '\0')    {
        return 1
    }

    if (ch4.toLowerCase() != '\\')    {
        return 1
    }

    if (ch5.toLowerCase() != '\'')    {
        return 1
    }

    if ('\"'.toLowerCase() != '\"')    {
        return 1
    }

    if ('\b'.toLowerCase() != '\b')    {
        return 1
    }

    if ('\t'.toLowerCase() != '\t')    {
        return 1
    }

    return 0
}
