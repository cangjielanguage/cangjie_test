// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-0: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

// random seed:1629706991271

// All global variable need to be defined before use!
external let var14 : Class8<String, Range<Int8>, Range<Int8>> = Class8<String, Range<Int8>, Range<Int8>>()
external var var39 : Unit = ()
internal var var47 : UInt8 = UInt8(Float32(69.0))
internal var var51 : Int64 = Int64(Int8(UInt32(61)))
internal let var75 : Enum72 = Enum72.defaultValue
external let var81 : Range<Int32> = (Int32(-69)..=Int32(UInt32(165)):((-94)|1))
internal let var110 : Interface9 = Class8<String, Range<Int8>, Range<Int8>>()
external let var171 : UInt32 = UInt32(52)
external let var265 : Result<Unit> = Result<Unit>.Ok(var39)
external let var273 : (Bool*Bool*Bool) = ((Enum72.defaultValue is UInt64), ((Int8(-52)..Int8(-87):(Int64(UInt8(233))|1)) is Range<UInt64>), false)
internal let var292 : List<Result<Unit>> = [Result<Unit>.Err(Exception()), Result<Unit>.Err(Exception()), Result<Unit>.Err(Exception()), Result<Unit>.Ok(var39), Result<Unit>.Ok(var39)]
internal var var361 : Float32 = Float32(Float32(UInt8(87)))
external var var371 : Float32 = Float32(72.0)
external var var509 : List<Int64> = [Int64(15.0), Int64(UInt16(3.0)), (-33), 71, 103]
external var var552 : (UInt64*Range<Int8>*Float32*Range<UInt16>) = (UInt64(114), (Int8(UInt64(207))..Int8(-100):((-125)|1)), Float32(UInt8(87)), (UInt16(118)..=UInt16(59):27|1))
external var var567 : List<List<Result<Unit>>> = [[Result<Unit>.Err(Exception()), Result<Unit>.Err(Exception()), Result<Unit>.Err(Exception()), Result<Unit>.Ok(var39), Result<Unit>.Ok(var39)], [Result<Unit>.Err(Exception()), Result<Unit>.Err(Exception()), Result<Unit>.Err(Exception()), Result<Unit>.Ok(var39), Result<Unit>.Ok(var39)], [Result<Unit>.Err(Exception()), Result<Unit>.Ok(var39), Result<Unit>.Ok(var39), Result<Unit>.Err(Exception()), Result<Unit>.Err(Exception())], [Result<Unit>.Ok(var39), Result<Unit>.Err(Exception()), Result<Unit>.Ok(var39), Result<Unit>.Err(Exception()), Result<Unit>.Ok(var39)], [Result<Unit>.Err(Exception()), Result<Unit>.Err(Exception()), Result<Unit>.Err(Exception()), Result<Unit>.Ok(var39), Result<Unit>.Ok(var39)]]
external let var620 : UInt16 = UInt16(70)
internal let var641 : List<Int32> = [Int32(122), Int32(58), Int32(-5), Int32(-11), Int32(UInt16(Float32(Int8(-49))))]
func main(): Int64 {
    var loopTimeVar22 : Range<UInt64> = (UInt64(Int8(61))..UInt64(229):(57|1));
    for (i in loopTimeVar22) if (var14.var17) {
        ()
    };
    try { // block id: 37
        var39;
        (UInt8(204)..=UInt8(60):(-20)|1)
    } catch (_) { // block id: 42
        ();
        (UInt8(175)..=var47:(var51|1))
    };
    var var57 : Interface9 = Class8<String, Range<Int8>, Range<Int8>>();
    var57.func60(namedParam61 : UInt8(102), namedParam62 : var39, namedParam63 : ((-80)..=(-66):(-107)|1))
    // CRC Check All Variables
    var crccheck = CrcCheck(5000, 32)
    crccheck.updateBuffer(UInt64(var47), 64)
    crccheck.updateBuffer(UInt64(var51), 64)
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
external open class Class8<T0, T1, T2> <: Interface9 & Interface10 where T0 <: String, T1 <: Range<Int8>, T2 <: Range<Int8> {
    public init() { // block id: 12

    }
;
    let var17 : Bool = (53 is Bool)
}

external interface Interface9 {
    func func245(namedParam246 ! : UInt8, namedParam247 ! : Range<UInt32>) : Result<Unit> { // block id: 248
        var39;
        let var320 : Int64 = Int64(Int32(-14));
        match (match (var75) {
                case defaultValue => 
                    ();
                    Result<Unit>.Err(Exception())
                
                case caseVar262 => 
                    var265
                
                case caseVar269 => 
                    true;
                    var273;
                    Result<Unit>.Ok(var39)
                
                case _ => 
                    var265
                
            }) {
            case _ => 
                var292
            
            case caseVar302 => 
                [var265, caseVar302, var265, caseVar302, Result<Unit>.Ok(var39)]
            
            case caseVar312 => 
                var var316 : Int16 = Int16(100);
                (var316..=var316:(var320|1));
                [var265, caseVar312, var265, caseVar312, Result<Unit>.Err(Exception())]
            
            case _ => 
                ();
                var39;
                var292
            
        }[4]
    }
;
    func func473(param474 : Bool) : Unit { // block id: 475

    }
;
    func func503(param504 : Range<UInt16>) : Interface9 { // block id: 505
        var509[3];
        this
    }
;
    func func526(param527 : UInt16) : Float32 { // block id: 528
        var loopTimeVar546 : Int64 = 0;
        while (try { // block id: 531
            false
        } catch (e: Exception) { // block id: 533
            Int32(-76);
            false
        } && loopTimeVar546 < 100 ) {
            loopTimeVar546++;
            try { // block id: 538
                ";]7R%6^jo2"
            } finally { // block id: 540
                let var542 : String = "H H<dqCe_L";
                var542
            };
            ()
        };
        try { // block id: 550
            var552;
            ();
            [Float32(-128.0), Float32(16.0), Float32(-63.0), Float32(-89.0), Float32(119.0)]
        } finally { // block id: 565
            var567;
            var var607 : List<Float32> = [Float32(-54.0), Float32(33.0), Float32(-117.0), Float32(-24.0), Float32(66.0)];
            var607
        }[3]
    }
;
    func func113() : Float32 { // block id: 114
        let var221 : Bool = ("dl_@x[J;;f" is UInt16);
        func func190<T0, T1>(namedParam191 ! : Float32, optionalParam192 ! : Range<Int8> = (Int8(-98)..=Int8(-41):(-123)|1), namedParam194 ! : UInt64, optionalParam195 ! : Range<UInt8> = (UInt8(Int64(Float32(122)))..=UInt8(UInt16(UInt64(Int32(-7)))):(51|1))) : Result<Unit> { // block id: 206
            var var214 : Aggregate210<UInt32, Int32, Option<List<Int32>>> = Aggregate210<UInt32, Int32, Option<List<Int32>>>();
            var var227 : (Bool*Bool*Bool) = (((Int16(69)..Int16(-34):(-31)|1) is Interface10), (Enum72.defaultValue is Int16), false);
            let var336 : UInt8 = UInt8(Int64(Int16(Int16(UInt32(43)))));
            if (if ((var214.var217)) { var221 } else { var227[2] } ) { // block id: 235
                ();
                var loopTimeVar241 : Int64 = 0;
                do {
                    loopTimeVar241++;

                } while (var221 && loopTimeVar241 < 100 ) ;
                var var346 : Int64 = (-8);
                var110.func245(namedParam246 : var336, namedParam247 : (var171..=var171:(var346|1)))
            } else { // block id: 348
                false;
                try { // block id: 351
                    Result<Unit>.Ok(var39)
                } finally { // block id: 353
                    var265
                }
            }
        }
;
        let var378 : UInt64 = UInt64(162);
        let var413 : List<List<Result<Unit>>> = [[Result<Unit>.Ok(var39), Result<Unit>.Ok(var39), Result<Unit>.Err(Exception()), Result<Unit>.Err(Exception()), Result<Unit>.Err(Exception())], [Result<Unit>.Err(Exception()), Result<Unit>.Err(Exception()), Result<Unit>.Ok(var39), Result<Unit>.Ok(var39), Result<Unit>.Ok(var39)], [Result<Unit>.Err(Exception()), Result<Unit>.Ok(var39), Result<Unit>.Ok(var39), Result<Unit>.Ok(var39), Result<Unit>.Err(Exception())], [Result<Unit>.Err(Exception()), Result<Unit>.Err(Exception()), Result<Unit>.Err(Exception()), Result<Unit>.Ok(var39), Result<Unit>.Ok(var39)], [Result<Unit>.Ok(var39), Result<Unit>.Err(Exception()), Result<Unit>.Ok(var39), Result<Unit>.Err(Exception()), Result<Unit>.Err(Exception())]];
        func func116<T0, T1>() : Unit { // block id: 117
            let var128 : Bool = false;
            var var132 : Result<Unit> = Result<Unit>.Ok(var39);
            let var155 : Range<UInt64> = (UInt64(204)..=UInt64(150):(-15)|1);
            (if (true) { if (var128) { // block id: 130
                var132;
                Result<Unit>.Err(Exception())
            } else if (var128) { // block id: 136
                var39;
                ();
                var132
            } else { // block id: 140
                var39;
                var39;
                Result<Unit>.Ok(var39)
            } } else { (if (true) { Result<Unit>.Err(Exception()) } else { Result<Unit>.Err(Exception()) } ) }  ?? match (Result<Unit>.Ok(var39)) {
                case _ => 
                    var155;
                    var39;
                    var39
                
                case _ => 
                    (-30.0);
                    UInt16(245);
                    var39
                
                case _ : Char => 
                    (UInt32(8)..var171:(31|1));
                    ()
                
                case _ => 
                    false;
                    ();
                    var39
                
                case _ => 
                    var var184 : UInt16 = UInt16(UInt64(243));
                    var184;
                    var39
                
            });
            var var366 : Option<Float32> = Option<Float32>.None;
            var loopTimeVar400 : Range<UInt64> = (UInt64(UInt16(UInt64(Int32(-58))))..=UInt64(134):((-118)|1));
            (func190<Int8, Option<List<Int32>>>(namedParam191 : (var366 ?? var361), namedParam194 : match (var371) {
                case _ : Int16 => 
                    var39;
                    var378
                
                case 82.0 => 
                    91;
                    UInt64(87)
                
                case _ => 
                    Option<Float32>.None;
                    let var389 : UInt64 = UInt64(52);
                    var389
                
            }) ?? for (i in loopTimeVar400) if ((UInt8(79) is Bool)) {
                (var171..UInt32(211):(77|1));
                Int32(111)
            });
            var loopTimeVar467 : Int64 = 0;
            (var413[1][4] ?? while (try { // block id: 456
                ((-83)..=(-100):106|1);
                var39;
                var221
            } catch (_) { // block id: 460
                Result<Unit>.Ok(var39);
                false
            } && loopTimeVar467 < 100 ) {
                loopTimeVar467++;
                ();
                ()
            })
        }
;
        func116<UInt8, UInt8>();
        let var477 : Bool = ((UInt64(234)..=UInt64(16):101|1) is UInt32);
        try { // block id: 469
            this.func473(var477);
            throw Exception();
            ()
        } finally { // block id: 482
            var var485 : Option<Float32> = (29.0 as Float32);
            match (var485) {
                case caseVar490 => 
                    ()
                
                case _ => 
                    var39;
                    Result<Unit>.Ok(var39);
                    ()
                
            };
            var39;
            var39
        };
        var var614 : UInt16 = UInt16(Int64(UInt16(UInt64(32))));
        func503([(UInt16(133)..UInt16(64):(-110)|1), (UInt16(5)..=UInt16(120):109|1), (UInt16(13)..=UInt16(253):(-67)|1), (UInt16(241)..=UInt16(87):(-66)|1), (UInt16(116)..=UInt16(115):(-60)|1)][1]).func526([var614, var620, var614, var614, var620][2])
    }
;
    func func60(namedParam61 ! : UInt8, namedParam62 ! : Unit, namedParam63 ! : Range<Int64>) : Int64 { // block id: 64
        try { // block id: 66
            if (true) { () } else { var39 } ;
            match (var75) {
                case _ => 
                    namedParam62;
                    var81
                
            };
            var var94 : Range<UInt16> = (UInt16(79)..=UInt16(93):(-113)|1);
            (UInt64(29), (Int8(-115)..=Int8(-101):(-78)|1), Float32(87.0), var94)[2]
        } catch (e: Exception) { // block id: 97
            [(), (), var39, (), var39][1];
            (UInt64(71)..=UInt64(165):(-47)|1);
            var110.func113()
        } finally { // block id: 626
            if (false) { var371 } else { var361 } 
        };
        var39;
        Int64((Option<List<Int32>>.Some(var641) ?? var641)[3])
    }

}

external interface Interface10 <: Interface9 {

}

external enum Enum72 {
    defaultValue
}

external record Aggregate210<T0, T1, T2> {
    public init() { // block id: 212

    }
;
    public var var217 : Bool = (UInt32(133) is Range<Int64>)
}




/*
/home/jenkins/workspace/MapleLang_Tools/lang_fuzz_llvmgc/test/test.cj:339:9: [33mwarning[0m: unhandled items after throw expr
  339 |         } finally { // block id: 482
      |         [32m^[0m
1 warning generated
return code: 139
*/
