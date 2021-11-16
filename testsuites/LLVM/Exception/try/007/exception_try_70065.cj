// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan initialization expression of Nothing type is not supported currently


class A <: Exception{}

var i : ()->A ={A()}
var a = throw i()

func main(){
    a
    return 0
}