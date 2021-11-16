// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A!A!success!

class A <: Resource {
    func isClosed(){print("A!");true}
    func close(){}
}


func main() {
    while (try(a : A = A()){true}){
        try(a : A = A()){true}
        break
    }
    print("success!\n")
    return 0
}
