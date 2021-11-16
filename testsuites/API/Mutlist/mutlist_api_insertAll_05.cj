// EXEC: %compiler %stdx_cmp_opt %f -o %output  2>&1| compare %f

from std import collection.*

var r1:Buffer<String> = Buffer<String>(3)
var r2:Buffer<Int8> = Buffer<Int8>([1])
func main(): Int64 {
    r1.insertAll(Int64(2),"a") //EXPECTED: regex parameters and arguments mismatch
    r1.insertAll(Int64(2),r2) //EXPECTED: regex parameters and arguments mismatch
    return 0
}
