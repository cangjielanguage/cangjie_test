// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan isClosed!close!success!


class A <: Resource {
    func isClosed(){print("isClosed!");false}
    func close(){print("close!")}
}

func main() {
    try (freshExc = A())
    {}
    print("success!\n")
    return 0
}
