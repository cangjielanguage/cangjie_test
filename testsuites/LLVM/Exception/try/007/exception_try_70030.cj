// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan initialization expression of Nothing type is not supported currently

class A <: Exception{}


func test(){
    var a = throw A()
}
func main(){
    test()
    return 0
}