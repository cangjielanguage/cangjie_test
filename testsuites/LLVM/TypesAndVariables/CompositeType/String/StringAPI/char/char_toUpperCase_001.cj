// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import unicode.*

func main(): Int64 {
    var ch1 = 'a'
    var ch2 = 'z'

    if (ch1.toUpperCase() != 'A')    {
        return 1
    }

    if (ch2.toUpperCase() != 'Z')    {
        return 1
    }

    if ('H'.toUpperCase() != 'H')    {
        return 1
    }

    if ('p'.toUpperCase() != 'P')    {
        return 1
    }

    if ('Q'.toUpperCase() != 'Q')    {
        return 1
    }

    return 0
}
