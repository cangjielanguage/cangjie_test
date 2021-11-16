// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func main(): Bool { //EXPECTED: regex type of function body is incompatible with return type
var t:Bool = true
var f:Bool = false
var c : String = "s"
var i8 :Int8 = 1
var i16 : Int16 = 1000
var i32 : Int32 = 2147483647 //Int32
var i64 : Int64 = 2147483648
var u8 : UInt8 = 0 //UInt8
var u16 : UInt16 = 65535 //UInt16
var u32 : UInt32 = 4294967290
var u64 : UInt64 = 18446744073709551615 //UInt64
var f16 : Float16 = -2.3
var f32 : Float32 = 6.104*10**-38 //Float32
var f64 : Float64 = 0x1.1p0 //Float64
f = Int8(t) //EXPECTED: regex type incompatible in this assignment
f = Int16(t) //EXPECTED: regex type incompatible in this assignment
f = Int32(t) //EXPECTED: regex type incompatible in this assignment
f = Int64(t) //EXPECTED: regex type incompatible in this assignment
f = UInt8(t) //EXPECTED: regex type incompatible in this assignment
f = UInt16(t) //EXPECTED: regex type incompatible in this assignment
f = UInt32(t) //EXPECTED: regex type incompatible in this assignment
f = UInt64(t) //EXPECTED: regex type incompatible in this assignment
f = Float16(t) //EXPECTED: regex type incompatible in this assignment
f = Float32(t) //EXPECTED: regex type incompatible in this assignment
f = Float64(t) //EXPECTED: regex type incompatible in this assignment
f = bigInt(t) //EXPECTED: regex type incompatible in this assignment
f = bigFloat(t) //EXPECTED: regex type incompatible in this assignment
t = i8 // EXPECTED: regex type incompatible in this assignment
f = i16 // EXPECTED: regex type incompatible in this assignment
t = i32 // EXPECTED: regex type incompatible in this assignment
f = i64 // EXPECTED: regex type incompatible in this assignment
t = u8 // EXPECTED: regex type incompatible in this assignment
f = u16 // EXPECTED: regex type incompatible in this assignment
t = u32 // EXPECTED: regex type incompatible in this assignment
f = u64 // EXPECTED: regex type incompatible in this assignment
t = f16 // EXPECTED: regex type incompatible in this assignment
f = f32 // EXPECTED: regex type incompatible in this assignment
t = f64
}
