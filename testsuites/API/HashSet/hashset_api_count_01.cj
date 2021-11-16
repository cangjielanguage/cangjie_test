// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success1

from std import collection.*

func main(): Int64 {
    var str1:List<String> = []
    var str2:Array<String> = Array<String>([])
    var r1:HashSet<String> = HashSet<String>()
    //入参是空列表，构造抛异常
    var r2:HashSet<String> = HashSet<String>([])
    var r3:HashSet<String> = HashSet<String>(str1)
    var r4:HashSet<String> = HashSet<String>(str2)
    //容量入参是0，构造抛异常
    var r5:HashSet<String> = HashSet<String>(0)
    var r6:HashSet<String> = HashSet<String>(0,{x:Int64=>x.toString()})
    if (r1.size()!=0){
       return 1
    }
    if (r2.size()!=0){
       return 2
    }
    if (r3.size()!=0){
       return 3
    }
    if( r4.size()!=0){
       return 4
    }
    if( r5.size()!=0){
       return 5
    }
    if( r6.size()!=0){
       return 6
    }
    print("success1\n")
    return 0
}
