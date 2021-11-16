// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan expression of Nothing type cannot appear here currently

class A <: Exception{}

func main(){
    (throw A())
    return 0
}