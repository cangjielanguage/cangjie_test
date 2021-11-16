// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan paren_expr is illegal before this increment or decrement expression

class A <: Exception{}

func main(){
    (throw A())++
    return 0
}