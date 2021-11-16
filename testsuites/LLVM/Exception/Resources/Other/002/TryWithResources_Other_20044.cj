// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success!

var x = 0

class A <: Resource {
    func isClosed(){x++;true}
    func close(){}
}


func main() {
    do(try(a : A = A()){true}){
        try(a : A = A()){true}
        break
    }while(try(a : A = A()){true})
    print("success!\n")
    return x - 2
}
