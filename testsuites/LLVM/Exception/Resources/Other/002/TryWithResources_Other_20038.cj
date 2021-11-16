// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A!A!A!A!A!success!

class A <: Resource {
    func isClosed(){print("A!");true}
    func close(){}
}


func main() {
    if (try(a : A = A()){true}){
        try(a : A = A()){true}
    } else if (try(a : A = A()){true}){
        try(a : A = A()){true}
    } else {
        try(a : A = A()){true}
    }
    print("success!\n")
    return 0
}
