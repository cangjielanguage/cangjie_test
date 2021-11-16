// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A!A!A!success!

class A <: Resource {
    func isClosed(){print("A!");true}
    func close(){}
}


func main() {
    match (try(a : A = A()){true}){
        case in (try(a : A = A()){[true,true]}) => try(a : A = A()){true}
        case _ => throw Exception()
    }
    print("success!\n")
    return 0
}
