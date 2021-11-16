// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import util.*
func main()
{
    var n=Random()
    var r=use(n)
    if(r is Int8)
    {
        print("success\n")
        return 0
    }
    return 1
}

func use(r:Random):Int8{
  return r.nextInt8()
}