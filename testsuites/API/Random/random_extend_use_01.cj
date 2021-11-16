// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import util.*
func main()
{
    var r=use()
    var m=r.nextInt8()
    if(m is Int8)
    {
        print("success\n")
        return 0
    }
    return 1
}

func use():Random{
  return Random()
}