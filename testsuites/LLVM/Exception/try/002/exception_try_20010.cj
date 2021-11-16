// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT:scan expected type

open class A <: Exception{}

class B <: A{}

func main(){
    try{throw A()}
    catch (a:_) {return 3}
    finally{}
    return 4
}