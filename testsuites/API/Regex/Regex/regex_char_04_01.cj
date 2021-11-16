// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   //(?：subexpression)
   var matcherstr1="fggfhhhgkkk"
   var matcherstr2="ggfhhhgkkk"
   var matcherstr3="dgfhhhgkkk"
   var regexstr1="(?:f|g)(([a-z])+)"
   var matcher1=Regex(regexstr1).matcher(matcherstr1)
   var result1=matcher1.find().getOrThrow().matchStr()//fggfhhhgkkk

   var matcher2=Regex(regexstr1).matcher(matcherstr2)
   var result2=matcher2.find().getOrThrow().matchStr()//ggfhhhgkkk

   var matcher3=Regex(regexstr1).matcher(matcherstr3)
   var result3=matcher3.find().getOrThrow().matchStr()//gfhhhgkkk

   if(result1!="fggfhhhgkkk"||result2!="ggfhhhgkkk"||result3!="gfhhhgkkk")
   {
       print("Part1+${result1}+${result2}+${result3}\n")
       return 1
   }
   print("success\n")
   return 0
}