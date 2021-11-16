// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A <: Exception{}

func main(){
    match ("1") {
        case _ if (throw A()) => 0  // EXPECTED: regex expression of Nothing type cannot appear here currently
    }
    return 0
}
