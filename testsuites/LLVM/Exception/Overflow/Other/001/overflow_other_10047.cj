// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

@overflowThrowing
func test():Int8{
    var x : Int8 = 100
    var y : Int8 = 100
    return x+y
}



func main(){
    try {
        test()
    } catch (e:Exception){
        print("success")
        return 0
    }
    return 1
}
