// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT:scan top

func test(a:Int32){print("top")}
func a(){ func test(a:Int16){print("inside")} }


func main():Int64{
    test(1)
    return 0
}