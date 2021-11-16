// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func test() : Int64 {if (true)  {return ()}else{return 1}} // EXPECTED: regex type of return expression is incompatible with return type


func main(): Int64 {
return 1
}
