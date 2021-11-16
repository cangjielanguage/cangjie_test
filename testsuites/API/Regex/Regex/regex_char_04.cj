// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   //x|y
   var matcherstr1="fggfhhhgkkk"
   var matcherstr2="ggfhhhgkkk"
   var matcherstr3="dgfhhhgkkk"
   var regexstr1="(f|g)(([h-z])+)"
   var matcher1=Regex(regexstr1).matcher(matcherstr1)
   var result1=matcher1.find().getOrThrow().matchStr()//fhhh
   var result11=matcher1.find().getOrThrow().matchStr()//gkkk

   var matcher2=Regex(regexstr1).matcher(matcherstr2)
   var result2=matcher2.find().getOrThrow().matchStr()//fhhh
   var result21=matcher2.find().getOrThrow().matchStr()//gkkk

   var matcher3=Regex(regexstr1).matcher(matcherstr3)
   var result3=matcher3.find().getOrThrow().matchStr()//fhhh
   var result31=matcher3.find().getOrThrow().matchStr()//gkkk
   if(result1!="fhhh"||result2!="fhhh"||result3!="fhhh")
   {
       print("Part1+${result1}+${result2}+${result3}\n")
       return 1
   }
   if(result11!="gkkk"||result21!="gkkk"||result31!="gkkk")
   {
       print("Part11+${result11}+${result21}+${result31}\n")
       return 1
   }
   print("success\n")
   return 0
}