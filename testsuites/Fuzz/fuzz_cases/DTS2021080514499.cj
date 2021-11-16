// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

// random seed:1627638153975

// All global variable need to be defined before use!
external let var38 : Bool = (true is Int8)
external var var57 : Unit = ()
external let var79 : (Int64*Bool*Char) = (25, true, '5')
external let var210 : UInt32 = UInt32(200)
external let var239 : Int8 = Int8(124)
external let var257 : UInt16 = UInt16(196)
external var var283 : Aggregate279 = Aggregate279((-28), Option<Unit>.Some(var57))
external let var293 : (Bool*UInt8*Float64) = ((true is UInt16), UInt8(118), 48.0)
external let var332 : Aggregate279 = Aggregate279()
external let var424 : Option<UInt16> = Option<UInt16>.Some(var257)
external let var450 : Interface17 = Class16()
external let var510 : Interface17 = Class16()
external let var514 : Float64 = (-118.0)
external let var522 : Class16 = Class16()
external let var562 : Int32 = Int32(-111)
external let var589 : Int8 = Int8(34)
external var var625 : Int16 = Int16(98)
external var var657 : UInt8 = UInt8(236)
external var var688 : (UInt16*Float32*Aggregate279*(Int64*Bool*Char)*Int16) = (UInt16(198), Float32(-91.0), Aggregate279(113, Option<Unit>.None), ((-122), true, '1'), Int16(-44))
external var var703 : Unit = ()
internal var var706 : UInt32 = UInt32(240)
external var var737 : Class16 = Class16()
external let var802 : Option<Bool> = ((Option<Bool>.Some(var38) as Bool) as Bool)
external let var823 : Option<Bool> = (Option<Bool>.Some(var38) as Bool)
external var var828 : Option<Option<Bool>> = Option<Option<Bool>>.None
external var var862 : Int32 = Int32(104)
external let var903 : Option<Bool> = (Option<Bool>.Some(var38) as Bool)
external let var919 : Int64 = (-31)
external let var942 : (UInt64*Bool*Int8) = (UInt64(66), (((true is Char) is Option<(UInt16*Float32*Aggregate279*(Int64*Bool*Char)*Int16)>) is Bool), Int8(66))
external var var1004 : Char = 'e'
external let var1029 : (Unit*Int8) = ((), Int8(108))
external let var1070 : Float32 = Float32(-68.0)
internal let var1128 : UInt16 = UInt16(198)
external var var1164 : Unit = ()
external let var1219 : Option<Unit> = Option<Unit>.Some(var57)
external let var1230 : Option<Option<Unit>> = (Option<Option<Unit>>.Some(var1219) as Option<Unit>)
external let var1268 : UInt64 = UInt64(65)
external let var1351 : Unit = ()
external var var1419 : Int32 = Int32(114)
external let var1429 : Option<Int64> = Option<Int64>.None
external var var1440 : Unit = ()
func main(): Int64 {
    var var10 : (Unit*Int8) = ((), Int8(109));
    var10[0];
    let var1387 : Option<Class16> = (((Option<Class16>.None as Class16) as Class16) as Class16);
    func func21(param22 : Float64, namedParam23 ! : Float32, optionalParam24 ! : UInt32 = UInt32(40), namedParam26 ! : Int8) : Class16 { // block id: 27
        let var1278 : Option<UInt64> = (Option<UInt64>.Some(var1268) as UInt64);
        func29(namedParam30 : (match (()) {
            case caseVar1274 => 
                var703;
                var1278
            
            case _ => 
                ();
                var1029;
                Option<UInt64>.None
            
        } ?? if (true) { // block id: 1289
            ();
            UInt64(121)
        } else if (true) { // block id: 1293
            Class16();
            UInt64(232)
        } else { // block id: 1296
            var424;
            Option<Option<Bool>>.None;
            UInt64(119)
        }), namedParam31 : if (match (param22) {
            case -28.0 | 3.0 | 121.0 => 
                ();
                ();
                false
            
            case caseVar1312@ caseVar1311 => 
                (UInt64(228), false, var589);
                true
            
            case caseVar1321 : UInt16 => 
                Int8(-21);
                var703;
                var38
            
            case _ => 
                ();
                false
            
            case _ => 
                (true, var657, 114.0);
                var562;
                var38
            
        }) { (Option<Char>.None ?? 'J') } else { if (var38) { // block id: 1349
            var1351;
            ();
            'd'
        } else if (true) { // block id: 1356
            var var1358 : ((Bool*UInt8*Float64)*Float64*Aggregate279) = ((((false is (Bool*UInt8*Float64)) is Int32), UInt8(60), 42.0), (-45.0), Aggregate279());
            var1358;
            var1004
        } else { // block id: 1369
            var1164;
            var1004
        } } , namedParam34 : var1268);
        var514;
        (if (false) { // block id: 1382
            Option<Class16>.None
        } else if (var38) { // block id: 1385
            var1387
        } else { // block id: 1392
            ();
            var625;
            Option<Class16>.Some(var522)
        } ?? match (if (true) { param22 } else { param22 } ) {
            case caseVar1405@ caseVar1404 : Int64 => 
                var522
            
            case _ => 
                44.0;
                Class16()
            
        })
    }
;
    func21((-30.0), namedParam23 : Float32(115.0), namedParam26 : Int8(126)).func145(110.0, optionalParam147 : var589, namedParam149 : var1419);
    ((var1429 as Int64) ?? if (var38) { // block id: 1433
        Aggregate279();
        61
    } else if (var38) { // block id: 1437
        var1268;
        var1440;
        (-45)
    } else { // block id: 1443
        ();
        var919;
        var919
    })
    // CRC Check All Variables
    var crccheck = CrcCheck(5000, 32)
    crccheck.updateBuffer(UInt64(var589), 64)
    crccheck.updateBuffer(UInt64(var1128), 64)
    crccheck.updateBuffer(UInt64(var1268), 64)
    crccheck.updateBuffer(UInt64(var1419), 64)
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
external open class Class16 <: Interface17 {
    public init() { // block id: 19

    }
;
    func func145(param146 : Float64, optionalParam147 ! : Int8 = Int8(10), namedParam149 ! : Int32) : Unit { // block id: 150
        var loopTimeVar173 : Int64 = 0;
        if (var38) { do {
            loopTimeVar173++;
            Int32(-82);
            ()
        } while (match (Option<Unit>.None) {
            case _ => 
                UInt16(246);
                false
            
            case _ : Interface17 => 
                var38
            
            case _ => 
                namedParam149;
                true
            
        } && loopTimeVar173 < 100 )  } else { (Class16().func177(param146, namedParam179 : '2')) } 
    }
;
    var var244 : Int32 = Int32(-82);
    var var525 : Bool = (false is Interface17);
    public static let var784 : Option<Bool> = (((Option<Bool>.Some(var38) as Bool) as Bool) as Bool);
    var var839 : Option<Unit> = (Option<Unit>.Some(var57) as Unit)
}

external interface Interface17 {
    func func177(param178 : Float64, namedParam179 ! : Char) : Unit { // block id: 180
        var var187 : UInt32 = UInt32(72);
        var var190 : Float64 = 48.0;
        if (if ((var38 is Option<Unit>)) { // block id: 185
            var187;
            var190;
            var38
        } else { // block id: 193
            var57;
            var38
        }) { // block id: 196
            Int32(108);
            match (UInt32(50)) {
                case caseVar202 => 
                    (-96.0);
                    var57;
                    ()
                
                case $var210 | 187 | 52 | $var210 => 
                    var57;
                    var57;
                    ()
                
                case _ => 
                    var57
                
            };
            ()
        };
        let var228 : Bool = true;
        var loopTimeVar234 : Int64 = 0;
        while (((true is Int64) is Float32) && loopTimeVar234 < 100 ) {
            loopTimeVar234++;
            var loopTimeVar232 : Int64 = 0;
            do {
                loopTimeVar232++;

            } while (var228 && loopTimeVar232 < 100 ) 
        }
    }
;
    func func464(param465 : Int16, param466 : Int32) : Option<Int8> { // block id: 467
        if (var38) { match (if (true) { Option<UInt16>.Some(var257) } else { var424 } ) {
            case caseVar478 : (UInt16*Float32*Aggregate279*(Int64*Bool*Char)*Int16) => 
                Int8(11)
            
            case _ => 
                Int8(78)
            
            case _ => 
                Int8(-28)
            
        } } else { Int8(-25) } ;
        let var517 : Char = 'B';
        if (match (if (false) { Option<UInt16>.Some(var257) } else { var424 } ) {
            case _ => 
                true
            
            case caseVar501 => 
                false
            
            case _ => 
                var38
            
        }) { // block id: 507
            var510.func177(var514, namedParam179 : var517)
        } else if ((var522.var525 is UInt32)) { // block id: 528

        };
        match (Class16()) {
            case _ => 
                ();
                Option<Int8>.None
            
        }
    }
;
    func func453(param454 : UInt64, param455 : Int64, namedParam456 ! : UInt8, namedParam457 ! : Aggregate279) : Int16 { // block id: 458
        let var608 : (UInt16*Float32*Aggregate279*(Int64*Bool*Char)*Int16) = (UInt16(74), Float32(-84.0), Aggregate279((-1), (Option<Unit>.None as Unit)), (41, ((false is Float32) is (Int64*Bool*Char)), '3'), Int16(-78));
        if (match (var450.func464(Int16(122), Int32(77))) {
            case caseVar540@ caseVar539 : Int16 => 
                Int8(73);
                Aggregate279();
                var38
            
            case caseVar547@ _ : UInt8 => 
                true
            
            case _ : Option<Int8> => 
                true
            
            case _ => 
                ();
                false
            
            case _ => 
                var562;
                Option<Int8>.Some(var239);
                var38
            
        }) { // block id: 567
            match (namedParam456) {
                case _ : (Int64*Bool*Char) => 
                    ()
                
                case _ => 
                    Int16(-50);
                    ()
                
            };
            match ((param454, false, var239)) {
                case caseVar594@ caseVar593@ ($param454 | $param454,caseVar587,caseVar592@ -27 | $var589 | $var239 | 65) => 
                    ();
                    ();
                    var var599 : Int16 = Int16(-127);
                    var599
                
                case _ => 
                    Int16(16)
                
                case _ => 
                    var608;
                    ();
                    var625
                
            }
        } else { // block id: 627
            Int16(-18)
        }
    }
;
    func func131(param132 : UInt32, namedParam133 ! : Int16) : Unit { // block id: 134
        let var142 : Class16 = Class16();
        func func138() : UInt8 { // block id: 139
            var142.func145((-17.0), optionalParam147 : var239, namedParam149 : var142.var244);
            let var630 : UInt64 = UInt64(215);
            func247(if (var38) { (var450.func453(var630, 35, namedParam456 : UInt8(65), namedParam457 : Aggregate279())) } else { if (var38) { // block id: 637
                var57;
                var57;
                var625
            } else if (var38) { // block id: 642
                ();
                var625
            } else { // block id: 645
                var57;
                namedParam133;
                namedParam133
            } } , namedParam249 : var625);
            match (93.0) {
                case _ => 
                    var57;
                    var657
                
                case 18.0 => 
                    ();
                    ();
                    UInt8(149)
                
                case _ => 
                    var257;
                    var57;
                    var657
                
            }
        }
;
        if (match (func138()) {
            case caseVar672 : (Bool*UInt8*Float64) => 
                ();
                var38
            
            case _ => 
                var57;
                ();
                false
            
        }) { // block id: 681
            (Option<(UInt16*Float32*Aggregate279*(Int64*Bool*Char)*Int16)>.None ?? var688);
            var703
        }
    }
;
    func func795() : Bool { // block id: 796
        var688;
        match (((var802 as Bool) as Bool)) {
            case _ => 
                (-15.0);
                ();
                var57
            
        };
        ((var828 ?? if (false) { Option<Bool>.Some(var38) } else { var823 } ) ?? true)
    }

}

internal func func29(namedParam30 ! : UInt64, namedParam31 ! : Char, optionalParam32 ! : Float64 = (-122.0), namedParam34 ! : UInt64) : Unit { // block id: 35
    func func42(optionalParam43 ! : Bool = ((true is Int8) is UInt64)) : Int64 { // block id: 47
        func49();
        if (if (var38) { // block id: 1037
            var703;
            true
        } else { // block id: 1040
            var688;
            true
        }) { match (var1004) {
            case caseVar1047 : Float32 => 
                var57;
                Class16();
                var703
            
            case caseVar1055@ caseVar1054 : ((Bool*UInt8*Float64)*Float64*Aggregate279) => 
                ()
            
            case $namedParam31 | $namedParam31 | $namedParam31 | $namedParam31 => 
                ()
            
            case _ => 
                var1070;
                var562;
                var703
            
            case _ => 
                false;
                var257;
                ()
            
        } } else { match (if (true) { // block id: 1082
                ();
                var688
            } else if (var38) { // block id: 1086
                (UInt16(224), Float32(-74.0), var332, var79, var625)
            } else { // block id: 1093
                ();
                (var257, var1070, Aggregate279(84, Option<Unit>.Some(var57)), (var919, false, 'g'), Int16(91))
            }) {
            case _ => 
                var703;
                ()
            
        } } ;
        var var1167 : Bool = (true is ((Bool*UInt8*Float64)*Float64*Aggregate279));
        if (true) { match (UInt16(161)) {
            case _ => 
                ();
                var688;
                (-76)
            
            case _ => 
                var919
            
            case $var1128 | 245 => 
                ();
                var625;
                (-94)
            
            case _ => 
                var57;
                10
            
            case _ => 
                var919
            
        } } else { if ((var38 is Option<Bool>)) { // block id: 1145
            ();
            43
        } else if (match (Int32(-38)) {
            case -26 | -2 | $var562 | -51 => 
                false
            
            case 93 | 13 => 
                true
            
            case -83 | 6 | 25 | $var562 => 
                var1164;
                var1167
            
            case $var562 => 
                false
            
            case _ => 
                var703;
                optionalParam43
            
        }) { // block id: 1179
            var57;
            var919
        } else { // block id: 1182
            29
        } } 
    }
;
    if (var38) { func42(optionalParam43 : match (var942) {
        case _ => 
            false
        
    }) } else { if (true) { // block id: 1191
        var919;
        UInt64(139);
        25
    } else { // block id: 1195
        var703;
        let var1198 : ((Bool*UInt8*Float64)*Float64*Aggregate279) = ((false, UInt8(173), 121.0), 114.0, Aggregate279());
        var1198;
        var919
    } } ;
    var loopTimeVar1261 : Int64 = 0;
    ((match (Option<Unit>.Some(var57)) {
        case _ => 
            ();
            var1230
        
        case _ => 
            var1004;
            var903;
            Option<Option<Unit>>.None
        
    } ?? Option<Unit>.Some(var57)) ?? do {
        loopTimeVar1261++;
        var57
    } while (match (Option<Unit>.Some(var57)) {
        case caseVar1244 => 
            var57;
            var703;
            var38
        
        case caseVar1251@ _ => 
            true
        
        case _ => 
            ();
            var38
        
    } && loopTimeVar1261 < 100 ) )
}

external func func49() : Unit { // block id: 50
    (Option<Unit>.None ?? if (var38) { () } else { func64(namedParam65 : Class16(), namedParam66 : var1029, optionalParam67 : Class16()) } )
}


external func func64(namedParam65 ! : Interface17, namedParam66 ! : (Unit*Int8), optionalParam67 ! : Interface17 = Class16(), optionalParam69 ! : Float32 = Float32(-21.0)) : Unit { // block id: 71
    namedParam65;
    let var109 : Float64 = 42.0;
    var loopTimeVar1026 : Int64 = 0;
    if (if (false) { var79 } else { var79 } [1]) { match (if (false) { // block id: 89
            Option<Unit>.Some(var57)
        } else { // block id: 91
            var57;
            var var94 : Option<Unit> = Option<Unit>.None;
            var94
        }) {
        case _ : UInt32 => 
            var57
        
        case _ => 
            var57;
            ()
        
        case _ => 
            var57;
            var109;
            var57
        
    } } else { while (func114(var657, optionalParam118 : var38) && loopTimeVar1026 < 100 ) {
        loopTimeVar1026++;
        var var1015 : ((Bool*UInt8*Float64)*Float64*Aggregate279) = ((((true is Interface17) is Int64), UInt8(227), 107.0), 116.0, Aggregate279());
        var1015
    } } 
}

external func func114(param115 : UInt8, optionalParam116 ! : Int16 = Int16(-53), optionalParam118 ! : Bool = (false is UInt64)) : Bool { // block id: 121
    let var128 : Interface17 = Class16();
    if ((false is UInt64)) { // block id: 125
        var128.func131(var706, namedParam133 : Int16(72));
        var loopTimeVar713 : Int64 = 0;
        while (var38 && loopTimeVar713 < 100 ) {
            loopTimeVar713++;

        }
    } else if (if (false) { // block id: 716
        ();
        false
    } else if ((Option<Bool>.Some(var38) ?? false)) { // block id: 727
        var703;
        var706;
        optionalParam118
    } else { // block id: 731
        optionalParam118
    }) { // block id: 733

    };
    var var957 : Option<(UInt16*Float32*Aggregate279*(Int64*Bool*Char)*Int16)> = (Option<(UInt16*Float32*Aggregate279*(Int64*Bool*Char)*Int16)>.None as (UInt16*Float32*Aggregate279*(Int64*Bool*Char)*Int16));
    match {
        case var737.func740() => 
        (Option<(UInt64*Bool*Int8)>.Some(var942) ?? var942);
        (var38 is Option<Option<Bool>>)
        case _ => 
        match (var957) {
            case _ : Option<Unit> => 
                Class16();
                var862;
                var903
            
            case _ => 
                var823;
                Option<Bool>.None
            
            case caseVar973 => 
                var903
            
            case _ => 
                var703;
                Option<Bool>.Some(var38)
            
            case _ => 
                (-50.0);
                Option<Bool>.None
            
        };
        let var989 : Option<Bool> = Option<Bool>.None;
        if (var38) { // block id: 987
            var989;
            ();
            ((-45), true, 'a')
        } else if (var38) { // block id: 997
            var703;
            var450;
            (70, var38, var1004)
        } else { // block id: 1006
            UInt32(213);
            UInt16(219);
            var79
        };
        true
    }
}

external func func247(param248 : Int16, namedParam249 ! : Int16) : UInt16 { // block id: 250
    var var430 : Option<UInt16> = Option<UInt16>.None;
    (if (func261()) { var424 } else { (if (false) { Option<UInt16>.None } else { var430 } ) }  ?? match (var57) {
        case _ : (Int64*Bool*Char) => 
            var257
        
        case _ => 
            ();
            var57;
            UInt16(33)
        
    });
    let var444 : UInt16 = UInt16(206);
    var444
}


external func func261(optionalParam262 ! : Char = 'n') : Bool { // block id: 264
    var var272 : Option<Int8> = ((Option<Int8>.None as Int8) as Int8);
    (var272 ?? var283.var376[2]);
    118.0;
    var var388 : Option<Unit> = Option<Unit>.None;
    let var407 : UInt64 = UInt64(237);
    match ((match (var388) {
            case caseVar392 : Int16 => 
                var57;
                ();
                Option<Int8>.Some(var239)
            
            case caseVar399 => 
                var272
            
            case caseVar404 : (Bool*UInt8*Float64) => 
                var407;
                Option<Int8>.None
            
            case _ => 
                var272
            
        } as Int8)) {
        case caseVar415 => 
            var293;
            ();
            true
        
        case _ => 
            false
        
    }
}


external record Aggregate279 {
    public init() { // block id: 281

    }
;
    static let var350 : UInt8 = UInt8(87);
    static var var353 : Float64 = (-21.0);
    public init(param286 : Int64, param287 : Option<Unit>) { // block id: 288
        let var324 : Aggregate279 = Aggregate279();
        var var363 : Float32 = Float32(97.0);
        if (var293[0]) { match (if (true) { Option<UInt16>.None } else { Option<UInt16>.None } ) {
            case caseVar307 : (UInt64*Bool*Int8) => 
                Aggregate279()
            
            case _ : Int16 => 
                var57;
                Aggregate279()
            
            case _ : Char => 
                var324
            
            case _ => 
                ();
                ();
                var332
            
            case _ => 
                var332
            
        } } else { (if ((90, var38, 'C')[1]) { ((var38, var350, var353), (-71.0), Aggregate279())[2] } else { (UInt16(5), var363, Aggregate279(), ((-124), false, 'c'), Int16(100))[2] } ) } 
    }
;
    let var376 : (UInt64*Bool*Int8) = (UInt64(116), (false is Interface17), Int8(117))
}















extend Class16 {
    func func740(optionalParam741 ! : (UInt16*Float32*Aggregate279*(Int64*Bool*Char)*Int16) = (UInt16(113), Float32(16.0), Aggregate279(), ((-79), ((false is (Int64*Bool*Char)) is Int64), 'q'), Int16(-89))) : Bool { // block id: 753
        let var777 : (Unit*Int8) = ((), Int8(125));
        match (Option<Int8>.Some(var239)) {
            case caseVar762 : (Unit*Int8) => 
                caseVar762
            
            case caseVar768@ caseVar767 : UInt32 => 
                (var57, Int8(51))
            
            case _ : Option<Unit> => 
                var777
            
            case _ => 
                var784;
                var777
            
        };
        var var852 : Char = '8';
        var loopTimeVar867 : Int64 = 0;
        while (if ((var450.func795())) { var38 } else { match (var839) {
            case _ => 
                false
            
            case _ => 
                ((-110), true, var852);
                var38
            
        } }  && loopTimeVar867 < 100 ) {
            loopTimeVar867++;
            (Option<Int32>.Some(var862) ?? var244)
        };
        let var908 : Option<Option<Bool>> = ((Option<Option<Bool>>.Some(var903) as Option<Bool>) as Option<Bool>);
        if (if (if (true) { // block id: 872
            true
        } else if (false) { // block id: 875
            var852;
            ();
            var525
        } else { // block id: 879
            var688;
            var38
        }) { // block id: 882
            Class16();
            var525
        } else if ((var38 is Bool)) { // block id: 887
            false
        } else { // block id: 889
            var38
        }) { ((var908 ?? var903) ?? if (true) { // block id: 916
            (var919, true, var852);
            var525
        } else if (false) { // block id: 925
            var57;
            var57;
            true
        } else { // block id: 929
            ();
            ();
            var525
        }) } else { (var525 is Option<(UInt16*Float32*Aggregate279*(Int64*Bool*Char)*Int16)>) } 
    }

}

extend Class16 {

}


/*
/home/jenkins/workspace/MapleLang_Tools/lang_fuzz/test/test.cj:279:19: [31merror[0m: 'newVar-compiler' is non-static member, cannot be accessed by static variable
  279 |     public static let var784 : Option<Bool> = (((Option<Bool>.Some(var38) as Bool) as Bool) as Bool);
      |                   [32m^[0m
/home/jenkins/workspace/MapleLang_Tools/lang_fuzz/test/test.cj:279:19: [31merror[0m: 'newVar-compiler' is non-static member, cannot be accessed by static variable
  279 |     public static let var784 : Option<Bool> = (((Option<Bool>.Some(var38) as Bool) as Bool) as Bool);
      |                   [32m^[0m
/home/jenkins/workspace/MapleLang_Tools/lang_fuzz/test/test.cj:279:19: [31merror[0m: 'newVar-compiler' is non-static member, cannot be accessed by static variable
  279 |     public static let var784 : Option<Bool> = (((Option<Bool>.Some(var38) as Bool) as Bool) as Bool);
      |                   [32m^[0m
3 errors generated
return code: 1
*/
