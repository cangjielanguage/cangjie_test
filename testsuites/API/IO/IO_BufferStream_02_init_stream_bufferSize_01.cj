// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan Array [49, 50, 51, 52, 53, 54, 55, 56, 57, 48, 49, 50, 51, 52, 53, 54]
from std import io.*

func main() {
    var ss = StringStream("1234567890123456")
    var bf = BufferStream(ss,1)
    var b: Array<UInt8> = Array<UInt8>(16, {i => 1})
    bf.read(b)
    print("${b}")
    return 0
}