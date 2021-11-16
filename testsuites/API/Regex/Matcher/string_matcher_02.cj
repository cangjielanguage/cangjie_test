// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var str="5#a"
   var regstr="#"
   var replacestr="##"
   var resultstr="5##a"

   var regex1=Regex(regstr)
   var matchesresult1=Matcher(regex1,str).getString()   //init(Regex: Regex, input: String)--->str

   var matcher1=Matcher(regex1,str)
   var matchesresult2=matcher1.replace(replacestr)   //replace(replacement: String) : String--->resultstr

   var matcher2=Matcher(regex1,str)
   var matchesresult3=matcher2.replace(replacestr,0) //replace(replacement: String, index: int64): String--->resultstr

   var matcher3=Matcher(regex1,str)
   var matchesresult4=matcher3.replaceAll(replacestr)//replaceAll(replacement: String) : String--->resultstr

   var matcher4=Matcher(regex1,str)
   var matchesresult5=matcher4.replaceAll(replacestr,1)//replaceAll(replacement: String, limit :int64 ) : String--->resultstr

   var matcher5=Matcher(regex1,str)
   var matchesresult6=matcher5.resetString(replacestr).getString()//resetString(input: String): Matcher--->resultstr
  if(matchesresult1!=str||matchesresult2!=resultstr||matchesresult3!=resultstr||matchesresult4!=resultstr||matchesresult5!=resultstr||matchesresult6!=replacestr)
  {
      print("${matchesresult1}+${matchesresult2}+${matchesresult3}+${matchesresult4}+${matchesresult5}+${matchesresult6}\n")
      return 1
  }
   print("success\n")
   return 0
}