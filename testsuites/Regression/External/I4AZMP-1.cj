// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

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
    var a: List<Int64> = List<Int64>([10,21,300,3000])
    try {
        for ( i in a){
            var varname = factorial(i)
            print("letname + ${i}\n" )
        }
    }catch(e:OverflowException){
        e.printStackTrace()
        return 0
    }  
    return 1
}
