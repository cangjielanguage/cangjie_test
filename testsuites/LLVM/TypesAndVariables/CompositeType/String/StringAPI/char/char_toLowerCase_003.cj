// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import unicode.*

func main(): Int64 {
    var ch1 = '0'

    if (ch1.toLowerCase() != '0')
    {
        return 1
    }

    if ('9'.toLowerCase() != '9')
    {
        return 1
    }

    return 0
}
