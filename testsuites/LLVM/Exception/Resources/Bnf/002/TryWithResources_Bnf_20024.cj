// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan try!
// ASSERT: scan close!
// ASSERT: scan success!

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}


class T{
    var x = A()
    func test(){
        try (a = this.x)
        {
        print("try!\n")
        }
        print("success!\n")
    }

}


func main() {
    T().test()
    return 0
}
