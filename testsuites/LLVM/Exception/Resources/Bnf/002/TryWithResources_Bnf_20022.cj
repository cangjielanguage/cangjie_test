// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan expression of Nothing type cannot appear here currently

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}



func main() {
    while (false){
        try (a = continue)
        {
            print("try!\n")
        }
    }
    print("success!\n")
    return 0
}
