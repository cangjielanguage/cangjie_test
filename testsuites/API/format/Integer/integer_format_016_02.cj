// EXEC: %compiler %stdx_cmp_opt %f -o %output  2>&1 | compare %f
// ASSERT: regex missing argument for call with parameter list


from std import format.*

func main():Int64 {
    var res6 = 0.format()

    return 0

}