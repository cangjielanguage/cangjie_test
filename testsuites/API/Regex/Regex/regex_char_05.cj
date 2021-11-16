// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan can not match-31
// ASSERT: scan can not match-41
// ASSERT: scan can not match-51
// ASSERT: scan can not match-61
// ASSERT: scan success

from std import regex.*
func main()
{
   var matcherstr1="fggfhkkhhgkkk"
   //量词{*}:many or zero
   var regexstr3="k.*k"
   var matcherstr="dasdadad"
   var matcher3=Regex(regexstr3).matcher(matcherstr1)
   var result3=matcher3.find().getOrThrow().matchStr()
   if(result3!="kkhhgkkk")
   {
        print("Part3+${result3}\n")
        return 4
   }
   var matcher31=Regex(regexstr3).matcher(matcherstr)
   try{
        var result31=matcher31.find().getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-31\n")
   }

   var regexstr4="k.*"
   var matcher4=Regex(regexstr4).matcher(matcherstr1)
   var result4=matcher4.find().getOrThrow().matchStr()
   if(result4!="kkhhgkkk")
   {
        print("Part4+${result4}\n")
        return 4
   }
   var matcher41=Regex(regexstr4).matcher(matcherstr)
   try{
        var result41=matcher41.find().getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-41\n")
   }

   //量词{*?}:only one
   var regexstr5="k.*?"
   var matcher5=Regex(regexstr5).matcher(matcherstr1)
   var result5=matcher5.find().getOrThrow().matchStr()
   if(result5!="k")
   {
       print("Part5+${result5}\n")
       return 5
   }
   var matcher51=Regex(regexstr5).matcher(matcherstr)
   try{
        var result51=matcher51.find().getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-51\n")
   }

   var regexstr6="k.*?k"
   var matcher6=Regex(regexstr6).matcher(matcherstr1)
   var result6=matcher6.find().getOrThrow().matchStr()

   if(result6!="kk")
   {
       print("Part6+${result6}\n")
       return 5
   }

   var matcher61=Regex(regexstr6).matcher(matcherstr)
   try{
        var result61=matcher61.find().getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-61\n")
   }
   print("success\n")
   return 0
}