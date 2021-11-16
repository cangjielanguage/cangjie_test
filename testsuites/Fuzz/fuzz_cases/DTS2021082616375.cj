// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

// random seed:1629705991853

// All global variable need to be defined before use!
external var var16 : Int8 = Int8(36)
internal let var30 : Unit = ()
external var var37 : UInt8 = UInt8(UInt16(25))
internal let var62 : Interface45 = Class44()
external let var78 : Result<Interface45> = Result<Interface45>.Err(Exception())
internal let var108 : (Int8*Int64*Unit) = (Int8(118), Int64(UInt8(17)), ())
internal var var147 : UInt64 = UInt64(UInt8(122))
external let var152 : UInt64 = UInt64(UInt32(Int8(Int16(90))))
external let var207 : Int64 = Int64(Int32(-98))
external var var233 : Unit = ()
external let var241 : String = ";^?zGU&oYz"
internal var var248 : Enum19 = Enum19.defaultValue
external var var437 : List<UInt64> = [UInt64(138), UInt64(21), UInt64(32), UInt64(56), UInt64(194)]
external var var471 : Aggregate467 = Aggregate467()
internal let var486 : Range<Int64> = (8..17:(Int64(Float64((-26)))|1))
external let var605 : Bool = (Float32(103.0) is Int8)
internal let var672 : Result<List<UInt64>> = Result<List<UInt64>>.Ok(var437)
external let var692 : UInt32 = UInt32(32)
internal let var833 : List<Bool> = [true, ((111..Int64(93.0):(79|1)) is (Float64*Unit*Range<UInt32>)), (Result<(Int8*Int64*Unit)>.Err(Exception()) is Enum271), (Enum222.enumValue846(Int8((-105)), (Class44(), "V4LUoaGW ?"), (UInt8(34), UInt64(151), (117.0, (), (UInt32(14)..=UInt32(226):(124|1)))), Int64(UInt8(115))) is Enum65), false]
internal var var950 : Result<String> = Result<String>.Ok(var241)
internal var var954 : Option<Result<String>> = Option<Result<String>>.Some(var950)
external var var971 : Bool = ([UInt64(63), UInt64(163), UInt64(133), UInt64(98), UInt64(176)] is Range<UInt16>)
internal var var981 : Bool = true
internal let var985 : Enum222 = Enum222.defaultValue
external var var1148 : Range<UInt32> = (UInt32(92)..UInt32(52):(Int64(Int32(UInt16(70)))|1))
external let var1428 : List<List<Class44>> = [[Class44(namedParam99 : Class44(), optionalParam100 : Enum65.enumValue1434(36.0, (UInt8(78), UInt64(199), (126.0, (), (UInt32(166)..UInt32(147):(-121)|1))))), Class44(namedParam1447 : UInt8(UInt32(55)), namedParam1448 : (UInt16(154)..UInt16(26):(19|1))), Class1393(), Class44(namedParam1447 : UInt8(UInt8(44)), namedParam1448 : (UInt16(25)..=UInt16(95):(-53)|1)), Class44()], [Class1393(), Class44(namedParam1447 : UInt8(Int8(120)), namedParam1448 : (UInt16(200)..=UInt16(56):(88|1))), Class1393(), Class44(namedParam99 : Class44(Result<Unit>.Err(Exception()))), Class44(namedParam1447 : UInt8(120), namedParam1448 : (UInt16(156)..=UInt16(119):25|1))], [Class1393(), Class44(), Class44(), Class44(namedParam1447 : UInt8(UInt32(179)), namedParam1448 : (UInt16(78)..=UInt16(194):118|1)), Class44(namedParam99 : Class44(namedParam99 : Class44(namedParam99 : Class44(namedParam99 : Class44(), optionalParam100 : Enum65.defaultValue))), optionalParam100 : Enum65.defaultValue)], [Class44(namedParam99 : Class44(namedParam1447 : UInt8(9), namedParam1448 : (UInt16(52)..UInt16(197):(100|1))), optionalParam100 : Enum65.defaultValue), Class1393(), Class1393(), Class1393(), Class44(namedParam1447 : UInt8(19), namedParam1448 : (UInt16(57)..=UInt16(17):((-89)|1)))], [Class44(namedParam99 : Class44(), optionalParam100 : Enum65.enumValue1434((-35.0), (UInt8(179), UInt64(109), (108.0, (), (UInt32(29)..=UInt32(172):((-79)|1)))))), Class44(), Class44(namedParam1447 : UInt8(157), namedParam1448 : (UInt16(173)..UInt16(166):((-40)|1))), Class44(), Class44(namedParam1447 : UInt8(UInt16(207)), namedParam1448 : (UInt16(197)..UInt16(207):((-16)|1)))]]
internal let var1548 : Class44 = Class1393()
internal let var1606 : Float32 = Float32(Int64(Float32(Int32(Int32(-103)))))
external var var1629 : List<(Float64*Int8*Bool*List<Float32>)> = [(Float64(UInt8(134)), Int8(UInt32(Int16(108))), true, [Float32(115.0), Float32(59.0), Float32(-32.0), Float32(10.0), Float32(-7.0)]), (59.0, Int8(103), (Float32((-74.0)) is (Float64*Unit*Range<UInt32>)), [Float32(Float32(33.0)), Float32(Int8(-11)), Float32(UInt32(220)), Float32(3.0), Float32(-95.0)]), (Float64(Int8(Int16(18))), Int8(UInt32(UInt8(19))), false, [Float32(UInt32(59)), Float32(Int32(-27)), Float32(Int8(-18)), Float32(Float32(-93.0)), Float32(Float32(-105.0))]), (17.0, Int8(-48), false, [Float32(-71.0), Float32(97.0), Float32(95.0), Float32(111.0), Float32(-51.0)]), (Float64(Int16(-108)), Int8(-122), false, [Float32(-94.0), Float32(16.0), Float32(72.0), Float32(94.0), Float32(120.0)])]
external var var1785 : Option<List<List<Class44>>> = (Enum271.defaultValue as List<List<Class44>>)
external var var1789 : Option<Option<List<List<Class44>>>> = Option<Option<List<List<Class44>>>>.Some(var1785)
external let var1834 : Aggregate1173 = Aggregate1173()
external var var1903 : Class44 = Class44()
internal var var1916 : Class44 = Class44(namedParam99 : Class44(namedParam1447 : UInt8(201), namedParam1448 : (UInt16(155)..UInt16(41):23|1)))
external let var1962 : Result<Bool> = Result<Bool>.Err(Exception())
external var var1980 : UInt64 = UInt64(Int8(45))
external let var1986 : Unit = ()
external var var2039 : Float64 = Float64(UInt32(95))
func main(): Int64 {
    func func7(optionalParam8 ! : String = "W8vIe!wPKr", namedParam10 ! : Float64) : Unit { // block id: 11
        match (if ((var16 is Char)) { match (Enum19.defaultValue) {
                case _ => 
                    ();
                    Int16(-91);
                    var var27 : Unit = ();
                    var27
                
            } } else { var30 } ) {
            case $var30 => 
                var37
            
            case _ => 
                var37
            
        };
        func49((Option<Class44>.Some(var1548) ?? Class44()), Int32(40), namedParam52 : (Result<Bool>.Err(Exception()) ?? var605)).var1950;
        var var1966 : Result<Bool> = Result<Bool>.Err(Exception());
        var var1973 : (Class44*String) = (Class1393(), "/tb97Qyqgl");
        try { // block id: 1954

        } catch (_) { // block id: 1955
            (Result<Result<Bool>>.Ok(var1962) ?? var1966);
            match (Enum222.enumValue846(Int8(44), var1973, (var37, var1980, ((-18.0), var1986, (UInt32(132)..=UInt32(80):105|1))), (-101))) {
                case enumValue846(-115, (caseVar1992,_), (_ : List<Class44>,114 | $var152,(caseVar1994,_,_ : List<Result<(Int8*Int64*Unit)>>)), _) => 
                    var1986
                
                case caseVar1999 : (Float64*Int8*Bool*List<Float32>) => 
                    ()
                
                case _ => 
                    var1986
                
            };
            var loopTimeVar2009 : Range<UInt64> = (UInt64(UInt8(Float32(UInt32(45))))..UInt64(24):(Int64(31.0)|1));
            for (i in loopTimeVar2009) if (true) {
                ()
            }
        } finally { // block id: 2018
            var30
        }
    }
;
    func7(optionalParam8 : if (true) { // block id: 2022
        "?;v[{i6aAx"
    } else { // block id: 2024
        var471;
        [var241, "gK4I)-p-?h", var241, var241, var241];
        "Je~p2o#8W2"
    }, namedParam10 : (Result<Float64>.Ok(var2039) ?? (-77.0)));
    var loopTimeVar2052 : Int64 = 0;
    if (false) { var1986 } else { do {
        loopTimeVar2052++;
        ()
    } while (var605 && loopTimeVar2052 < 100 )  } ;
    13
    // CRC Check All Variables
    var crccheck = CrcCheck(5000, 32)
    crccheck.updateBuffer(UInt64(loopTimeVar2052), 64)
    crccheck.updateBuffer(UInt64(var37), 64)
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
external enum Enum19 {
    defaultValue |
    enumValue1228(List<(Float64*Int8*Bool*List<Float32>)>, Range<UInt64>, Result<List<UInt64>>, List<(Float64*Int8*Bool*List<Float32>)>)
}
external open class Class44 <: Interface45 {
    public init() { // block id: 47

    }
;
    public var var70 : Enum65 = Enum65.defaultValue;
    public static let var238 : Class44 = Class44();
    public init(namedParam99 ! : Interface45, optionalParam100 ! : Enum65 = Enum65.defaultValue) { // block id: 102
        try { // block id: 106
            var108
        } finally { // block id: 114
            Result<Interface45>.Err(Exception());
            var var117 : Unit = ();
            var117;
            (Int8(-107), (-90), var117)
        }[2];
        namedParam99.func127(try { // block id: 186
            (67..(-54):13|1);
            ();
            105
        } catch (e: Exception) { // block id: 190
            49
        }, namedParam129 : try { // block id: 193
            ();
            (var16, (-38), ())
        } finally { // block id: 199
            ();
            let var202 : Char = 'w';
            var202;
            (var16, var207, ())
        });
        try { // block id: 212
            Class44()
        } finally { // block id: 214
            var loopTimeVar220 : Int64 = 0;
            while (true && loopTimeVar220 < 100 ) {
                loopTimeVar220++;
                "\\2e9<>VbcG"
            };
            match (Enum222.enumValue225((Int16(53)..Int16(-24):63|1))) {
                case _ => 
                    Int8(-79);
                    ();
                    var233
                
            };
            (var238, var241)[0]
        }
    }
;
    public static var var264 : Unit = ();
    public open func func355(namedParam356 ! : (Int8*Int64*Unit), namedParam357 ! : Float32, namedParam358 ! : String) : Enum19 { // block id: 359
        var264;
        var248
    }
;
    public static let var392 : String = "hr]&D/|s-V";
    private static var var414 : (UInt8*UInt64*(Float64*Unit*Range<UInt32>)) = (UInt8(204), UInt64(Int16(Int16(-71))), (Float64(Int16(Float32(-7.0))), (), (UInt32(152)..UInt32(208):48|1)));
    public static func func345(param346 : Unit) : Unit { // block id: 347
        let var441 : Enum65 = Enum65.defaultValue;
        func func350() : Bool { // block id: 351
            let var369 : Result<(Int8*Int64*Unit)> = Result<(Int8*Int64*Unit)>.Err(Exception());
            var var380 : Float32 = Float32(63);
            var238.func355(namedParam356 : (var369 ?? var108), namedParam357 : [Float32(34.0), Float32(119.0), Float32(23.0), Float32(-62.0), var380][2], namedParam358 : (Result<String>.Ok(var241) ?? ":Yat)`V##L"));
            let var404 : Bool = ((Int16(-19)..Int16(117):((-116)|1)) is Result<Interface45>);
            if (try { // block id: 397
                var264;
                var233;
                false
            } finally { // block id: 401
                var147;
                var404
            }) { try { // block id: 411
                var78;
                var414;
                UInt64(73)
            } catch (_) { // block id: 427
                var147
            } } else { var147 } ;
            var var457 : UInt64 = UInt64(UInt64(Int32(Float32(Int16(100)))));
            ((match (var441) {
                case _ => 
                    let var446 : Result<List<UInt64>> = Result<List<UInt64>>.Ok(var437);
                    var446
                
            } ?? try { // block id: 449
                [UInt64(147), UInt64(241), UInt64(4), UInt64(105), UInt64(8)]
            } finally { // block id: 451
                ();
                [var147, var147, var457, var457, UInt64(125)]
            }) is Range<Int16>)
        }
;
        if (func350()) { if (var471.var474) { // block id: 484
            var486;
            param346;
            ()
        } } else { (Result<(Int8*Int64*Unit)>.Err(Exception()) ?? var108)[2] } ;
        ()
    }
;
    let var584 : Bool = false;
    static let var961 : Result<String> = Result<String>.Err(Exception());
    public static var var1032 : List<Bool> = [false, false, true, true, true];
    public var var1039 : Unit = ();
    static var var1048 : Interface45 = Class44();
    private init(param900 : Range<Int32>) { // block id: 901
        let var907 : Result<String> = Result<String>.Err(Exception());
        var var923 : Float64 = (-46.0);
        if (match (try { // block id: 905
                var907
            } catch (e: Exception) { // block id: 909
                Enum65.defaultValue;
                var907
            }) {
            case _ => 
                Result<String>.Ok(var241);
                var605
            
            case caseVar920 => 
                var923;
                true
            
            case _ => 
                ();
                var605
            
            case _ => 
                ();
                false
            
        }) { // block id: 935
            (Result<Unit>.Err(Exception()) ?? ());
            (var954 ?? var907)
        } else { // block id: 957
            try { // block id: 959
                var961
            } finally { // block id: 963
                Result<String>.Err(Exception())
            }
        };
        var loopTimeVar990 : Int64 = 0;
        var var995 : List<Result<(Int8*Int64*Unit)>> = [Result<(Int8*Int64*Unit)>.Err(Exception()), Result<(Int8*Int64*Unit)>.Ok(var108), Result<(Int8*Int64*Unit)>.Ok(var108), Result<(Int8*Int64*Unit)>.Err(Exception()), Result<(Int8*Int64*Unit)>.Err(Exception())];
        if ([true, var605, var971, var971, var971][4]) { do {
            loopTimeVar990++;

        } while (try { // block id: 979
            var981
        } finally { // block id: 983
            var985;
            true
        } && loopTimeVar990 < 100 )  } else { match (var995[2]) {
            case _ => 
                Enum19.defaultValue;
                var233;
                var233
            
            case caseVar1011 => 
                ();
                var233
            
            case caseVar1017 : Range<UInt64> => 
                (Int16(-128)..Int16(46):(var207|1));
                var233
            
            case _ => 
                ()
            
        } } ;
        var var1092 : (Float64*Int8*Bool*List<Float32>) = ((-48.0), Int8(UInt64(156)), false, [Float32(-24.0), Float32(UInt16(90)), Float32(-27.0), Float32(Int8(-7)), Float32(UInt8(223))]);
        if (Class44.var1032[0]) { // block id: 1035
            var238.var1039;
            [",pA+{=S#^X", "\\[4@_fGL},", "|Rr+u&bp:I", "Jax,R_2oNl", "e6h<MPq2v1"][0];
            Class44.var1048
        } else if (try { // block id: 1052
            let var1055 : (Float64*Int8*Bool*List<Float32>) = (Float64(Int8((-100))), Int8(-17), ([UInt64(Int16(-107)), UInt64(61), UInt64(Int16(-37)), UInt64(UInt32(232)), UInt64(UInt16(89))] is List<Float32>), [Float32(UInt8(UInt64(194))), Float32(Int8(Int16(34))), Float32(UInt32(Float32(-24.0))), Float32(Int16(UInt64(86))), Float32(1.0)]);
            [var1055, (var923, Int8(43), var981, [Float32(-114.0), Float32(-15.0), Float32(87.0), Float32(111.0), Float32(-121.0)]), var1092, var1092, var1092];
            var264;
            true
        } finally { // block id: 1111
            Float32(77.0);
            ();
            false
        }) { // block id: 1115
            Class44.var264;
            var1048
        } else { // block id: 1120
            var loopTimeVar1127 : Int64 = 0;
            do {
                loopTimeVar1127++;
                var437;
                var207
            } while (var971 && loopTimeVar1127 < 100 ) ;
            var loopTimeVar1132 : Int64 = 0;
            while (var605 && loopTimeVar1132 < 100 ) {
                loopTimeVar1132++;

            };
            Class44()
        }
    }
;
    public init(param1142 : List<Result<(Int8*Int64*Unit)>>) { // block id: 1143
        if (match ((var1148 as Result<String>)) {
            case caseVar1157 : Result<List<UInt64>> => 
                true
            
            case caseVar1162 : Range<Int16> => 
                ();
                true
            
            case _ => 
                ();
                var264;
                true
            
        }) { Class44(Aggregate1173.var1178) } else { var1048 } 
    }
;
    protected init(optionalParam1204 ! : Int64 = (-3), optionalParam1206 ! : Range<Int32> = (Int32(40)..=Int32(79):(Int64(UInt32(Int32(-18)))|1)), namedParam1213 ! : Enum19) { // block id: 1214
        ();
        var1048
    }
;
    static let var1199 : List<Class44> = [Class44(namedParam99 : Class44(optionalParam1204 : Int64(Int32(-99)), optionalParam1206 : (Int32(-19)..=Int32(42):(112|1)), namedParam1213 : Enum19.defaultValue), optionalParam100 : Enum65.defaultValue), Class44(namedParam99 : Class44(namedParam1213 : Enum19.enumValue1228([(123.0, Int8(44), false, [Float32(100.0), Float32(-83.0), Float32(-24.0), Float32(3.0), Float32(65.0)]), (35.0, Int8(-105), true, [Float32(83.0), Float32(37.0), Float32(81.0), Float32(-108.0), Float32(-71.0)]), ((-45.0), Int8(-121), false, [Float32(89.0), Float32(66.0), Float32(-74.0), Float32(-64.0), Float32(71.0)]), ((-122.0), Int8(-52), false, [Float32(65.0), Float32(-54.0), Float32(-96.0), Float32(51.0), Float32(-125.0)]), (104.0, Int8(103), true, [Float32(-67.0), Float32(-45.0), Float32(-128.0), Float32(124.0), Float32(83.0)])], (UInt64(186)..UInt64(184):((-48)|1)), Result<List<UInt64>>.Ok(var437), [((-9.0), Int8(-87), true, [Float32(11.0), Float32(-109.0), Float32(18.0), Float32(6.0), Float32(91.0)]), (1.0, Int8(30), false, [Float32(110.0), Float32(40.0), Float32(-53.0), Float32(-21.0), Float32(107.0)]), (35.0, Int8(119), true, [Float32(-82.0), Float32(-24.0), Float32(-35.0), Float32(114.0), Float32(74.0)]), (78.0, Int8(18), true, [Float32(-42.0), Float32(-119.0), Float32(19.0), Float32(66.0), Float32(36.0)]), (49.0, Int8(-112), true, [Float32(68.0), Float32(33.0), Float32(-125.0), Float32(103.0), Float32(-99.0)])])), optionalParam100 : Enum65.defaultValue), Class44(), Class44(namedParam99 : Class44((Int32(9)..Int32(70):((-35)|1))), optionalParam100 : Enum65.defaultValue), Class44()];
    public init(namedParam1447 ! : UInt8, namedParam1448 ! : Range<UInt16>) { // block id: 1449
        this
    }
;
    public static let var1521 : UInt8 = UInt8(UInt8(151));
    public static let var1705 : List<Result<(Int8*Int64*Unit)>> = [Result<(Int8*Int64*Unit)>.Ok(var108), Result<(Int8*Int64*Unit)>.Ok(var108), Result<(Int8*Int64*Unit)>.Err(Exception()), Result<(Int8*Int64*Unit)>.Ok(var108), Result<(Int8*Int64*Unit)>.Err(Exception())];
    public init(param1505 : Result<Unit>) { // block id: 1506
        match (Result<Bool>.Ok(var605)) {
            case caseVar1511 => 
                ()
            
            case caseVar1516 : Int16 => 
                var233;
                (var1521..UInt8(176):(28|1));
                var264
            
            case caseVar1529 : Int32 => 
                param1505;
                var233
            
            case _ => 
                [true, false, false, true, false];
                var233;
                var233
            
            case _ => 
                var264;
                "C\"T7Cs'B/B";
                ()
            
        };
        try { // block id: 1545
            match (var1548) {
                case _ => 
                    var264
                
            };
            throw Exception()
        } catch (e: Exception) { // block id: 1554
            var var1562 : Option<Class44> = Option<Class44>.None;
            (var1562 ?? var1548);
            try { // block id: 1566
                var233;
                Result<Unit>.Err(Exception())
            } finally { // block id: 1569
                ();
                param1505
            }
        } finally { // block id: 1572
            if (var981) { // block id: 1575
                var264;
                ();
                ()
            } else if (false) { // block id: 1580
                Enum222.defaultValue;
                Int8(-111);
                ()
            };
            var loopTimeVar1590 : Int64 = 0;
            do {
                loopTimeVar1590++;
                97;
                ()
            } while (var981 && loopTimeVar1590 < 100 ) ;
            if (var605) { // block id: 1593
                ();
                Result<Unit>.Err(Exception())
            } else if (true) { // block id: 1597
                (-33.0);
                ();
                param1505
            } else { // block id: 1601
                [Float32(104.0), Float32(96.0), var1606, Float32(-109.0), var1606];
                ();
                param1505
            }
        };
        let var1620 : List<Bool> = [false, false, false, true, false];
        if (try { // block id: 1618
            var1620;
            Class1393();
            var971
        } catch (_) { // block id: 1624
            var471;
            var605
        } finally { // block id: 1627
            var1629;
            false
        }) { try { // block id: 1686
            (Int8(56)..=var16:((-53)|1));
            var233;
            Class44(namedParam1447 : var1521, namedParam1448 : (UInt16(63)..UInt16(170):(-22)|1))
        } finally { // block id: 1695
            Class1393();
            var1048
        } } else { (if (true) { var78 } else { var78 }  ?? Class44(var1705)) } 
    }
;
    protected func func1402(optionalParam1403 ! : (Bool*Range<Int64>) = (false, ((-126)..(-19):(-47)|1)), namedParam1407 ! : List<UInt64>) : List<Class44> { // block id: 1408
        UInt32(if ((if (false) { true } else { false } )) { [Float32(-88.0), Float32(57.0), Float32(-109.0), Float32(52.0), Float32(87.0)][1] } else { Float32(Float32(-104.0)) } );
        ((var1789 ?? var1785) ?? try { // block id: 1793
            [[Class1393(), this, Class1393(), Class44(), var238], var1199, var1199, var1199, var1199]
        } finally { // block id: 1805
            var1039;
            var264;
            var1428
        })[1]
    }
;
    public init(param1389 : Char) { // block id: 1390
        var var1399 : Class1393 = Class1393();
        var1399.func1402(optionalParam1403 : (false, (var207..=97:((-34)|1))), namedParam1407 : [UInt64(30), UInt64(79), UInt64(11), UInt64(214), UInt64(65)])[4]
    }
;
    static var var1855 : Bool = true;
    public init(param701 : Float32) { // block id: 702
        let var880 : Enum222 = Enum222.enumValue225((Int16(68)..=Int16(-49):64|1));
        var var1345 : Result<Unit> = Result<Unit>.Ok(var233);
        var var1362 : Range<UInt16> = (UInt16(15)..=UInt16(230):(Int64(Float32(UInt16(UInt32(75))))|1));
        var var1819 : Char = '0';
        if (var62.func707(Int16(64), UInt16(246), namedParam710 : (UInt8(181)..UInt8(105):(-56)|1))) { // block id: 876
            let var884 : Result<Bool> = Result<Bool>.Ok(var605);
            try { // block id: 878
                var880;
                var884;
                var var887 : List<Class44> = [Class44(namedParam99 : Class44()), Class44(namedParam99 : Class44(namedParam99 : Class44(), optionalParam100 : Enum65.defaultValue)), Class44(), Class44(namedParam99 : Class44(namedParam99 : Class44((Int32(94)..Int32(-36):(94|1)))), optionalParam100 : Enum65.defaultValue), Class44(namedParam99 : Class44([Result<(Int8*Int64*Unit)>.Ok(var108), Result<(Int8*Int64*Unit)>.Ok(var108), Result<(Int8*Int64*Unit)>.Err(Exception()), Result<(Int8*Int64*Unit)>.Ok(var108), Result<(Int8*Int64*Unit)>.Err(Exception())]))];
                var887
            } catch (e: Exception) { // block id: 1195
                ();
                var1032;
                var1199
            }
        } else if (var971) { // block id: 1342
            (var1345 ?? var264);
            (var207..=(-72):((-122)|1));
            if (true) { var1199 } else { var1199 } 
        } else { // block id: 1357
            if (true) { // block id: 1360
                var1362;
                Enum271.enumValue1371([UInt64(67), UInt64(87), UInt64(191), UInt64(183), UInt64(83)]);
                [Class44(namedParam99 : var1048, optionalParam100 : Enum65.defaultValue), var238, var238, var238, this]
            } else if (false) { // block id: 1383
                [Class44(), var238, Class44(var1819), this, this]
            } else { // block id: 1823
                ();
                var1199
            }
        };
        var loopTimeVar1851 : Int64 = 0;
        var loopTimeVar1863 : Int64 = 0;
        if (((Result<Aggregate1173>.Err(Exception()) ?? Aggregate1173()) is Range<UInt8>)) { do {
            loopTimeVar1851++;
            var950;
            break
        } while (try { // block id: 1840
            var1199;
            [Float32(104.0), Float32(125.0), Float32(-50.0), Float32(84.0), Float32(-89.0)];
            var605
        } finally { // block id: 1844
            Aggregate467();
            false
        } && loopTimeVar1851 < 100 )  } else { do {
            loopTimeVar1863++;
            var264;
            var264
        } while (if (var1855) { var981 } else { var1855 }  && loopTimeVar1863 < 100 )  } ;
        var var1879 : Result<Bool> = Result<Bool>.Err(Exception());
        (try { // block id: 1866
            ();
            ();
            Option<Class44>.None
        } catch (e: Exception) { // block id: 1870
            Class1393();
            ();
            let var1874 : Option<Class44> = Option<Class44>.None;
            var1874
        } ?? if ((var1879 ?? false)) { // block id: 1882
            ();
            Class44(namedParam99 : Class44('N'))
        } else { // block id: 1887
            ();
            this
        })
    }
;
    public let var1950 : Int64 = Int64(UInt32(229))
}

external interface Interface45 {
    func func163(param164 : Range<Int8>, param165 : Float32, param166 : Range<UInt8>) : Unit { // block id: 167
        ()
    }
;
    func func127(param128 : Int64, namedParam129 ! : (Int8*Int64*Unit)) : Unit { // block id: 130
        "}rq\"?j h9A";
        ();
        let var173 : UInt8 = UInt8(139);
        var loopTimeVar177 : Range<UInt64> = (UInt64(87)..=UInt64(247):(Int64(Int32(UInt16(Int32(25))))|1));
        for (i in loopTimeVar177) if (([var147, UInt64(49), var152, UInt64(7), var152][2] is Char)) {
            func163((Int8(-56)..=Int8(109):(-11)|1), Float32(57.0), (var173..UInt8(105):(param128|1)))
        }
    }
;
    func func707(param708 : Int16, param709 : UInt16, namedParam710 ! : Range<UInt8>) : Bool { // block id: 711
        var var718 : List<(Float64*Int8*Bool*List<Float32>)> = [((-124.0), Int8(-109), (() is (Float64*Int8*Bool*List<Float32>)), [Float32(112.0), Float32(52.0), Float32(-67.0), Float32(43.0), Float32(74.0)]), (88.0, Int8(Float32(-101.0)), ('1' is (Bool*Range<Int64>)), [Float32(32.0), Float32(-68.0), Float32(11.0), Float32(31.0), Float32(-62.0)]), (Float64(Int64(8.0)), Int8(Int16(Int16(-78))), ((UInt8(204), UInt64(103), (77.0, (), (UInt32(159)..UInt32(51):22|1))) is Range<Int64>), [Float32(-35.0), Float32(83.0), Float32(-89.0), Float32(-45.0), Float32(102.0)]), (Float64((-93)), Int8(38), ([((-92.0), Int8(18), false, [Float32(-77.0), Float32(-52.0), Float32(-38.0), Float32(63.0), Float32(-114.0)]), (113.0, Int8(115), true, [Float32(-8.0), Float32(-7.0), Float32(57.0), Float32(-114.0), Float32(70.0)]), (94.0, Int8(87), true, [Float32(62.0), Float32(-111.0), Float32(-61.0), Float32(-33.0), Float32(29.0)]), ((-91.0), Int8(91), true, [Float32(-82.0), Float32(38.0), Float32(76.0), Float32(-22.0), Float32(85.0)]), (94.0, Int8(-93), false, [Float32(78.0), Float32(-113.0), Float32(101.0), Float32(-88.0), Float32(86.0)])] is Interface45), [Float32(-14.0), Float32(39.0), Float32(39.0), Float32(-69.0), Float32(63.0)]), (Float64(UInt32(213)), Int8(55), false, [Float32(-3.0), Float32(95.0), Float32(-119.0), Float32(61.0), Float32(-25.0)])];
        if (var718[0][2]) { true } else { match {
            case true => 
            var var806 : List<Bool> = [((UInt8(97), UInt64(203), ((-121.0), (), (UInt32(184)..=UInt32(247):((-109)|1)))) is UInt8), (Enum19.defaultValue is (Float64*Int8*Bool*List<Float32>)), false, true, (((-1)..=Int64(103):(Int64(Int8(-111))|1)) is Range<UInt64>)];
            var806
            case false => 
            var833
            case _ => 
            var233;
            [false, true, true, true, false]
        }[0] } 
    }

}

external func func49(param50 : Class44, param51 : Int32, namedParam52 ! : Bool, optionalParam53 ! : String = "qQD6*#Jwt^") : Class44 { // block id: 55
    let var83 : Unit = ();
    func func88<T0, T1, T2>(namedParam89 ! : Class44, namedParam90 ! : Enum19, namedParam91 ! : Int64) : Interface45 { // block id: 92
        Class44()
    }
;
    (match (param50.var70) {
        case defaultValue => 
            ();
            UInt8(138);
            var78
        
        case _ => 
            var83;
            ();
            var78
        
    } ?? func88<Aggregate467, Float64, Range<Int32>>(namedParam89 : (Class44(namedParam99 : var62), "Wk-lIy`wgN")[0], namedParam90 : var248, namedParam91 : if (false) { // block id: 252
        (UInt16(160)..UInt16(83):17|1);
        var207
    } else { // block id: 255
        var83;
        (-94)
    }));
    let var329 : (UInt8*UInt64*(Float64*Unit*Range<UInt32>)) = (UInt8(7), UInt64((-62.0)), (Float64(40), (), (UInt32(88)..UInt32(190):(-60)|1)));
    let var511 : (Bool*Range<Int64>) = (([UInt64(171), UInt64(110), UInt64(98), UInt64(15), UInt64(44)] is UInt16), ((-31)..94:(Int64(Float32(-94.0))|1)));
    let var614 : Bool = ((Int8(UInt8(Int16(47))), Int64(Int8(83)), ()) is Range<Int64>);
    let var656 : Range<Int16> = (Int16(-105)..Int16(-66):(-112)|1);
    func func259() : Class44 { // block id: 260
        Class44.var264;
        let var277 : Enum271 = Enum271.defaultValue;
        let var323 : (Float64*Unit*Range<UInt32>) = (118.0, (), (UInt32(215)..UInt32(244):69|1));
        func func267() : Int64 { // block id: 268
            func func309<T0, T1>(namedParam310 ! : List<UInt64>, namedParam311 ! : (Class44*String)) : Unit { // block id: 312
                if (namedParam52) { (UInt8(91), UInt64(45), var323) } else { var329 } [2][1];
                ();
                Class44.func345(var233)
            }
;
            if (match (match {
                    case true => 
                    var277
                    case _ => 
                    Class44();
                    Enum271.defaultValue
                }) {
                case _ : UInt8 => 
                    var78;
                    namedParam52
                
                case defaultValue => 
                    (74..84:126|1);
                    namedParam52
                
                case _ => 
                    Enum19.defaultValue;
                    true
                
                case caseVar299 => 
                    var83;
                    false
                
                case _ => 
                    Int8(75);
                    true
                
            }) { // block id: 307
                func309<Bool, Option<Result<String>>>(namedParam310 : [UInt64(91), UInt64(246), UInt64(224), UInt64(67), UInt64(6)], namedParam311 : (param50, "i)<(=r#*gC"));
                var83
            };
            var loopTimeVar571 : Range<UInt64> = (UInt64(Float32(88.0))..=UInt64(Int16(UInt32(UInt16(171)))):((-34)|1));
            for (i in loopTimeVar571) if (var511[0]) {
                let var528 : UInt8 = UInt8(Int32(63));
                try { // block id: 523
                    var83;
                    var329
                } catch (e: Exception) { // block id: 526
                    var528;
                    (param50, var241);
                    (var528, var152, var323)
                } finally { // block id: 538
                    var233;
                    (var528, var152, (9.0, (), (UInt32(154)..UInt32(143):(-75)|1)))
                };
                let var554 : Range<UInt32> = (UInt32(33)..UInt32(Int8(UInt32(208))):(30|1));
                let var568 : UInt32 = UInt32(58);
                if (namedParam52) { // block id: 549
                    ((-117.0), var83, var554)
                } else { // block id: 561
                    (67.0, var233, (UInt32(126)..=var568:(var207|1)))
                }
            };
            let var643 : Float64 = Float64(Int8(UInt32(250)));
            let var649 : Range<UInt32> = (UInt32(60)..UInt32(76):(-83)|1);
            match {
                case param50.var584 => 
                try { // block id: 588
                    var83;
                    var207
                } finally { // block id: 591
                    Int8(-89);
                    (Int16(-2)..=Int16(111):(-96)|1);
                    var207
                }
                case if (var511[0]) { (Result<Bool>.Err(Exception()) ?? namedParam52) } else { (if (var605) { true } else { var614 } ) }  => 
                match {
                    case false => 
                    ();
                    UInt16(140)
                    case _ => 
                    var233;
                    UInt16(140)
                };
                var loopTimeVar636 : Int64 = 0;
                do {
                    loopTimeVar636++;

                } while (false && loopTimeVar636 < 100 ) ;
                Int64(18)
                case _ => 
                (var643, var233, var649)[1];
                if (var614) { // block id: 654
                    var656;
                    var207
                } else if (false) { // block id: 660
                    var207
                } else { // block id: 662
                    var83;
                    ();
                    39
                }
            }
        }
;
        func267();
        [param50, match (var672) {
            case _ : Enum65 => 
                ();
                var692;
                param50
            
            case _ : Enum222 => 
                Class44(Float32(52.0))
            
            case caseVar1893 => 
                Enum19.defaultValue;
                var1548;
                param50
            
            case _ => 
                ();
                ();
                var1903
            
        }, if (var971) { param50 } else { Class44('g') } , if (false) { // block id: 1912
            ();
            ();
            var1916
        } else { // block id: 1921
            (var971, (7..=(-44):(31|1)));
            UInt32(172);
            Class44('I')
        }, if (true) { Class44('v') } else { Class44(Float32(9.0)) } ][4]
    }
;
    func259()
}


internal enum Enum65 {
    defaultValue |
    enumValue1434(Float64, (UInt8*UInt64*(Float64*Unit*Range<UInt32>)))
}
external enum Enum222 {
    defaultValue |
    enumValue225(Range<Int16>) |
    enumValue846(Int8, (Class44*String), (UInt8*UInt64*(Float64*Unit*Range<UInt32>)), Int64)
}
enum Enum271 {
    defaultValue |
    enumValue1371(List<UInt64>)
}



external record Aggregate467 {
    public init() { // block id: 469

    }
;
    public var var474 : Bool = ((UInt16(Float64(Int8(-48)))..UInt16(239):(Int64(Float32(Float32(-20.0)))|1)) is Enum65)
}




external record Aggregate1173 {
    public init() { // block id: 1175

    }
;
    static let var1178 : Range<Int32> = (Int32((-75.0))..Int32(115):((-127)|1))
}

internal open class Class1393 <: Class44 & Interface1394<List<Result<(Int8*Int64*Unit)>>, List<UInt64>, String> & Interface1395<Result<(Int8*Int64*Unit)>, UInt32, Range<Int8>> {
    public init() { // block id: 1397

    }

}

internal interface Interface1394<T0, T1, T2> <: Interface45 where T0 <: List<Result<(Int8*Int64*Unit)>>, T1 <: List<UInt64>, T2 <: String {

}

internal interface Interface1395<T0, T1, T2> <: Interface1394<List<Result<(Int8*Int64*Unit)>>, List<UInt64>, String> {

}







extend Class1393 {

}


/*
return code: 139
*/
