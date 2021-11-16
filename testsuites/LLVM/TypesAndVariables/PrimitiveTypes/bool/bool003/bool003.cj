// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func main(): Bool { // EXPECTED: regex type of function body is incompatible with return type
var c : String = "s" //string
var i8 : Int8 = 1
var i16 : Int16 = 1000 //Int16
var i32 : Int32 = 2147483647 //Int32
var i64 : Int64 = 2147483648 //Int64
var u8 : UInt8 = 0 //UInt8
var u16 : UInt16 = 65535 //UInt16
var u32 : UInt32 = 4294967295 //UInt32
var u64 : UInt64 = 18446744073709551615 //UInt64
var f16 : Float16 = -2.3 //Float16
var f32 : Float32 = 6.104*10**-38 //Float32
var f64 : Float64 = 0x1.1p0 //Float64
var t : Bool = true
var f : Bool = false
c = t
i8 = f
i16 = t // EXPECTED: regex type incompatible in this assignment
i32 = f // EXPECTED: regex type incompatible in this assignment
i64 = t // EXPECTED: regex type incompatible in this assignment
u8 = f // EXPECTED: regex type incompatible in this assignment
u16 = t // EXPECTED: regex type incompatible in this assignment
u32 = f // EXPECTED: regex type incompatible in this assignment
u64 = t // EXPECTED: regex type incompatible in this assignment
f16 = f // EXPECTED: regex type incompatible in this assignment
f32 = t // EXPECTED: regex type incompatible in this assignment
f64 = f
}
