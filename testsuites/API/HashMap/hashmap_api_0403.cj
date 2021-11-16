// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan IndexOutOfBoundsException


from std import collection.*
func main(): Int64 {
    try
    {
        var hashmap1:HashMap<Int8,String> = HashMap<Int8,String>(-1)
        ()
    }
    catch(e:RuntimeException)
    {
        print("IndexOutOfBoundsException")
    }
    return 0
}