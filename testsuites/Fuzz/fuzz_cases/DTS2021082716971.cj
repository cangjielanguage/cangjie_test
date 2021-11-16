// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

// random seed:1629922193487

// All global variable need to be defined before use!
external let var31 : List<Unit> = [(), (), (), (), ()]
external var var37 : Range<UInt64> = (UInt64(16)..UInt64(144):(-124)|1)
external var var103 : Option<List<Unit>> = (UInt8(130) as List<Unit>)
external let var115 : Unit = ()
external let var148 : Range<UInt32> = (UInt32(67)..=UInt32(195):((-41)|1))
external let var164 : (Range<Int16>*UInt64) = ((Int16(-65)..Int16(Float32(-6.0)):(19|1)), UInt64(1))
external var var200 : Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String> = Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String>()
internal let var204 : Class85 = Class85()
external let var215 : UInt64 = UInt64(169)
external var var218 : UInt64 = UInt64(22)
external let var232 : Bool = (((Int16(Int32(-68))..Int16((-70.0)):(Int64(108)|1)), UInt64(53)) is UInt8)
external let var245 : Range<Int32> = (Int32(Int32(22))..=Int32(-17):(Int64(Float32(UInt32(213)))|1))
external let var328 : Result<Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String>> = Result<Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String>>.Ok(var200)
external var var346 : Interface9<UInt32, Unit, UInt32> = Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String>()
external var var354 : Option<Interface9<UInt32, Unit, UInt32>> = Option<Interface9<UInt32, Unit, UInt32>>.Some(var346)
internal var var455 : Int32 = Int32(116)
external var var501 : String = "Ji{eeHe@~["
internal var var534 : (UInt64*String*Result<String>) = (UInt64(199), "x@8'mS(CFk", Result<String>.Err(Exception()))
internal var var585 : Int8 = Int8(-115)
internal var var610 : (String*Int32) = ("{DsU=Fl=U$", Int32(35))
external let var638 : Char = '3'
internal var var659 : UInt16 = UInt16(Float64(UInt8(254)))
external var var712 : Float64 = 47.0
external var var744 : (Float64*Bool*Int32) = (Float64(UInt64(57)), false, Int32(17))
external var var756 : Result<Option<Interface9<UInt32, Unit, UInt32>>> = Result<Option<Interface9<UInt32, Unit, UInt32>>>.Ok(var354)
external let var762 : Interface9<UInt32, Unit, UInt32> = Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String>()
internal var var803 : Int64 = Int64(UInt16(UInt8(Int16(54.0))))
func main(): Int64 {
    func13().func425(namedParam426 : var744, namedParam427 : (Int16(-39)..Int16(-110):((-10)|1)), namedParam428 : var115, namedParam429 : var756);
    var762.func765((UInt16(152)..UInt16(218):89|1))
    // CRC Check All Variables
    var crccheck = CrcCheck(5000, 32)
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
external open class Class8<T0, T1, T2> <: Interface9<UInt32, Unit, UInt32> where T0 <: Option<(UInt64*String*Result<String>)>, T1 <: Range<UInt8>, T2 <: String {
    public init() { // block id: 11

    }
;
    public init(param332 : Bool, optionalParam333 ! : Char = 'h', optionalParam335 ! : Bool = ((Result<Result<Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String>>>.Err(Exception()) is Range<Int64>) is UInt16)) { // block id: 339
        ((Result<Option<Interface9<UInt32, Unit, UInt32>>>.Ok(var354) ?? Option<Interface9<UInt32, Unit, UInt32>>.Some(var346)) ?? (if (var232) { var354 } else { var354 }  ?? (Option<Interface9<UInt32, Unit, UInt32>>.Some(var346) ?? var346)));
        Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String>()
    }
;
    static var var374 : Result<Result<Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String>>> = Result<Result<Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String>>>.Err(Exception());
    private static var var382 : Unit = ();
    public init(namedParam295 ! : Range<Int8>, optionalParam296 ! : Range<UInt64> = (UInt64(UInt64(195))..=UInt64(UInt16(UInt64(108))):(117|1)), namedParam305 ! : UInt32, optionalParam306 ! : Unit = ()) { // block id: 308
        if (false) { // block id: 311
            if (var232) { (UInt64(108)..UInt64(203):(-120)|1) } else { optionalParam296 } ;
            var loopTimeVar320 : Int64 = 0;
            do {
                loopTimeVar320++;

            } while (false && loopTimeVar320 < 100 ) 
        };
        var var389 : Bool = true;
        let var392 : Char = 'I';
        match ((if (true) { var374 } else { var374 }  ?? try { // block id: 378
                var328
            } finally { // block id: 380
                var382;
                Result<Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String>>.Err(Exception())
            })) {
            case _ => 
                Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String>(var389, optionalParam333 : var392)
            
        }
    }
;
    protected var var445 : Int64 = 2;
    private var var698 : ((Float64*Bool*Int32)*UInt64) = (((-104.0), true, Int32(UInt32(90))), UInt64(UInt8(UInt8(171))));
    public open func func425(namedParam426 ! : (Float64*Bool*Int32), namedParam427 ! : Range<Int16>, namedParam428 ! : Unit, namedParam429 ! : Result<Option<Interface9<UInt32, Unit, UInt32>>>) : UInt16 { // block id: 430
        namedParam428;
        func func433<T0>(param434 : (Float64*Bool*Int32), param435 : Range<Int32>, param436 : String, namedParam437 ! : Char) : (Float64*Bool*Int32) { // block id: 438
            try { // block id: 440
                if (var232) { (-78) } else { var445 } ;
                var var449 : Bool = true;
                var var458 : (Float64*Bool*Int32) = (Float64(Int8(83)), (UInt16(UInt32(88)) is Float32), Int32(-89));
                if (var449) { (88.0, false, var455) } else { var458 } 
            } finally { // block id: 467
                let var475 : Option<Range<Int32>> = (Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String>() as Range<Int32>);
                (var475 ?? (Int32(28)..Int32(-62):100|1));
                let var483 : Range<UInt16> = (UInt16(80)..UInt16(150):(-62)|1);
                try { // block id: 480
                    var115;
                    var483;
                    ()
                } catch (_) { // block id: 486

                };
                (param434, var218)[0]
            }
        }
;
        func433<Result<Result<Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String>>>>(namedParam426, (Int32(121)..=Int32(-54):(-74)|1), (var346.func506() ?? var610[0]), namedParam437 : if (try { // block id: 617
            true
        } catch (e: Exception) { // block id: 619
            ();
            (var445..0:((-14)|1));
            var232
        } finally { // block id: 626
            (Int8(-35)..Int8(21):(var445|1));
            true
        }) { (Result<Char>.Ok(var638) ?? var638) } else { var638 } );
        var346.func647(namedParam648 : var200.var698, namedParam649 : match {
            case var232 => 
            var712
            case true => 
            namedParam428;
            var712
            case _ => 
            Result<String>.Err(Exception());
            (-9.0)
        }, namedParam650 : if (var232) { var245 } else { (Int32(-105)..=var455:((-25)|1)) } , namedParam651 : match (var354) {
            case caseVar732 => 
                Result<Char>.Ok(var638);
                namedParam428;
                Result<String>.Err(Exception())
            
            case _ => 
                ();
                let var741 : Result<String> = Result<String>.Err(Exception());
                var741
            
        })
    }

}

external interface Interface9<T0, T1, T2> {
    func func506() : Result<String> { // block id: 507
        Float64(match {
            case true => 
            var115;
            let var514 : Float64 = Float64(Int16(-37));
            var514
            case _ => 
            ();
            (Int32(97)..=Int32(-49):38|1);
            let var521 : Float64 = Float64(UInt16(UInt32((-9))));
            var521
        });
        var var542 : Option<(UInt64*String*Result<String>)> = Option<(UInt64*String*Result<String>)>.None;
        var var569 : UInt64 = UInt64(Float64(Int8(UInt16(UInt8(183)))));
        (try { // block id: 540
            var542
        } finally { // block id: 544
            Result<Result<Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String>>>.Err(Exception());
            ();
            var542
        } ?? match (()) {
            case $var115 => 
                ();
                Option<Interface9<UInt32, Unit, UInt32>>.Some(var346);
                (var218, var501, Result<String>.Ok(var501))
            
            case $var115 | $var115 | $var115 => 
                var var577 : Result<String> = Result<String>.Err(Exception());
                (var569, "K7)t{*^1\\!", var577)
            
            case caseVar581 => 
                (var585..=Int8(-106):(7|1));
                var var590 : (Range<Int16>*UInt64) = ((Int16(71)..Int16(58):17|1), UInt64(UInt32(UInt8(Float32(-74.0)))));
                var590;
                var534
            
            case _ => 
                true;
                (UInt64(143), ";EdyMjp|{A", Result<String>.Ok(var501))
            
        })[2]
    }
;
    func func647(namedParam648 ! : ((Float64*Bool*Int32)*UInt64), namedParam649 ! : Float64, namedParam650 ! : Range<Int32>, namedParam651 ! : Result<String>) : UInt16 { // block id: 652
        let var667 : Result<UInt16> = Result<UInt16>.Ok(var659);
        ([var667, Result<UInt16>.Ok(var659), Result<UInt16>.Err(Exception()), Result<UInt16>.Ok(var659), Result<UInt16>.Err(Exception())][1] ?? match (try { // block id: 678
                var659;
                Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String>(true, optionalParam333 : 'r', optionalParam335 : var232);
                namedParam651
            } catch (e: Exception) { // block id: 685
                var115;
                Result<String>.Ok(var501)
            } finally { // block id: 688
                var115;
                Result<String>.Err(Exception());
                namedParam651
            }) {
            case _ => 
                var659
            
        })
    }
;
    func func765(param766 : Range<UInt16>) : Int64 { // block id: 767
        match (Option<Range<Int32>>.None) {
            case _ : Range<Int16> => 
                ()
            
            case _ => 
                var115;
                ()
            
            case caseVar781 : UInt32 => 
                ()
            
            case _ => 
                [(), (), (), (), ()];
                [var115, (), var115, var115, ()];
                var var795 : Unit = ();
                var795
            
            case _ => 
                Int16(57);
                ();
                ()
            
        };
        var803
    }

}

external func func13() : Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String> { // block id: 14
    var var40 : Option<List<Unit>> = Option<List<Unit>>.Some(var31);
    var var51 : Unit = ();
    ((var37, var40)[1] ?? [var51, var51, var51, (), ()])[3];
    var var154 : Bool = ((Int32(-52)..Int32(68):5|1) is Float32);
    var var179 : Int16 = Int16(-81);
    var var183 : Int64 = 90;
    match (func62(namedParam63 : var148, namedParam64 : var154, namedParam65 : Float32(-78.0), namedParam66 : UInt8(16))) {
        case caseVar161 => 
            var164
        
        case _ => 
            var115;
            ((var179..var179:(var183|1)), UInt64(159))
        
    }[1];
    let var412 : Range<Int32> = (Int32(48)..Int32(104):(Int64(Int32(-40))|1));
    try { // block id: 188
        let var268 : UInt8 = UInt8(71);
        func190(namedParam191 : Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String>(), namedParam192 : (var268..var268:(16|1)))
    } catch (_) { // block id: 272
        let var276 : (Float64*Bool*Int32) = (Float64(Float32((-69.0))), true, Int32(UInt64(250)));
        var276[1];
        [(), (), (), (), ()][3];
        var var396 : UInt32 = UInt32(181);
        if (false) { // block id: 290
            var154;
            ();
            Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String>(namedParam295 : (Int8(-3)..Int8(-27):92|1), namedParam305 : var396, optionalParam306 : var115)
        } else if (true) { // block id: 400
            Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String>(namedParam295 : (Int8(-15)..=Int8(115):(var183|1)), optionalParam296 : var37, namedParam305 : var396);
            ();
            var200
        } else { // block id: 410
            var412;
            var var419 : Result<Option<Interface9<UInt32, Unit, UInt32>>> = Result<Option<Interface9<UInt32, Unit, UInt32>>>.Err(Exception());
            var419;
            var200
        }
    } finally { // block id: 422
        var200
    }
}


internal func func62(namedParam63 ! : Range<UInt32>, namedParam64 ! : Bool, namedParam65 ! : Float32, namedParam66 ! : UInt8) : Option<List<Unit>> { // block id: 67
    let var98 : Char = 'h';
    try { // block id: 69
        var31[4];
        if (false) { // block id: 75
            ()
        } else if (namedParam64) { // block id: 78
            ();
            var var81 : Unit = ();
            var81;
            ()
        };
        Class85.var90
    } catch (_) { // block id: 92
        match ('y') {
            case $var98 => 
                ();
                var103
            
            case $var98 | $var98 | $var98 | $var98 => 
                ();
                var115;
                Option<List<Unit>>.Some(var31)
            
            case $var98 => 
                var115;
                var103
            
            case _ => 
                var var127 : Option<List<Unit>> = Option<List<Unit>>.None;
                var127
            
        }
    } finally { // block id: 129
        ();
        match (Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String>()) {
            case caseVar135 : Bool => 
                Option<List<Unit>>.None
            
            case caseVar140 : UInt64 => 
                (-50);
                var103
            
            case _ => 
                var103
            
        }
    }
}

open class Class85 {
    public init() { // block id: 87

    }
;
    static let var90 : Option<List<Unit>> = Option<List<Unit>>.None;
    let var207 : Result<Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String>> = Result<Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String>>.Ok(var200)
}

internal func func190(namedParam191 ! : Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String>, namedParam192 ! : Range<UInt8>) : Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String> { // block id: 193
    (var204.var207 ?? if (try { // block id: 211
        ();
        var var221 : Int64 = Int64(UInt8(UInt16(3)));
        (var215..=var218:(var221|1));
        false
    } finally { // block id: 226
        true;
        UInt8(32);
        false
    }) { if (var232) { // block id: 243
        var245;
        var115;
        Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String>()
    } else { // block id: 255
        var200
    } } else { (Option<Class8<Option<(UInt64*String*Result<String>)>, Range<UInt8>, String>>.None ?? var200) } )
}











extend Class85 {

}


/*
return code: 139
*/
