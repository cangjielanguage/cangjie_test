// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex main
// ASSERT: scan exception_try_40088.cj:10)
class A <: Exception{}


func main(){
    match ("1") {
        case _ if ( if (true){try{throw A();true}finally{}} else {true}) => 0
        case _ => 1
    }
    return 0
}