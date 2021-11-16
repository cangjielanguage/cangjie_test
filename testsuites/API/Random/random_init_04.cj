// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import util.*
func main()
{
    var r1=Random()
    var r2=Random()
    var n:UInt64=200
    var m:UInt64=300
    var nr:Int8
    var mr:Int8
    var nr1:Int8
    var mr1:Int8
    var count:Int16=0
    for (i in 0..n)
    {
       nr=r1.nextInt8()
    }
    for (i in 0..m)
    {
       mr=r2.nextInt8()
    }
   for (i in 0..m)
    {

        nr1=r1.nextInt8()
        mr1=r2.nextInt8()
        if(mr1!=nr1)
        {
            count+=1
        }
    }
   if(count==0)
    {
         return 1
    }
    print("success\n")
    return 0
}