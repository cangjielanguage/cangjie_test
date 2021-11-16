// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func test(): Int64 {
var i : Int32 = 1
var res = match (i) { // EXPECTED: regex-auto at least one default case, such as wildcard pattern, variable pattern or '[...]' for sequence pattern in match case
case a : Int8 => 1
case a : UInt8 => 1
case a : Int16 => 1
case a : UInt16 => 1
case a : Int32 => 1
case a : UInt32 => 1
case a : Int64 => 1
case a : UInt64 => 1
case a : Float16 => 1
case a : Float32 => 1
case a : Float64 => 1
case a : bigFloat => 1
case a : bigInt => 1
case a : Bool => 1
case a : Char => 1
case a : Unit => 1
}
if (res == 1) {
return 0
}
return 1
}

func main(): Int64 {
return test()
}
