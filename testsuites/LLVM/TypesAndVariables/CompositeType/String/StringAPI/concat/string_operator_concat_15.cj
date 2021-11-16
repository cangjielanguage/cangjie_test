// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import unicode.*


func main(): Int64 {
var s="ST"
let stringList =["aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",s.toUpper()]
print(String.join(stringList))
if(String.join(stringList)=="aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaST"){
return 0
}

return 1
}