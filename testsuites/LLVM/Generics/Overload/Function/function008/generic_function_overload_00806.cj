// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT:scan-not core dumped

func test <T>(a:T,b:Int32=1){}
func test <T>(a:T,b:Int64=1){}


func main():Int64{
    var I = test(1) // EXPECTED: regex ambiguous match for function call
    return 0
}