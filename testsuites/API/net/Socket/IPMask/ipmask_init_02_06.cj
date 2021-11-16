// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan 1:bits must be 32 or 128
// ASSERT: scan 2:bits must be 32 or 128
// ASSERT: scan 3:bits must be 32 or 128
// ASSERT: scan 4:bits must be 32 or 128
// ASSERT: scan 5:bits must be 32 or 128
// ASSERT: scan success

from std import net.*
func main()
{
    try{
        var ipmask1=IPMask(16,33)
    }catch(e:RuntimeException){
        print("1:bits must be 32 or 128\n")
    }
    try{
        var ipmask1=IPMask(16,31)
    }catch(e:RuntimeException){
        print("2:bits must be 32 or 128\n")
    }
    try{
        var ipmask1=IPMask(0,0)
    }catch(e:RuntimeException){
        print("3:bits must be 32 or 128\n")
    }
    try{
        var ipmask1=IPMask(16,129)
    }catch(e:RuntimeException){
        print("4:bits must be 32 or 128\n")
    }
    try{
        var ipmask1=IPMask(16,127)
    }catch(e:RuntimeException){
        print("5:bits must be 32 or 128\n")
    }
    print("success\n")
    return 0
}


