// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regstr="[0-9][a-z]"
   var emptyregstr=""
   var matstr=""
   var str="5d"

   var regex2=Regex(emptyregstr)
   var matchesresult1=Matcher(regex2,matstr).getString()   //init(Regex: Regex, input: String)--->matstr

   var regex1=Regex(regstr)
   var matcher1=Matcher(regex1,str)
   var matchesresult2=matcher1.replace(matstr)   //replace(replacement: String) : String--->matstr

   var matcher2=Matcher(regex1,str)
   var matchesresult3=matcher2.replace(matstr,0) //replace(replacement: String, index: int64): String--->matstr

   var matcher3=Matcher(regex1,str)
   var matchesresult4=matcher3.replaceAll(matstr)//replaceAll(replacement: String) : String--->matstr

   var matcher4=Matcher(regex1,str)
   var matchesresult5=matcher4.replaceAll(matstr,1)//replaceAll(replacement: String, limit :int64 ) : String--->matstr

   var matcher5=Matcher(regex1,str)
   var matchesresult6=matcher5.resetString(matstr).getString()//resetString(input: String): Matcher--->matstr
  if(matchesresult1!=matstr||matchesresult2!=matstr||matchesresult3!=matstr||matchesresult4!=matstr||matchesresult5!=matstr||matchesresult6!=matstr)
  {
      print("${matchesresult1}+${matchesresult2}+${matchesresult3}+${matchesresult4}+${matchesresult5}+${matchesresult6}\n")
      return 1
  }
   print("success\n")
   return 0
}