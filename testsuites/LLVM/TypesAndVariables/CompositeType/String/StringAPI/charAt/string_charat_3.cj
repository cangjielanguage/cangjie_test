// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
var s:String ="\u{4f60}\u{5728}\u{54ea}\u{91cc}"

if(s.charAt(2)!='哪'){
return 1
}


return 0
}