// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan expression of Nothing type cannot appear here currently

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}



func main() {
    while (true){
        try (a = break)
        {
            print("try!\n")
        }
    }
    print("success!\n")
    return 0
}
