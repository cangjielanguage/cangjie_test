// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan NoneValueException2
// ASSERT: scan NoneValueException6
// ASSERT: scan success

from std import regex.*
func main()
{
   //[^m-z]---az
   var regexstr="[^m-z]"
   var result1=Regex(regexstr).matcher("az").find().getOrThrow().matchStr()
   if(result1!="a")
   {
       print("Part+${result1}\n")
       return 1
   }
   //[^m-z]---sz
   try{
        var result2=Regex(regexstr).matcher("sz").find().getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("NoneValueException2\n")
   }

   //[^m-z]---中fg中
   var result3=Regex(regexstr).matcher("中fg中").find().getOrThrow().matchStr()
   if(result3!="中")
   {
        print("Part3+${result3}\n")
        return 3
   }

   //[m-z]---az
   var regexstr1="[m-z]"
   var result4=Regex(regexstr1).matcher("az").find().getOrThrow().matchStr()
   if(result4!="z")
   {
       print("Part4+${result4}\n")
       return 4
   }
   //[m-z]---sz
   var matcher5=Regex(regexstr1).matcher("sz")
   var result5=matcher5.find().getOrThrow().matchStr()
   var result51=matcher5.find().getOrThrow().matchStr()
   if(result5!="s"||result51!="z")
   {
       print("Part5+${result5}+${result51}\n")
       return 5
   }

   //[m-z]---中fg中
   try{
        var result6=Regex(regexstr1).matcher("中fg中").find().getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("NoneValueException6\n")
   }
   print("success\n")
   return 0
}