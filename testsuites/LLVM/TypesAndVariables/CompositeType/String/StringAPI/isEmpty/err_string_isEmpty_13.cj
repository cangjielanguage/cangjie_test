// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
var c =4.2

if(c.isEmpty()!=false){     // EXPECTED: regex undeclared identifier
return 1
}

return 0
}
