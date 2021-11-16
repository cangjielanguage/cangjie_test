// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan only Literal const expression or dollar identifier is allowed in const pattern

class A <: Exception{}


func main(){
    match ("1") {
        case "${try{1}finally{};0}" => 0
        case _ => 0
    }
}
