// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args  2>&1 | compare %f
// ASSERT: scan exception_D

class A <: Resource {
    func isClosed(){throw C()}
    func close(){print("A!\n")}
}

class B <: Throwable {
    override func getMessage():String{ return "message_B\n"}
    override func toString() : String{ return "exception_B\n"}
}

class C <: Throwable {
    override func getMessage():String{ return "message_C\n"}
    override func toString() : String{ return "exception_C\n"}
}

class D <: Throwable {
    override func getMessage():String{ return "message_D\n"}
    override func toString() : String{ return "exception_D\n"}
}


func main() {
    while (true){
        try (a : A = A())
        {
            throw B()
        } finally {
            throw D()
        }
    }
    return 0
}
