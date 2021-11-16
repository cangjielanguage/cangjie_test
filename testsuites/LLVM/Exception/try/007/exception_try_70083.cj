// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT:scan only Literal const expression or dollar identifier is allowed in const pattern

class A <: Exception{}

func main(){
    match ("1") {
        case "${throw A();0}" => 0
        case _ => 0
    }
}