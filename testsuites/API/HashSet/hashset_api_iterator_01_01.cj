// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

from std import collection.*

func mynext(it: Option<String>):String
{
   match(it){
      case Some(v) =>return v
      case $None => ""
   }
}

func main(): Int64 {
    var str:List<String> = ["a","b","c"]
    var r1:HashSet<String> = HashSet<String>()
    var r2:HashSet<String> = HashSet<String>(["0","2","1"])
    var r3:HashSet<String> = HashSet<String>(str)
    var r4:HashSet<String> = HashSet<String>(3)
    var r5:HashSet<String> = HashSet<String>(3,{x:Int64=>x.toString()})
    var itor01=r1.iterator()
    var itor02=r2.iterator()
    var itor03=r3.iterator()
    var itor04=r4.iterator()
    var itor05=r5.iterator()
    if(r1.contains(mynext(itor01.next()))==true)
    {
        return 1
    }
    if(r2.contains(mynext(itor02.next()))!=true)
    {
        return 2
    }
    if(r3.contains(mynext(itor03.next()))!=true)
    {
        return 3
    }
    if(r4.contains(mynext(itor04.next()))==true)
    {
        return 4
    }
    if(r5.contains(mynext(itor05.next()))!=true)
    {
        return 5
    }
    print("success1\n")
    return 0
}