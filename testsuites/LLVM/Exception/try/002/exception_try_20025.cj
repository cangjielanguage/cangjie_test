// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan a = 2a = 3a = 4

open class A <: Exception{}
class B <: A{}

func test(){
    var a = 1
    try {a = 2; print("a = ${a}"); throw B()}
    catch (_:B) {a = 3; print("a = ${a}")}
    finally{a = 4; print("a = ${a}")}
}

func main(){
   test()
   return 0
}