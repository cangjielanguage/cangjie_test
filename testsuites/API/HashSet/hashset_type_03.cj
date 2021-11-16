// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args| compare %f
// ASSERT: scan success1

from std import collection.*

func main(): Int64 {
    var str1:List<Char> = ['a','b']
    var str2:Array<Bool> = Array<Bool>([true,false])
    var r1:HashSet<Char> = HashSet<Char>(str1)
    var r2:HashSet<Bool> = HashSet<Bool>(str2)
    var r3:HashSet<Char> = HashSet<Char>()
    var r4:HashSet<Bool> = HashSet<Bool>()
    var r5:HashSet<Char> = HashSet<Char>(3)
    var r6:HashSet<Bool> = HashSet<Bool>(1)
    var r8:HashSet<Bool> = HashSet<Bool>(1,{x:Int64=>true})

    var m1:Char='m'
    var m2:Bool=true
    r3.put(m1)
    r4.put(m2)
    r5.put(m1)
    r6.put(m2)
    if (r1.size()!=2||r1.contains('a')!=true||r1.contains('b')!=true){
       return 1
    }
    if (r2.size()!=2||r2.contains(true)!=true||r2.contains(false)!=true){
       return 2
    }
    if (r3.size()!=1||r3.contains(m1)!=true){
       return 3
    }
    if(r4.size()!=1||r4.contains(m2)!=true){
       return 4
    }
    if(r5.size()!=1||r5.contains(m1)!=true){
       return 5
    }
    if(r6.size()!=1||r6.contains(m2)!=true){
       return 6
    }
    if(r8.size()!=1||r8.contains(true)!=true){
       return 8
    }
    print("success1\n")
    return 0
}
