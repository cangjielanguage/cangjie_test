// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import unicode.*

func main(): Int64 {
var s1:String ="st"
var s2:String ="ST"

if(s1.toUpper()==s2&&s1==s1.toLower()){
return 0
}

return 1
}