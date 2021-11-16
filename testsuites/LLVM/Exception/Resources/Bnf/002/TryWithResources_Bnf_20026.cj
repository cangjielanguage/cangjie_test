// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan try!
// ASSERT: scan close!
// ASSERT: scan success!

from std import sync.*

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!\n")}
}




func main() {
    (spawn{A()}).getResult()??A()

    try (a = (spawn{A()}).getResult()??A())
    {
        print("try!\n")
    }
    print("success!\n")

    return 0
}
