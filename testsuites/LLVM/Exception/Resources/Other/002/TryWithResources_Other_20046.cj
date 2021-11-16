// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success!

var x = 0

class A <: Resource {
    func isClosed(){x++;true}
    func close(){}
}

class B <: Throwable{}

func main() {
    try {try(a : A = A()){throw B()}}
    catch (_){try(a : A = A()){}}
    finally{try(a : A = A()){}}
    print("success!\n")
    return x - 3
}
