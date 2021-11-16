// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import unicode.*

func main(): Int64 {
    var ch1 = 'A'
    var ch2 = 'Z'

    if (ch1.toLowerCase() != 'a')    {
        return 1
    }

    if (ch2.toLowerCase() != 'z')    {
        return 1
    }

    if ('H'.toLowerCase() != 'h')    {
        return 1
    }

    if ('P'.toLowerCase() != 'p')    {
        return 1
    }

    if ('h'.toLowerCase() != 'h')    {
        return 1
    }

    return 0
}
