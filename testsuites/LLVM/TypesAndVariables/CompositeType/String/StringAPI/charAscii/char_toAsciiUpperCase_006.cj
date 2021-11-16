// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var ch1 = ')'
    var ch2 = '('

    if (ch1.toAsciiUpperCase() != ')')    {
       return 1
    }

    if (ch2.toAsciiUpperCase() != '(')    {
       return 1
    }

    if ('{'.toAsciiUpperCase() != '{')
    {
       return 1
    }

    if ('}'.toAsciiUpperCase() != '}')    {
       return 1
    }

    if ('<'.toAsciiUpperCase() != '<')    {
       return 1
    }

    if ('>'.toAsciiUpperCase() != '>')    {
       return 1
    }


    return 0
}
