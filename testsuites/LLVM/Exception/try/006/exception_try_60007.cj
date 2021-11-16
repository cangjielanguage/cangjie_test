// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex default.*A
// ASSERT: regex exception_try_60007.cj:7
class A <: Exception{}

var a = try {  A().printStackTrace()} finally{}

func main(){
    a
    return 0
}