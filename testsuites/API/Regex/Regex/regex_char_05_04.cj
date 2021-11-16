// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan can not match-3
// ASSERT: scan success

from std import regex.*
func main()
{
   var matcherstr1="fggfhhhgkkkg"
   //量词{n,}
   var regexstr2="[k]{3,}"
   var matcher2=Regex(regexstr2).matcher(matcherstr1)
   var result2=matcher2.find().getOrThrow().matchStr()//kkk
   if(result2!="kkk")
   {
       print("Part2+${result2}\n")
       return 1
   }

   var regexstr3="[k]{4,}"
   var matcher3=Regex(regexstr3).matcher(matcherstr1)//no match
   try{
        var result3=matcher3.find().getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-3\n")
   }

   //量词{n,}?
   var regexstr4="[k]{3,}?g"
   var matcherstr2="fggfhhhgkkkg"
   var matcher4=Regex(regexstr4).matcher(matcherstr2)
   var result4=matcher4.find().getOrThrow().matchStr()//kkkg
   if(result4!="kkkg")
   {
       print("Part4+${result4}\n")
       return 1
   }
   print("success\n")
   return 0
}