// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan can not match-2
// ASSERT: scan can not match-3
// ASSERT: scan success

from std import regex.*
func main()
{
   var matcherstr1="fggfhhhgkkk"
   //$
   var regexstr1="[k]{3}$"
   var matcher1=Regex(regexstr1).matcher(matcherstr1)
   var result1=matcher1.find().getOrThrow().matchStr()
   if(result1!="kkk")
   {
       print("Part1+${result1}\n")
       return 1
   }

   var regexstr2="[k]{2}$"
   var matcher2=Regex(regexstr2).matcher(matcherstr1)
   var result2=matcher2.find().getOrThrow().matchStr()
   try{
        var result2=matcher2.find().getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-2\n")
   }

   var regexstr3="[k]{2}$(g|f)"
   var matcherstr3="kk$g"
   var matcher3=Regex(regexstr3).matcher(matcherstr3)
   try{
        var result3=matcher3.find().getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-3\n")
   }
   print("success\n")
   return 0
}