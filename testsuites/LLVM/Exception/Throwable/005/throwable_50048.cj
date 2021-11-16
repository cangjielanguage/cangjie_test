// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Throwable{}

class B <: Throwable{}

record C{
    operator func !(){throw A()}
}


func main() {
    try{
        !C();
        ()
    } catch (a:A) {
        a.printStackTrace()
        print("success")
    }
    return 0
}
