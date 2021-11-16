// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %

from std import unicode.*

func main(): Int64 {
    var ch1 = '+'

    if (ch1.toLowerCase() != '+')    {
        return 1
    }

    if (ch1.toLowerCase() != '+')    {
        return 1
    }

    if ('-'.toLowerCase() != '-')    {
        return 1
    }

    if ('*'.toLowerCase() != '*')    {
        return 1
    }

    if ('='.toLowerCase() != '=')    {
        return 1
    }

    if ('@'.toLowerCase() != '@')    {
        return 1
    }

    if ('#'.toLowerCase() != '#')    {
        return 1
    }

    if ('$'.toLowerCase() != '$')    {
        return 1
    }

    if ('%'.toLowerCase() != '%')    {
        return 1
    }

    if (':'.toLowerCase() != ':')    {
        return 1
    }

    if (';'.toLowerCase() != ';')    {
        return 1
    }

    if ('?'.toLowerCase() != '?')    {
        return 1
    }

    if ('~'.toLowerCase() != '~')    {
        return 1
    }

    if (' '.toLowerCase() != ' ')    {
        return 1
    }

    return 0
}
