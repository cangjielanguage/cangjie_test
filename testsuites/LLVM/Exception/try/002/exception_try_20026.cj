// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A <: Exception{}
class B <: A{}

func test(){
    var a = 1
    try {return a}
    catch (_:B) {print("hello catch\n")}
    finally{a = 0;return a}
    0
}

func main(){
    var res = test()
    print("${res}\n")
    return 0
}