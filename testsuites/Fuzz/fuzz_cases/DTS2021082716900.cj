// EXEC: %compiler %cmp_opt -overflow wrapping %f -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

// random seed:1629934375190

// All global variable need to be defined before use!
external var var26 : List<Unit> = [(), (), (), (), ()]
external var var50 : UInt64 = UInt64(Int8(-89))
external let var111 : String = "NT?>Pby9Q<"
external var var117 : (List<Unit>*UInt16) = ([(), (), (), (), ()], UInt16(151))
func main(): Int64 {
    let var89 : UInt8 = UInt8(133);
    let var96 : Unit = ();
    let var99 : Range<Int16> = (Int16(-24)..=Int16(48):(29|1));
    func func6<T0>(namedParam7 ! : Int8, namedParam8 ! : UInt16) : Int64 { // block id: 9
        let var33 : Option<List<Unit>> = Option<List<Unit>>.None;
        ([Option<List<Unit>>.None, var33, var33, Option<List<Unit>>.Some(var26), Option<List<Unit>>.None][0] ?? (Option<List<Unit>>.None ?? [(), (), (), (), ()]))[4];
        let var70 : (Range<Int32>*Int8*Int8*Int64) = ((Int32(UInt8(17))..=Int32(Int16(Int8(77))):((-56)|1)), Int8(UInt64(8)), Int8(20), Int64(Int64(Int8(Int8(9)))));
        func func55<T0, T1>(param56 : UInt8, namedParam57 ! : Bool, namedParam58 ! : Unit, namedParam59 ! : Range<Int16>) : UInt64 { // block id: 60
            UInt64(match (var33) {
                case _ => 
                    ".'LLn[*q++";
                    var70
                
            }[2])
        }
;
        let var92 : Bool = (UInt64(241) is Int64);
        Int64((Option<UInt64>.Some(var50) ?? func55<Range<UInt32>, Range<UInt32>>(var89, namedParam57 : var92, namedParam58 : var96, namedParam59 : var99)))
    }
;
    var var108 : Int8 = Int8(29);
    func6<UInt64>(namedParam7 : (var108, var111)[0], namedParam8 : var117[1])
    // CRC Check All Variables
    var crccheck = CrcCheck(5000, 32)
    crccheck.updateBuffer(UInt64(var89), 64)
    crccheck.updateBuffer(UInt64(var108), 64)
    crccheck.updateBuffer(UInt64(var50), 64)
    crccheck.crcCheck()
    crccheck.getCrcOutput()

    return 0;
}

class CrcCheck {
    var buffer: Array<Int64>
    var poly: Array<Int64>
    var crc_output: Array<Int64>
    var poly_n: Int64
    var buffer_index: Int64
    var crc_output_n: Int64

    init(buffer_n: Int64, crc_n: Int64) {
        buffer_index = 0
        crc_output_n = 0
        crc_output = Array<Int64> (crc_output_n, 0)
        buffer = Array<Int64> (buffer_n, 0)
        poly_n = crc_n + 1
        poly = Array<Int64> (poly_n, 0)
        if (crc_n == 32) {
            poly = @{1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1}
        } else if (crc_n == 16) {
            poly = @{1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1}
        } else if (crc_n == 8) {
            poly = @{1, 0, 0, 0, 0, 0, 1, 1, 1}
        } else {
            poly = @{1, 1, 0, 0, 1}
        }
    }

    func updateBuffer(input: UInt64, byte_n: Int64): Unit {
        var value = input
        if (byte_n == 64) {
            value = value & 0xffffffffffffffff
        } else if (byte_n == 32) {
            value = value & 0xffffffff
        } else if (byte_n == 16) {
            value = value & 0xffff
        } else {
            value = value & 0xff
        }
        var byteArray = Array<Int64> (byte_n, 0)
        var byte_c = 1
        var byte_index = 0
        while(value != 0) {
            if (value % 2 == 1) {
                byte_index = byte_n - byte_c
                byteArray[byte_index] = 1
            }
            byte_c++
            value = value >> 1
        }
        var i = 0
        while (i + byte_index < byte_n) {
            buffer[i + buffer_index] = byteArray[i + byte_index]
            i++
        }
        buffer_index = buffer_index + i
    }

    func crcCheck(): Unit {
        crc_output_n = buffer_index + poly_n - 1
        var crc_buffer = Array<Int64> (crc_output_n, 0)
        var i = 0
        while (i < buffer_index) {
            crc_buffer[i] = buffer[i]
            i++
        }
        i = 0
        while (i < buffer_index) {
            if (crc_buffer[i] == 1) {
                var j = 0
                while (j < poly_n) {
                    crc_buffer[j + i] = crc_buffer[j + i] ^ poly[j]
                    j++
                }
            }
            i++
        }
        let check_code = crc_buffer[buffer_index..]
        var byte_add = 3 - crc_output_n % 3
        crc_output_n = byte_add + crc_output_n
        crc_output = Array<Int64> (crc_output_n, 0)
        i = 0
        while (i < crc_output_n - byte_add) {
            if (i < buffer_index) {
                crc_output[i + byte_add] = buffer[i]
            } else {
                crc_output[i + byte_add] = check_code[i - buffer_index]
            }
            i++
        }
    }

    func getCrcOutput(): Unit {
        var i = 0
        while (i < crc_output_n) {
            var hex_value = 2**2 * crc_output[i] + 2**1 * crc_output[i + 1] + 1 * crc_output[i + 2]
            print(hex_value.toString())
            i = i + 3
        }
    }
}



/*
return code: 139
*/
