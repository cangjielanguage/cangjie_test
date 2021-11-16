// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex init
// ASSERT: scan exception_try_40028.cj:10
class A <: Exception{}


record B {
    init(){
    var a = try{if (true){throw A()}else{1}}finally{}
    }
}

func main(){
    B()
    return 0
}