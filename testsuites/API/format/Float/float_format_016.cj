// EXEC: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex  missing argument for call with parameter list

from std import format.*

func main():Int64 {
    var c: Float64 = 3_0.3__4_
    var res6 = c.format()

    return 0

}