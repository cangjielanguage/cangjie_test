// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var ch1 = '0'

    if (ch1.toAsciiUpperCase() != '0')
    {
        return 1
    }

    if ('9'.toAsciiUpperCase() != '9')
    {
        return 1
    }

    return 0
}
