// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import unicode.*

func main(): Int64 {
    var ch1 = '+'

    if (ch1.toUpperCase() != '+')    {
        return 1
    }

    if ('-'.toUpperCase() != '-')
    {
        return 1
    }

    if ('*'.toUpperCase() != '*')
    {
        return 1
    }

    if ('='.toUpperCase() != '=')
    {
        return 1
    }

    if ('@'.toUpperCase() != '@')
    {
        return 1
    }

    if ('#'.toUpperCase() != '#')
    {
        return 1
    }

    if ('$'.toUpperCase() != '$')
    {
        return 1
    }

    if ('%'.toUpperCase() != '%')
    {
        return 1
    }

    if (':'.toUpperCase() != ':')
    {
        return 1
    }

    if (';'.toUpperCase() != ';')
    {
        return 1
    }

    if ('?'.toUpperCase() != '?')
    {
        return 1
    }

    if ('~'.toUpperCase() != '~')
    {
        return 1
    }

    if (' '.toUpperCase() != ' ')
    {
        return 1
    }

    return 0
}
