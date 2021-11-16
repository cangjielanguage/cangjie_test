// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A <: Exception{}
class B <: A{}

func test(){
    var a = 0
    try {return a}
    catch (_:B) {print("hello catch\n")}
    finally{a = 1}
    return 10
}

func main(){
    return test()
}