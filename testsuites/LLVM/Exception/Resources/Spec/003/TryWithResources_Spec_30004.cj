// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan exception_B

class A <: Throwable & Resource {
    func isClosed(){throw B()} // will be auto invoked.
    func close(){print("A!\n")}
    override func getMessage():String{ return "message_A\n"}
    override func toString() : String{ return "exception_A\n"}
}

class B <: Throwable {
    override func getMessage():String{ return "message_B\n"}
    override func toString() : String{ return "exception_B\n"}
}


func main() {
    try (a : A = A())
    {
    } finally {}
    return 0
}
