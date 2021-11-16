// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan can not match-61
// ASSERT: scan can not match-71
// ASSERT: scan success


from std import regex.*
func main()
{
   var matcherstr1="fggfhhhgkokkkk"
   var matcherstr="dasdadad"
   //量词{?}-匹配零次或者一次
   var regexstr6="(k)?k"
   var matcher6=Regex(regexstr6).matcher(matcherstr1)
   var result6=matcher6.find().getOrThrow().matchStr()//k-kk-kk
   var result61=matcher6.find().getOrThrow().matchStr()//k-kk-kk
   if(result6!="k")
   {
        print("Part6+${result6}\n")
        return 6
   }

  var matcher61=Regex(regexstr6).matcher(matcherstr)
   try{
       var result61=matcher61.find().getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-61\n")
   }
   //量词{??}匹配零次
   var regexstr7="(k)??k"
   var matcher7=Regex(regexstr7).matcher(matcherstr1)
   var result7=matcher7.find().getOrThrow().matchStr()//k-k-k-k-k
   if(result7!="k")
   {
       print("Part7+${result7}\n")
       return 7
   }
   var matcher71=Regex(regexstr7).matcher(matcherstr)
   try{
       var result71=matcher71.find().getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-71\n")
   }
   print("success\n")
   return 0
}