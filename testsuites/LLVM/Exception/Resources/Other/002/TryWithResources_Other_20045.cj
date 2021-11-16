// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

var x = 0

class A <: Resource {
    func isClosed(){x++;true}
    func close(){}
}


func main() {
    for (i in try(a : A = A()){1..2}){
        try(a : A = A()){1..2}
    }
    print("success!\n")
    return x-2
}
