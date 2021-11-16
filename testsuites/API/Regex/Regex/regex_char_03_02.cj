// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan can not match-2
// ASSERT: scan can not match-3
// ASSERT: scan can not match-4
// ASSERT: scan can not match-6
// ASSERT: scan can not match-8
// ASSERT: scan success

from std import regex.*
func main()
{
   var matcherstr1="Chapter"
   var matcherstr2="terest"
   var matcherstr3="aptitude"
   //\b
   var regexstr1="ter\\b"
   var matcher1=Regex(regexstr1).matcher(matcherstr1)
   var result1=matcher1.find().getOrThrow().matchStr()
   if(result1!="ter")
   {
       print("Part1+${result1}\n")
       return 1
   }
   var matcher2=Regex(regexstr1).matcher(matcherstr2)
   try{
       var result2=matcher2.find().getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-2\n")
   }

   var matcher3=Regex(regexstr1).matcher(matcherstr3)
   try{
       var result3=matcher3.find().getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-3\n")
   }

   var regexstr2="\\bter"
   var matcher4=Regex(regexstr2).matcher(matcherstr1)
   try{
       var result4=matcher4.find().getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-4\n")
   }

   var matcher5=Regex(regexstr2).matcher(matcherstr2)
   var result5=matcher5.find().getOrThrow().matchStr()
   if(result5!="ter")
   {
       print("Part5+${result5}\n")
       return 2
   }

   var matcher6=Regex(regexstr2).matcher(matcherstr3)
   try{
        var result6=matcher6.find().getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-6\n")
   }

   //\B
   var regexstr3="apt\\B"
   var matcherstr4="terestapt"
   var matcher7=Regex(regexstr3).matcher(matcherstr1)
   var result7=matcher7.find().getOrThrow().matchStr()

   var matcher8=Regex(regexstr3).matcher(matcherstr4)
   try{
      var result8=matcher8.find().getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-8\n")
   }

   var matcher9=Regex(regexstr3).matcher(matcherstr3)
   var result9=matcher9.find().getOrThrow().matchStr()

   if(result7!="apt"||result9!="apt")
   {
       print("Part3+${result7}+${result9}\n")
       return 3
   }
   print("success\n")
   return 0
}