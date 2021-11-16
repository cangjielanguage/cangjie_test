// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan B!A!
// ASSERT: scan success!

class A <: Resource {
    func isClosed(){print("A!");true}
    func close(){}
}

class B <: Resource {
    func isClosed(){false}
    func close(){print("B!")}
}

func main() {
    try (a = A(),b = B()) // close B first.
    {}
    print("success!\n")
    return 0
}
