// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var matcherstr1="fggfhhhgkkkg"
   //量词{n,m}:only one
   var regexstr1="[k]{1,2}"
   var matcher1=Regex(regexstr1).matcher(matcherstr1)
   var result1=matcher1.find().getOrThrow().matchStr()
   if(result1!="kk")
   {
      print("Part1+${result1}\n")//
   }

   var regexstr9="[k]{1,3}"
   var matcher9=Regex(regexstr9).matcher(matcherstr1)
   var result9=matcher9.find().getOrThrow().matchStr()
   if(result9!="kkk")
   {
       print("Part9+${result9}\n")
   }

   var regexstr10="[k]{1,4}"
   var matcher10=Regex(regexstr10).matcher(matcherstr1)
   var result10=matcher10.find().getOrThrow().matchStr()
   if(result10!="kkk")
   {
       print("Part10+${result10}\n")
   }

   //量词{n,m}?:only one
    var regexstr11="[k]{1,2}?g"
    var matcherstr2="fggfhhhgkkkg"
    var matcher11=Regex(regexstr11).matcher(matcherstr2)
    var result11=matcher11.find().getOrThrow().matchStr()//kkg
    if(result11!="kkg")
    {
       print("Part11+${result11}\n")
    }
   print("success\n")
   return 0
}