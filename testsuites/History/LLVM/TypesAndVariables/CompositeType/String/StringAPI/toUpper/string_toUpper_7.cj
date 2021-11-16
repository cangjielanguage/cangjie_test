// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
var s:String ="string"
var a=s.toUpper()
var b=a.toUpper()
var c=b.toUpper()
if(s.toUpper()!="STRING"||a != "STRING"||b != "STRING"||c != "STRING"){
return 1
}
return 0
}