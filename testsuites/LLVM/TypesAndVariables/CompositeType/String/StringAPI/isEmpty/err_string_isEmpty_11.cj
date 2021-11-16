// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
var a ='a'

if(a.isEmpty()!=false){     // EXPECTED: regex undeclared identifier
return 1
}


return 0
}
