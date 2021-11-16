// EXEC: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f


from std import format.*

class A {}

func main():Int64 {
    var res1 = 18446744073709551616.format("-10.40") // EXPECTED: regex the number '18446744073709551616' exceeds the value range of type 'Int64'
    var res2 = ().format("+50.40")  // EXPECTED: regex undeclared identifier 'format'
    var res3 = A().format("#50.40") // EXPECTED: regex 'format' is not a member of class 'A'

    return 0

}