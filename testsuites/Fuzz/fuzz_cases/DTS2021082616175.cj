// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

// random seed:1629780456393

// All global variable need to be defined before use!
internal let var10 : Bool = (Float32(110.0) is UInt64)
internal var var15 : Unit = ()
external var var69 : Unit = ()
external var var110 : UInt16 = UInt16(UInt16(221))
external let var114 : Range<UInt8> = (UInt8(171)..UInt8(128):94|1)
internal var var121 : List<Float64> = [105.0, 106.0, (-20.0), (-36.0), (-62.0)]
internal let var134 : UInt32 = UInt32(230)
external var var148 : Enum145 = Enum145.defaultValue
internal let var157 : UInt32 = UInt32(187)
external let var162 : Float32 = Float32(-34.0)
external let var165 : (Bool*Int32*Unit) = (false, Int32(Int8(-49)), ())
external var var205 : List<(Range<UInt32>*Float32*(Bool*Int32*Unit)*Int16)> = [((UInt32(215)..=UInt32(154):52|1), Float32(Int16(-64)), ((UInt8(71) is UInt8), Int32(6), ()), Int16(Float32(77.0))), ((UInt32(Float32(-54.0))..UInt32(86):((-85)|1)), Float32(9.0), ((Int16(-33) is Range<Int16>), Int32(Float32(81.0)), ()), Int16(Int8(UInt8(162)))), ((UInt32(20)..UInt32(141):(Int64(Float32(-37.0))|1)), Float32(Int32((-51))), (((Int32(67)..=Int32(42):(-17)|1) is (Range<UInt32>*Float32*(Bool*Int32*Unit)*Int16)), Int32(-128), ()), Int16(38)), ((UInt32(62)..=UInt32(78):94|1), Float32(Int32(Int8(-106))), (true, Int32(UInt8(184)), ()), Int16((-50.0))), ((UInt32(142)..UInt32(92):6|1), Float32(Int8(12)), (((UInt8(138)..=UInt8(41):(67|1)) is Range<UInt8>), Int32(7), ()), Int16(87))]
external let var356 : String = "_6{~!Z[>{}"
internal var var368 : Int16 = Int16(76)
external var var380 : List<Class50<Int64, Int32, Int8>> = [Class50<Int64, Int32, Int8>(), Class50<Int64, Int32, Int8>(), Class50<Int64, Int32, Int8>(), Class50<Int64, Int32, Int8>(), Class50<Int64, Int32, Int8>()]
external let var394 : UInt64 = UInt64(42)
internal var var422 : Class50<Int64, Int32, Int8> = Class50<Int64, Int32, Int8>()
external let var470 : (Enum145*(Bool*Int32*Unit)*Bool) = (Enum145.defaultValue, (false, Int32(Int16(110.0)), ()), true)
external let var506 : Int64 = 25
external var var525 : Result<(Enum145*(Bool*Int32*Unit)*Bool)> = Result<(Enum145*(Bool*Int32*Unit)*Bool)>.Ok(var470)
external let var529 : Range<Int8> = (Int8(27)..Int8(UInt8(183)):(50|1))
func main(): Int64 {
    if (if (var10) { // block id: 13
        var15;
        var10
    } else { // block id: 18
        ();
        true
    }) { // block id: 21

    } else if ([true, var10, var10, var10, false][2]) { // block id: 39
        let var41 : Unit = ();
        var41
    };
    var var46 : List<UInt64> = [UInt64(27), UInt64(233), UInt64(36), UInt64(17), UInt64(183)];
    var46[2];
    func54(var529, namedParam56 : var529).var537
    // CRC Check All Variables
    var crccheck = CrcCheck(5000, 32)
    crccheck.updateBuffer(UInt64(var110), 64)
    crccheck.updateBuffer(UInt64(var134), 64)
    crccheck.updateBuffer(UInt64(var157), 64)
    crccheck.updateBuffer(UInt64(var368), 64)
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
internal open class Class50<T0, T1, T2> where T0 <: Int64, T1 <: Int32, T2 <: Int8 {
    public init() { // block id: 52

    }
;
    public static var var331 : Int8 = Int8(Int64(UInt32(Float64(UInt64(23)))));
    public var var425 : Unit = ();
    let var537 : Int64 = Int64(45)
}

func func54(param55 : Range<Int8>, namedParam56 ! : Range<Int8>) : Class50<Int64, Int32, Int8> { // block id: 57
    var loopTimeVar62 : Int64 = 0;
    do {
        loopTimeVar62++;

    } while (true && loopTimeVar62 < 100 ) ;
    (if (func73(namedParam74 : ((-10)..(-15):22|1), namedParam75 : (Int8(42)..Int8(-59):((-36)|1)), namedParam76 : var394)) { // block id: 396
        Result<Unit>.Ok(var69)
    } else if (if (true) { // block id: 401
        var15;
        var15;
        var10
    } else { // block id: 405
        ();
        var368;
        true
    }) { // block id: 409
        ();
        var15;
        let var413 : Result<Unit> = Result<Unit>.Ok(var69);
        var413
    } else { // block id: 416
        ();
        ();
        Result<Unit>.Err(Exception())
    } ?? var422.var425);
    let var499 : UInt8 = UInt8(Int16(Int8(Float32(UInt32(126)))));
    func428(optionalParam429 : match (func444(var205, optionalParam446 : [(-61.0), 54.0, 37.0, (-60.0), (-97.0)], namedParam460 : (UInt8(16)..=var499:(var506|1)))) {
        case defaultValue => 
            var114
        
        case _ : List<(Range<UInt32>*Float32*(Bool*Int32*Unit)*Int16)> => 
            ();
            ();
            var114
        
        case defaultValue => 
            (UInt8(182)..=UInt8(202):59|1)
        
        case _ => 
            var525;
            (UInt8(52)..UInt8(22):(-67)|1)
        
    })
}


func func73(namedParam74 ! : Range<Int64>, namedParam75 ! : Range<Int8>, namedParam76 ! : UInt64) : Bool { // block id: 77
    if (match (Result<Unit>.Ok(var69)) {
        case _ : Char => 
            var10
        
        case _ => 
            var15;
            ();
            var10
        
        case caseVar94 : String => 
            var10
        
        case _ => 
            var69;
            true
        
    }) { // block id: 101
        if (var10) { // block id: 104
            ();
            ()
        } else if (var10) { // block id: 108
            var110;
            var114;
            ()
        };
        [true, true, true, true, false];
        var121[1]
    } else if (var10) { // block id: 125
        var var129 : String = "q96|gFwsan";
        if (true) { var129 } else { "\\h~REc@$=p" } ;
        Float64(var134)
    } else { // block id: 136
        [62.0, (-80.0), 9.0, 82.0, (-87.0)][0]
    };
    match (var148) {
        case _ => 
            var15;
            Int8(47);
            ((var157..var134:(25|1)), var162, var165, Int16(106))
        
    }[2][2];
    Class50<Int64, Int32, Int8>.func177<Char, Range<UInt16>>(namedParam178 : if (false) { Int16(-36) } else { var368 } , optionalParam179 : if (true) { // block id: 372
        ();
        var69
    } else if (true) { // block id: 376

    }, namedParam181 : var380[0])
}

external enum Enum145 {
    defaultValue
}

internal func func428(optionalParam429 ! : Range<UInt8> = (UInt8(140)..=UInt8(221):(-52)|1), optionalParam431 ! : Unit = ()) : Class50<Int64, Int32, Int8> { // block id: 433
    Class435<Class50<Int64, Int32, Int8>, Class50<Int64, Int32, Int8>, Enum145>.var440
}

internal open class Class435<T0, T1, T2> where T0 <: Class50<Int64, Int32, Int8>, T1 <: Class50<Int64, Int32, Int8>, T2 <: Enum145 {
    init() { // block id: 437

    }
;
    public static let var440 : Class50<Int64, Int32, Int8> = Class50<Int64, Int32, Int8>()
}

external func func444(param445 : List<(Range<UInt32>*Float32*(Bool*Int32*Unit)*Int16)>, optionalParam446 ! : List<Float64> = [Float64(Int8(-75)), Float64(UInt16(Int16(Int32(32)))), 13.0, (-40.0), Float64(Int64(Float64(Float32(-15.0))))], namedParam460 ! : Range<UInt8>) : Enum145 { // block id: 461
    let var482 : (Enum145*(Bool*Int32*Unit)*Bool) = (Enum145.defaultValue, (false, Int32(80), ()), (UInt64(Int32(UInt64(247))) is Class50<Int64, Int32, Int8>));
    (Result<(Enum145*(Bool*Int32*Unit)*Bool)>.Err(Exception()) ?? var482)[0]
}


extend Class50<T0, T1, T2> where T0 <: Int64, T1 <: Int32, T2 <: Int8 {
    static func func177<T0, T1>(namedParam178 ! : Int16, optionalParam179 ! : Unit = (), namedParam181 ! : Class50<Int64, Int32, Int8>) : Bool { // block id: 182
        let var277 : Result<List<(Range<UInt32>*Float32*(Bool*Int32*Unit)*Int16)>> = Result<List<(Range<UInt32>*Float32*(Bool*Int32*Unit)*Int16)>>.Ok(var205);
        let var294 : (Range<UInt32>*Float32*(Bool*Int32*Unit)*Int16) = ((UInt32(157)..=UInt32(209):(-104)|1), Float32(UInt32((-116.0))), (true, Int32(29), ()), Int16(Float32(46.0)));
        try { // block id: 184
            if (var10) { // block id: 187
                var10;
                ();
                ()
            };
            let var286 : UInt32 = UInt32(221);
            func func192<T0, T1, T2>(param193 : Bool, param194 : Range<Int8>, namedParam195 ! : Float32) : (Range<UInt32>*Float32*(Bool*Int32*Unit)*Int16) { // block id: 196
                var var316 : Int32 = Int32(UInt8(Int8(-28)));
                (if (true) { var277 } else { Result<List<(Range<UInt32>*Float32*(Bool*Int32*Unit)*Int16)>>.Err(Exception()) }  ?? (var277 ?? [((var286..UInt32(4):(104|1)), Float32(61.0), var165, namedParam178), var294, var294, ((var286..var134:(120|1)), Float32(39.0), (var10, var316, ()), Int16(-42)), ((UInt32(33)..=UInt32(168):(-49)|1), Float32(-67.0), var165, Int16(27))]))[1]
            }
;
            func192<Int16, Float32, List<Class50<Int64, Int32, Int8>>>(true, (var331..Int8(-12):((-10)|1)), namedParam195 : var162)
        } finally { // block id: 340
            if (var10) { // block id: 343
                var var345 : List<UInt64> = [UInt64(34), UInt64(Float32(UInt16((-62)))), UInt64(70), UInt64(124), UInt64(37)];
                var345;
                var356;
                var294
            } else { // block id: 359
                UInt64(219);
                var162;
                var294
            }
        };
        false
    }

}


/*
[CHIR CodeGen Error]: generate enum selector failed.
return code: 139
*/
