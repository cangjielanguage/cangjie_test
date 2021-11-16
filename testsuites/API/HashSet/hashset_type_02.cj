// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

from std import collection.*

func main(): Int64 {
    var str1:List<IntNative> = []
    var str2:Array<UIntNative> = Array<UIntNative>([])
    var r1:HashSet<Int8> = HashSet<Int8>()
    var r2:HashSet<Int16> = HashSet<Int16>()
    var r3:HashSet<IntNative> = HashSet<IntNative>()
    var r4:HashSet<UIntNative> = HashSet<UIntNative>([])
    var r5:HashSet<UIntNative> = HashSet<UIntNative>(0,{x:Int64=>UIntNative(x)})
    if (r1.size()!=0){
       return 1
    }
    if (r2.size()!=0){
       return 2
    }
    if (r3.size()!=0){
       return 3
    }
    if(r4.size()!=0){
       return 4
    }
    if(r5.size()!=0){
       return 5
    }
     print("success1\n")
    return 0
}
