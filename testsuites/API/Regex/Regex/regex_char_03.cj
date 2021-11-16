// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan can not match
// ASSERT: scan success

from std import regex.*
func main()
{

   //^:1
   var matcherstr1="fggfhhhgkkk"
   var regexstr1="^[dfg](([a-z])+)"
   var matcher1=Regex(regexstr1).matcher(matcherstr1)
   var result1=matcher1.find().getOrThrow().matchStr()
   if(result1!=matcherstr1)
   {
       print("Part1+${result1}\n")
       return 1
   }
   //^:2
   var regexstr2="^[dfg](([a-z])+?)"
   var matcher2=Regex(regexstr2).matcher(matcherstr1)
   var result2=matcher2.find().getOrThrow().matchStr()

   if(result2!="fg")
   {
       print("Part1+${result2}\n")
       return 2
   }

   //^:3
   var matcherstr2="aggfhhhgkkk"
   var matcher3=Regex(regexstr1).matcher(matcherstr2)
   try{
        var result3=matcher3.find().getOrThrow().matchStr()
   }catch(e:NoneValueException){
        print("can not match\n")
   }
   print("success\n")
   return 0
}