// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan integer type is expected for start, stop and step in range expression

class A <: Exception{}

func main(){
    (throw A())..=(throw A()):(throw A())
    return 0
}