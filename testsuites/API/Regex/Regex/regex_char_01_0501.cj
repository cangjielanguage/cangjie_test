// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan can not match-r1
// ASSERT: scan can not match-r2
// ASSERT: scan can not match-r3

from std import regex.*
func main()
{
   // \
   var result1=Regex("\\r").matches("\r").getOrThrow().matchStr()
   var result2=Regex("\\\r").matches("\r").getOrThrow().matchStr()
   var result3=Regex("\\\\r").matches("\\r").getOrThrow().matchStr()

   if(result1!="\r"||result2!="\r"||result3!="\\r")
   {
        print("Part1+${result1}+${result2}+${result3}")
        return 1
   }

   try{
       var resultr1=Regex("\\r").matches("\\r").getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-r1\n")
   }

   try{
       var resultr2=Regex("\\\r").matches("\\r").getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-r2\n")
   }

   try{
       var resultr3=Regex("\\\\r").matches("\r").getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-r3\n")
   }
   return 0
}