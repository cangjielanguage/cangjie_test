// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan initialization expression of Nothing type is not supported currently

class A <: Exception{}


record B {
    var a : Int64 =throw A()
}

func main(){
    B().a
    return 0
}