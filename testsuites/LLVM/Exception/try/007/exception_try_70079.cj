// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan use no-numeric type expr for numeric type convert

class A <: Exception{}

func main(){
    Int64(throw A())
    return 0
}