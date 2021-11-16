// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan exception_B

class A <: Resource {
    func isClosed(){throw B()}
    func close(){print("A!\n")}
}

class B <: Throwable {
    override func getMessage():String{ return "message_B\n"}
    override func toString() : String{ return "exception_B\n"}
}


func main() {

    while (true){
    try (a : A = A())
        {
            break
        }
    }
    return 0
}
