// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan can not match-t1
// ASSERT: scan can not match-t2
// ASSERT: scan can not match-t3

from std import regex.*
func main()
{
   // \
   var result1=Regex("\\t").matches("\t").getOrThrow().matchStr()
   var result2=Regex("\\\t").matches("\t").getOrThrow().matchStr()
   var result3=Regex("\\\\t").matches("\\t").getOrThrow().matchStr()

   if(result1!="\t"||result2!="\t"||result3!="\\t")
   {
        print("Part1+${result1}+${result2}+${result3}\n")
        return 1
   }

   try{
       var resultt1=Regex("\\t").matches("\\t").getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-t1\n")
   }

   try{
       var resultt2=Regex("\\\t").matches("\\t").getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-t2\n")
   }

   try{
       var resultt3=Regex("\\\\t").matches("\t").getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-t3\n")
   }
   return 0
}