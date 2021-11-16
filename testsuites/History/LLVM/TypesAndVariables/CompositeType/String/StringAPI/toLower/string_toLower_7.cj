// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
var s:String ="String"
var a=s.toLower()
var b=a.toLower()
var c=b.toLower()
if(s.toLower()!="string"||a != "string"||b != "string"||c != "string"){
return 1
}
return 0
}