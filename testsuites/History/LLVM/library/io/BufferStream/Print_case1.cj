// EXEC: echo "io=%libdir/io/io.cjo" > io.cfg
// EXEC: %compiler -i io.cfg %libdir/io/cangjieIO.o %f -o %output
// EXEC: %run %run_opt %output %run_args |compare %f
// ASSERT: scan why
// ASSERT: scan-next
// ASSERT: scan-next 9223372036854775807
// ASSERT: scan-next 2147483647
// ASSERT: scan-next 32767
// ASSERT: scan-next 127



import io.*

func main(): Int64 {
var i64:Int64=9223372036854775807
var i32:Int32=2147483647
var i16:Int16=32767
var i8:Int8=127
Print("why")
Print("")
Print(i64)
Print(i32)
Print(i16)
Print(i8)

return 0
}
