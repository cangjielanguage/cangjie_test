// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A!success!

class A <: Resource {
    func isClosed(){print("A!");true}
    func close(){}
}


func main() {
    match {
        case _ => try(a : A = A()){true}
    } 
    print("success!\n")
    return 0
}
