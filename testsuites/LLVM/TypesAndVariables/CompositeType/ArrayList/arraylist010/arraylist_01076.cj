// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan oh

func main(): Int64 {
    var l : Int64 = 100000
    func x(input:Int64):Int64{input}
    let a : ArrayList<Int64> = ArrayList<Int64>(l,x)
    func test(input:Int64):Unit{
        if (input == 99999) {
            print("oh")
        }
        return
    }

    a.forEach(test)
    return 0
}