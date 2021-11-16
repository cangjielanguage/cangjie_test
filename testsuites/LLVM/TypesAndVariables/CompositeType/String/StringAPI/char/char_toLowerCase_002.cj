// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import unicode.*

func main(): Int64 {
    let ch1:Char = 'A'
    let ch2:Char = 'Z'

    if (ch1.toLowerCase() != 'a')
    {
        return 1
    }

    if (ch2.toLowerCase() != 'z')
    {
        return 1
    }

    return 0
}
