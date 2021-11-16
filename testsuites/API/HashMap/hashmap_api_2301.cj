// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan NoneValueException: Value does not exist!


from std import collection.*
var hashmap1:HashMap<Int8,String> = HashMap<Int8,String>([(1,"a"),(3,"b")])
func main(): Int64 {
    try
    {
        hashmap1[10]
        ()
    }
    catch(e:NoneValueException)
    {
        print("NoneValueException: Value does not exist!")
    }
    return 0
}