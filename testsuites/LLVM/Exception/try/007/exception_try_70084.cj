// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan expected pattern here

class A <: Exception{}


func main(){
    match ("1") {
        case throw A() => 0
        case _ => 0
    }
}