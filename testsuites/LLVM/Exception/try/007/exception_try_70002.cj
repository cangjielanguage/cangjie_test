// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan expression of Nothing type cannot appear here currently

class A <: Exception{}


func main(){
    var (a,b) = (throw A(),throw A())
    return 0
}