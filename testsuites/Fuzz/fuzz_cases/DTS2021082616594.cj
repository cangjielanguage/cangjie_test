// EXEC: %compiler %cmp_opt -overflow wrapping %f -o %output
// EXEC-0: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

// random seed:1629705704014

// All global variable need to be defined before use!
external let var46 : String = "Nh8.XquRc "
external var var54 : Class49 = Class49()
external let var134 : Float32 = Float32(Int32(18))
external let var145 : (Float32*Int64*UInt32) = (Float32(-54.0), Int64(80.0), UInt32(Int8(-86)))
external var var176 : Range<UInt32> = (UInt32(242)..=UInt32(UInt8(UInt8((-42)))):(27|1))
external let var185 : Enum81 = Enum81.defaultValue
internal let var200 : Unit = ()
external var var207 : (UInt32*Unit*Bool*Unit) = (UInt32((-65)), (), (UInt16(Int16(-58)) is UInt64), ())
external var var219 : Char = 'p'
external var var226 : UInt64 = UInt64(211)
external let var235 : Int16 = Int16(UInt32(233))
external var var258 : Range<Int16> = (Int16(UInt64(232))..=Int16(-95):(Int64(Float32(-120.0))|1))
external var var266 : UInt8 = UInt8((-19))
internal let var271 : UInt16 = UInt16(242)
external var var305 : Int64 = Int64(Int32(-89))
func main(): Int64 {
    func7();
    if (if (true) { true } else { false } ) { // block id: 297
        ();
        (UInt32(174)..=UInt32(199):88|1);
        (-76)
    } else { // block id: 301
        Int16(-120);
        ();
        var305
    }
    // CRC Check All Variables
    var crccheck = CrcCheck(5000, 32)
    crccheck.updateBuffer(UInt64(var226), 64)
    crccheck.updateBuffer(UInt64(var235), 64)
    crccheck.updateBuffer(UInt64(var271), 64)
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
func func7() : Unit { // block id: 8
    var var17 : Unit = ();
    match (if ((Int8(-68) is String)) { // block id: 15
            var17;
            Enum10<Float64, UInt64, Class49>.defaultValue
        } else { // block id: 20
            Enum10<Float64, UInt64, Class49>.defaultValue
        }) {
        case caseVar24 : Unit => 
            ();
            var17;
            var var29 : String = "8Hns@\\&(;2";
            var29
        
        case _ : Float32 => 
            ();
            "[q|H@Hq&~C"
        
        case _ : UInt64 => 
            true;
            UInt16(161);
            ">mP,D!FEMp"
        
        case _ => 
            false;
            var46
        
    };
    let var247 : UInt8 = UInt8(UInt32(94));
    func func243() : UInt8 { // block id: 244
        match (var247) {
            case 114 | $var247 => 
                var247
            
            case _ => 
                var258;
                var266
            
        }
    }
;
    var54.func57(namedParam58 : func243(), namedParam59 : match (var271) {
        case _ : UInt16 => 
            UInt64(152)
        
        case $var271 => 
            var226
        
        case _ => 
            ();
            var17;
            var226
        
    }, optionalParam60 : match (Enum81.defaultValue) {
        case _ => 
            Float32(-99.0)
        
    })
}

external enum Enum10<T0, T1, T2> {
    defaultValue
}
external open class Class49 <: Interface50 {
    public init() { // block id: 52

    }
;
    public var var88 : Enum81 = Enum81.defaultValue;
    public let var92 : Unit = ()
}

external interface Interface50 {

}

external enum Enum81 {
    defaultValue
}
external func func122(param123 : Class49, param124 : UInt8, param125 : Int16, param126 : UInt8) : String { // block id: 127
    var var138 : Option<Float32> = (Float64((-84)) as Float32);
    (var138 ?? var145[0]);
    var var168 : Bool = true;
    var var190 : List<Bool> = [true, true, true, false, false];
    if (if ([true, var168, false, var168, var168][0]) { // block id: 174
        var176;
        var185;
        var168
    } else if (var190[2]) { // block id: 193
        UInt16(211);
        ();
        var168
    } else { // block id: 197
        Int8(-20);
        var200;
        true
    }) { match {
        case var207[2] => 
        var219;
        var46
        case _ => 
        var46
    } } else { match (var226) {
        case _ => 
            ();
            "p,bw|r34Uu"
        
    } } 
}


extend Class49 {
    public func func57(namedParam58 ! : UInt8, namedParam59 ! : UInt64, optionalParam60 ! : Float32 = Float32(-37.0), optionalParam62 ! : Bool = (Enum10<Float64, UInt64, Class49>.defaultValue is Enum10<Float64, UInt64, Class49>)) : Unit { // block id: 65
        (-7);
        func func68<T0>() : Unit { // block id: 69
            var loopTimeVar78 : Int64 = 0;
            do {
                loopTimeVar78++;

            } while ((if (false) { UInt32(156) } else { UInt32(6) }  is Bool) && loopTimeVar78 < 100 ) ;
            var loopTimeVar241 : Int64 = 0;
            do {
                loopTimeVar241++;
                func122(var54, namedParam58, var235, UInt8(250));
                (Int32(25)..Int32(-61):(-102)|1)
            } while (match (try { // block id: 84
                    ();
                    "\"]~}2-5E4,";
                    var88
                } catch (_) { // block id: 90
                    var92;
                    Enum81.defaultValue
                } finally { // block id: 95
                    (-81.0);
                    Enum81.defaultValue
                }) {
                case defaultValue => 
                    false
                
                case _ => 
                    Enum81.defaultValue;
                    optionalParam62
                
                case caseVar109 : Int32 => 
                    optionalParam62
                
                case _ : Unit => 
                    true
                
                case _ => 
                    var92;
                    false
                
            } && loopTimeVar241 < 100 ) 
        }
;
        func68<String>()
    }

}


/*
return code: 139
*/
