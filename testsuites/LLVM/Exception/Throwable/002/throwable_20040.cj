// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(): Int64{
    var res = 2
    var (a,b,c) = (1,2,1)
    try{
        a = 3
        try {
            b = b / (a-3)
        } catch (e : ArithmeticException) {
            res = 0
        }
        c = 3
    } catch (e:ArithmeticException) {
        res = 1
    }
    return res // should be 0
}

func main() {
    test()
}
