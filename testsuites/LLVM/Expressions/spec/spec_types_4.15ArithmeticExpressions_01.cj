// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(){
    let num1: Int64 = 8
    let num2 = -num1  // num2 = -8, with 'Int64' type
    let num3 = -(-num1)  // num3 =  8, with 'Int64' type
    let q1 = 7 / 3  // integer division:   2
    let q2 = -7 / 3  // integer division:  -2
    let q3 = 7 / -3  // integer division:  -2
    let q4 = -7 / -3  // integer division:   2
    let r1 = 7 % 3  // integer remainder:  1
    let r2 = -7 % 3  // integer remainder: -1
    let r3 = 7 % -3  // integer remainder:  1
    let r4 = -7 % -3  // integer remainder: -1

    let f = 2 ** 3  // power：    8
    let a = 2 + 3  // add：      5
    let b = 3 - 1  // sub：      2
    let c = 3 * 4  // multi：   12
    let d = 6.6 / 1.1  // division： 6
    let e = 4 % 3  // mod：      1
    let g = 5 + 10 - 3 * 4 ** 2 / 3 % 5  // 5 + 10 - 3 * (4 ** 2) / 3 % 5

    let h: Int32 = 2147483647  // int_MAX
    let i: Int32 = 1
    try {
        let j: Int32 = h + i  // throw an ArithmeticException
    } catch (excep: OverflowException) {
        return 0
    }

    return 1
}
