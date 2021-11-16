// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success


from std import regex.*
func main()
{
   var regexString="\\?*?"
   var str="?"
   var regex1=Regex(regexString)
   var regex2=Regex(regexString,2)
   var matches1=regex1.matches(str).getOrThrow().matchStr()//matches (input: String): Option<MatchData>
   var matches2=regex2.matches(str).getOrThrow().matchStr()
   var matcher1=regex1.matcher(str).fullMatch().getOrThrow().matchStr() //matcher(input: String): Matcher
   var matcher2=regex2.matcher(str).fullMatch().getOrThrow().matchStr()
   if(matches1!=str||matches2!=str)
   {
        print("step1+${matches1}+${matches2}\n")
   }
   if(matcher1!=str||matcher2!=str)
   {
        print("step1+${matcher1}+${matcher2}\n")
   }
   print("success\n")
   return 0
}