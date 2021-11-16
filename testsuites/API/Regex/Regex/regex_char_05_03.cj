// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var matcherstr1="fggfhhhgkkk"
   //量词{n}
   var regexstr1="[k]{3}"
   var matcher1=Regex(regexstr1).matcher(matcherstr1)
   var result1=matcher1.find().getOrThrow().matchStr()//kkk
   if(result1!="kkk")
   {
       print("Part1+${result1}\n")
       return 1
   }

   var regexstr2="[k]{2}"
   var matcher2=Regex(regexstr2).matcher(matcherstr1)
   var result2=matcher2.find().getOrThrow().matchStr()//kk
   if(result2!="kk")
   {
       print("Part2+${result2}\n")
       return 1
   }

   var regexstr3="[k]{1}"
   var matcher3=Regex(regexstr3).matcher(matcherstr1)
   var result3=matcher3.find().getOrThrow().matchStr()//k-k-k
   if(result3!="k")
   {
      print("Part3+${result3}\n")
   }
   //量词{n}?
   var regexstr4="[k]{3}?"
   var matcher4=Regex(regexstr4).matcher(matcherstr1)
   var result4=matcher4.find().getOrThrow().matchStr()//kkk
   if(result4!="kkk")
   {
       print("Part4+${result4}\n")
       return 1
   }

   var regexstr5="[k]{2}?"
   var matcher5=Regex(regexstr5).matcher(matcherstr1)
   var result5=matcher5.find().getOrThrow().matchStr()//kk
   if(result5!="kk")
   {
       print("Part5+${result5}\n")
       return 1
   }

   var regexstr6="[k]{1}?"
   var matcher6=Regex(regexstr6).matcher(matcherstr1)
   var result6=matcher6.find().getOrThrow().matchStr()//k-k-k
   if(result6!="k")
   {
      print("Part6+${result6}\n")
   }

   print("success\n")
   return 0
}