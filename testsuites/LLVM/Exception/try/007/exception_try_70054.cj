// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A <: Exception{}

func main(){
    (throw A()) + (throw A())  // EXPECTED: regex invalid binary operator '\+'
    return 0
}
