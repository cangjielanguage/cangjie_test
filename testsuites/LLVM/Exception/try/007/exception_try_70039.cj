// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan illegal operator '&&' for overloading

class A <: Exception{ operator func &&(a:A,b:A){a}}

func main(){
    throw (true&&true)
    return 0
}