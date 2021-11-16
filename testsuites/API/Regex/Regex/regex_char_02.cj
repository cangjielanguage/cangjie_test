// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan NoneValueException1
// ASSERT: scan success

from std import regex.*
func main()
{
   //[dfg]--fg
   var regexstr="[dfg]"
   var matcher1=Regex(regexstr).matcher("fg")
   var result1=matcher1.find().getOrThrow().matchStr()
   var result2=matcher1.find().getOrThrow().matchStr()
   if(result1!="f"||result2!="g")
   {
       print("Part1+${result1}+${result2}\n")
       return 1
   }
   //[dfg]--sz
   try{
      var result5=Regex(regexstr).matcher("sz").find().getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("NoneValueException1\n")
   }

   //[dfg]--中fg
   var matcher5=Regex(regexstr).matcher("中fg")
   var result10=matcher5.find().getOrThrow().matchStr()
   var result11=matcher5.find().getOrThrow().matchStr()
   if(result10!="f"||result11!="g")
   {
       print("Part4+${result10}+${result11}\n")
       return 4
   }

   //[^dfg]--sz
   var regexstr2="[^dfg]"
   var matcher3=Regex(regexstr2).matcher("sz")
   var result3=matcher3.find().getOrThrow().matchStr()
   var result4=matcher3.find().getOrThrow().matchStr()
   if(result3!="s"||result4!="z")
   {
       print("Part2+${result3}+${result4}\n")
       return 2
   }

   //[^dfg]--fg
   try{
      var result6=Regex(regexstr2).matcher("fg").find().getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("NoneValueException2\n")
   }


   //[^dfg]--s中z
   var matcher4=Regex(regexstr2).matcher("s中z")
   var result7=matcher4.find().getOrThrow().matchStr()
   var result8=matcher4.find().getOrThrow().matchStr()
   var result9=matcher4.find().getOrThrow().matchStr()
   if(result7!="s"||result8!="中"||result9!="z")
   {
       print("Part3+${result7}+${result8}+${result9}\n")
       return 3
   }
   print("success\n")
   return 0
}