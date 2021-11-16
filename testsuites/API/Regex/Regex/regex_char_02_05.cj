// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
    // \d匹配任何十进制数字
    var regexstr10="\\d"
    var matcherstr8="d%*^4\t0b10o300x18"
    var matcher10=Regex(regexstr10).matcher(matcherstr8)
    var result101=matcher10.find().getOrThrow().matchStr()
    var result102=matcher10.find().getOrThrow().matchStr()
    var result103=matcher10.find().getOrThrow().matchStr()
    var result104=matcher10.find().getOrThrow().matchStr()
    var result105=matcher10.find().getOrThrow().matchStr()
    var result106=matcher10.find().getOrThrow().matchStr()
    var result107=matcher10.find().getOrThrow().matchStr()
    var result108=matcher10.find().getOrThrow().matchStr()
    var result109=matcher10.find().getOrThrow().matchStr()
    if(result101!="4"||result102!="0"||result103!="1"||result104!="0"||result105!="3"||result106!="0"||result107!="0"||result108!="1"||result109!="8")
    {
        print("Part9+${result101}+${result102}+${result103}+${result104}+${result105}+${result106}+${result107}+${result108}+${result109}\n")
        return 9
    }
    // \D匹配不是十进制数字的字符
    var regexstr11="\\D"
    var matcherstr9="d%*^4\t0b10o300x18"
    var matcher11=Regex(regexstr11).matcher(matcherstr9)
    var result111=matcher11.find().getOrThrow().matchStr()
    var result112=matcher11.find().getOrThrow().matchStr()
    var result113=matcher11.find().getOrThrow().matchStr()
    var result114=matcher11.find().getOrThrow().matchStr()
    var result115=matcher11.find().getOrThrow().matchStr()
    var result116=matcher11.find().getOrThrow().matchStr()
    var result117=matcher11.find().getOrThrow().matchStr()
    var result118=matcher11.find().getOrThrow().matchStr()
    if(result111!="d"||result112!="%"||result113!="*"||result114!="^"||result115!="\t"||result116!="b"||result117!="o"||result118!="x")
    {
        print("Part11+${result111}+${result112}+${result113}+${result114}+${result115}+${result116}+${result117}+${result118}\n")
        return 10
    }
   print("success\n")
   return 0
}