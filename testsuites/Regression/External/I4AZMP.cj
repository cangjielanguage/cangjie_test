// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex StackOverflowError

func factorial(n: Int64): Int64
{
    if (n==1)
    {
        return 1;
    }else
    {
        return n*factorial(n-1)
    }
}
func main() {
    var a: List<Int64> = List<Int64>([65535])
    for ( i in a){
        var varname = factorial(i)
        print("letname + ${i}\n" )
    }
    return 0
}
