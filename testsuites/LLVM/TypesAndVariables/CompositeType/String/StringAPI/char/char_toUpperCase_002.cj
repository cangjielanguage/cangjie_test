// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import unicode.*

func main(): Int64 {
    let ch1:Char = 'a'
    let ch2:Char = 'z'

    if (ch1.toUpperCase() != 'A')
    {
        return 1
    }

    if (ch2.toUpperCase() != 'Z')
    {
        return 1
    }

    return 0
}
