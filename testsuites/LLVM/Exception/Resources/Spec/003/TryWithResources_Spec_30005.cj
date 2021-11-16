// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan exception_B

class A <: Throwable & Resource {
    func isClosed(){throw B()} // will be auto invoked before close().
    func close(){throw C()}
    override func getMessage():String{ return "message_A\n"}
    override func toString() : String{ return "exception_A\n"}
}

class B <: Throwable {
    override func getMessage():String{ return "message_B\n"}
    override func toString() : String{ return "exception_B\n"}
}

class C <: Throwable {
    override func getMessage():String{ return "message_C\n"}
    override func toString() : String{ return "exception_C\n"}
}

func main() {
    try (a : A = A())
    {
    } finally {}
    return 0
}
