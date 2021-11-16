// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

func main(): Int64 {
    var str:List<String> = ["a","b","c"]
    var r1:HashSet<Int64> = HashSet<Int64>()
    var r2:HashSet<String> = HashSet<String>(["0","2","1"])
    var r3:HashSet<String> = HashSet<String>(str)
    var r4:HashSet<String> = HashSet<String>(3)
    var r5:HashSet<String> = HashSet<String>(3,{x:Int64=>x.toString()})
    var m:String ="a"
    if(r1.contains(m)==true ){  // EXPECTED: regex error.*?parameters and arguments mismatch
        return 1
    }
    if(r2.contains(2)==true){  // EXPECTED: regex error.*?cannot convert an integer literal to type 'Record-String'
        return 2
    }
    if(r3.contains('a')==true){  // EXPECTED: regex error.*?cannot convert a character literal to type 'Record-String'
        return 3
    }
    if(r4.contains(2)==true){  // EXPECTED: regex error.*?cannot convert an integer literal to type 'Record-String'
        return 4
    }
    if(r5.contains(2)==true){  // EXPECTED: regex error.*?cannot convert an integer literal to type 'Record-String'
        return 5
    }
    return 0
}
