// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main() {
    var a = 0
    var b = 0
    var res = 3
    try{
        a = 1
        b = 1/(a-1)
    }
    catch (e:ArithmeticException){
        if (a == 1 && b == 0){
            return res
        }
    }
    finally{res = 0;return res}
    res = 4
    return res
}