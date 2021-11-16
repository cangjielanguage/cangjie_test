// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64{
    var num1 = 2
    var num2: Int64 = 3

    var str = "hello world"
    var res1 = str.charAt(num1)
    var res1_1 = "hello world".charAt(num1)
    var res2 = str.charAt(num2)
    var res3 = str.charAt(4)
    var res3_1 = "hello world".charAt(4)
    var res4: Int64 = str.lastIndexOf('e') ?? -1
    var res5: Int64 = str.indexOf('e') ?? -1
    var res6: Int64 = "hello world".indexOf('e') ?? -1
    if (res1 == 'l' && res1_1 == 'l' && res2 == 'l' && res3 == 'o' && res3_1 == 'o' && res4 == 1 && res5 == 1 && res6 == 1) {
        return 0
    }
    return 1
}
