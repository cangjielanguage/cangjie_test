// EXEC-1: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

// random seed:1629724141513

// All global variable need to be defined before use!
internal var var13 : Aggregate9 = Aggregate9(UInt32(Int8(111.0)))
internal let var88 : (Int32*Range<UInt8>) = (Int32(UInt64(106)), (UInt8(88)..UInt8(94):125|1))
internal let var219 : Unit = ()
internal let var274 : Option<(Int32*Range<UInt8>)> = Option<(Int32*Range<UInt8>)>.None
external let var277 : Option<Option<(Int32*Range<UInt8>)>> = (((Int32(-59)..Int32(26):(Int64(Int8(82))|1)), (Int8(37)..Int8(112):(-83)|1), false, Int64(UInt64(UInt16(125))), Float64(UInt64(UInt8(178)))) as Option<(Int32*Range<UInt8>)>)
external var var329 : Aggregate325 = Aggregate325()
external let var358 : List<Bool> = [false, ((Int8(-115), "c,AERS,hH5", (Class195(), (Int16(-76), Int32(109)))) is Range<UInt32>), (Int32(19) is List<Bool>), (Float32(7.0) is Unit), true]
internal var var393 : Int32 = Int32(Int64(Int16(Int32(-88))))
internal let var511 : Range<UInt8> = (UInt8(74)..=UInt8(UInt16(Int64((-35)))):(Int64(Int64(UInt32(77)))|1))
internal var var522 : (UInt16*(Int16*Int32)) = (UInt16(UInt32((-54.0))), (Int16(UInt32(157)), Int32(Int64(Int32(-114)))))
internal let var556 : UInt16 = UInt16(UInt8(Int16(UInt16(76))))
external let var567 : Result<UInt16> = Result<UInt16>.Err(Exception())
external var var603 : (Range<Int32>*Range<Int8>*Bool*Int64*Float64) = ((Int32(-84)..=Int32(27):((-94)|1)), (Int8(99)..Int8(65):(-72)|1), false, 56, 55.0)
external let var619 : Option<(Range<Int32>*Range<Int8>*Bool*Int64*Float64)> = (((Int32((-125.0)), (UInt8(37)..=UInt8(243):(5|1))) as (Range<Int32>*Range<Int8>*Bool*Int64*Float64)) as (Range<Int32>*Range<Int8>*Bool*Int64*Float64))
external let var631 : Option<(Range<Int32>*Range<Int8>*Bool*Int64*Float64)> = Option<(Range<Int32>*Range<Int8>*Bool*Int64*Float64)>.None
external let var696 : Int8 = Int8(Float32(UInt8(Int8(87))))
external let var707 : Bool = ((Option<Result<UInt16>>.Some(var567) as Result<UInt16>) is List<Aggregate9>)
internal var var810 : (UInt16*(Int16*Int32)) = (UInt16(109), (Int16(0), Int32(-86)))
external let var868 : Int16 = Int16(UInt32(167))
external let var885 : List<UInt32> = [UInt32(55), UInt32(223), UInt32(200), UInt32(179), UInt32(5)]
external var var918 : UInt64 = UInt64(UInt32((-124.0)))
external var var926 : Option<UInt64> = ((Int16(UInt16(122)), Int32(6)) as UInt64)
external var var945 : UInt8 = UInt8(165)
external let var955 : String = "1D$oPyoVmk"
internal let var975 : Enum648 = Enum648.enumValue977([Int16(119), Int16(-36), Int16(UInt64(237)), Int16(-114), Int16(UInt8(UInt16(197)))])
internal var var1048 : Option<Result<UInt16>> = Option<Result<UInt16>>.Some(var567)
external var var1141 : Option<(Range<Int32>*Range<Int8>*Bool*Int64*Float64)> = Option<(Range<Int32>*Range<Int8>*Bool*Int64*Float64)>.Some(var603)
external let var1169 : Result<UInt64> = Result<UInt64>.Err(Exception())
external var var1183 : Int64 = Int64(Int64(Float32((-91))))
func main(): Int64 {
    var loopTimeVar1203 : Int64 = 0;
    while (var13.var1195 && loopTimeVar1203 < 100 ) {
        loopTimeVar1203++;
        ();
        ()
    };
    ();
    try { // block id: 1206
        var1183
    } finally { // block id: 1208
        var918;
        (-115)
    }
    // CRC Check All Variables
    var crccheck = CrcCheck(5000, 32)
    crccheck.updateBuffer(UInt64(loopTimeVar1203), 64)
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
internal record Aggregate9 {
    public init() { // block id: 11

    }
;
    static var var37 : Unit = ();
    public static let var114 : Int32 = Int32(Float32(UInt64(UInt64((-32.0)))));
    public static let var157 : (Range<Int32>*Range<Int8>*Bool*Int64*Float64) = ((Int32(14)..Int32(-91):(Int64(UInt8(Int32(126)))|1)), (Int8(81)..=Int8(125):16|1), true, 20, (-34.0));
    static let var173 : (Int16*Int32) = (Int16(76), Int32((-42)));
    static var var734 : Interface196 = Class195();
    public static let var744 : Range<Int16> = (Int16(60)..Int16(-18):55|1);
    public init(param315 : Unit, optionalParam316 ! : Unit = (), namedParam318 ! : List<Unit>, optionalParam319 ! : UInt64 = UInt64(Int32((-32)))) { // block id: 323
        var var720 : List<UInt16> = [UInt16(UInt64(UInt64(254))), UInt16(UInt32(17)), UInt16(133), UInt16(Float32(83.0)), UInt16(Int8(91))];
        var329.func332(optionalParam333 : if (var707) { // block id: 711
            [var556, var556, UInt16(100), var556, UInt16(58)]
        } else { // block id: 718
            var720
        });
        var734.func737(namedParam738 : var744, namedParam739 : try { // block id: 747
            (var393, var511)
        } catch (_) { // block id: 751
            var88
        })
    }
;
    public init(param16 : UInt32, optionalParam17 ! : UInt8 = UInt8(0)) { // block id: 19
        let var95 : Bool = ((Int8(-15)..=Int8(62):(60|1)) is (Int32*Range<UInt8>));
        let var312 : Aggregate9 = Aggregate9((), optionalParam316 : (), namedParam318 : [(), (), (), (), ()], optionalParam319 : UInt64(63));
        func func22(param23 : UInt64, namedParam24 ! : UInt32, namedParam25 ! : Int64, namedParam26 ! : Char) : Bool { // block id: 27
            let var30 : Float32 = Float32(Int16(-64));
            match (var30) {
                case -48.0 =>
                    var37;
                    var37;
                    var var41 : Bool = (UInt8(UInt32(Int16(Int16(-12)))) is UInt64);
                    var41

                case _ =>
                    ();
                    ();
                    false

            };
            var var63 : List<UInt16> = [UInt16(25), UInt16(196), UInt16(175), UInt16(49), UInt16(210)];
            var63[2];
            let var764 : List<Bool> = [false, false, true, true, false];
            func func74(optionalParam75 ! : UInt32 = UInt32(219), optionalParam77 ! : Range<Int16> = (Int16(-4)..=Int16(-43):72|1)) : (Range<Int32>*Range<Int8>*Bool*Int64*Float64) { // block id: 79
                (if (var95) { Option<(Int32*Range<UInt8>)>.Some(var88) } else { Option<(Int32*Range<UInt8>)>.Some(var88) }  ?? try { // block id: 107
                    let var109 : Int64 = (-14);
                    var109;
                    var95;
                    (var114, (UInt8(125)..UInt8(160):7|1))
                } catch (e: Exception) { // block id: 121
                    var88
                } finally { // block id: 123
                    (Int32(-79), (UInt8(195)..UInt8(145):(namedParam25|1)))
                })[0];
                let var1111 : UInt16 = UInt16(1);
                func func189(namedParam190 ! : (Int32*Range<UInt8>)) : (Range<Int32>*Range<Int8>*Bool*Int64*Float64) { // block id: 191
                    if (if (Class195.var201) { // block id: 297
                        var37;
                        ();
                        var95
                    } else { // block id: 301
                        Float32(-50.0);
                        var95
                    }) { // block id: 304

                    };
                    var var780 : Bool = (Enum648.enumValue783 is List<Unit>);
                    var var1052 : Result<Option<(Range<Int32>*Range<Int8>*Bool*Int64*Float64)>> = Result<Option<(Range<Int32>*Range<Int8>*Bool*Int64*Float64)>>.Ok(var619);
                    var var1069 : Float64 = Float64(Int8(Int64(Float32(Int8(126)))));
                    if (if (var95) { // block id: 310
                        var312;
                        ();
                        var764
                    } else if (var707) { // block id: 772
                        Aggregate9();
                        var37;
                        [false, false, false, var780, var95]
                    } else { // block id: 785
                        var219;
                        var764
                    }[4]) { // block id: 789
                        if (true) { () } else { var37 } ;
                        var734.func797(namedParam798 : var1048, namedParam799 : var1052, namedParam800 : var1069)
                    } else { // block id: 1075
                        if (false) { // block id: 1078
                            (UInt8(44)..var945:((-17)|1))
                        } else { // block id: 1083
                            (UInt32(1)..=UInt32(92):((-55)|1));
                            var277;
                            (UInt8(198)..=UInt8(46):104|1)
                        }
                    };
                    ((match (Option<Result<UInt16>>.Some(var567)) {
                        case caseVar1097 : Char =>
                            var1052

                        case _ =>
                            ();
                            Result<Option<(Range<Int32>*Range<Int8>*Bool*Int64*Float64)>>.Err(Exception())

                        case _ =>
                            var1052

                    } ?? match (Result<UInt16>.Ok(var556)) {
                        case _ =>
                            Option<(Range<Int32>*Range<Int8>*Bool*Int64*Float64)>.None

                    }) ?? if (match (var567) {
                        case _ : Enum648 =>
                            ();
                            var707

                        case caseVar1126 =>
                            false

                        case _ =>
                            var329;
                            UInt8(167);
                            true

                    }) { (var1141 ?? var603) } else { var603 } )
                }
;
                try { // block id: 132
                    var var142 : Range<Int8> = (Int8(UInt8(UInt8(148)))..Int8(UInt8(Int16(50))):(Int64(UInt64(219))|1));
                    if (var95) { // block id: 135
                        ((var114..Int32(17):((-118)|1)), var142, var95, 29, (-43.0))
                    } else { // block id: 155
                        var157
                    }
                } finally { // block id: 169
                    var173[1];
                    [(), (), (), (), var37][2];
                    func189(namedParam190 : (var393, var511))
                }
            }
;
            func74()[2]
        }
;
        if (func22((var1169 ?? UInt64(48)), namedParam24 : try { // block id: 1173
            var37;
            param16
        } catch (e: Exception) { // block id: 1176
            ();
            UInt32(193)
        } finally { // block id: 1179
            var219;
            UInt32(117)
        }, namedParam25 : var1183, namedParam26 : '2')) { // block id: 1189

        };
        var312
    }
;
    public let var1195 : Bool = (Int8(83) is (UInt16*(Int16*Int32)))
}


internal open class Class195 <: Interface196 {
    public init() { // block id: 198

    }
;
    private let var255 : Bool = ((Int8(11.0), "\\`{d>)Hj$s", (Class195(), (Int16(47), Int32(-65)))) is Class195);
    public init(param206 : Interface196) { // block id: 207
        func209(namedParam210 : if ((this.var255)) { Option<(Int32*Range<UInt8>)>.Some(var88) } else { (var277 ?? var274) } )
    }
;
    static let var201 : Bool = ((Class195(Class195(Class195(Class195()))) is (Int16*Int32)) is Option<(Int32*Range<UInt8>)>)
}

interface Interface196 {
    static func func209(namedParam210 ! : Option<(Int32*Range<UInt8>)>) : Class195 { // block id: 211
        let var238 : (Int8*String*(Class195*(Int16*Int32))) = (Int8(86), "|Zg5TqD a ", (Class195(), (Int16(Int32(66)), Int32(Float32(-94.0)))));
        try { // block id: 217
            var219;
            var var226 : Class195 = Class195();
            var var229 : (Int16*Int32) = (Int16(-14), Int32(UInt64(18)));
            (Int8(-121), "V/<#!h]!:^", (var226, var229))
        } finally { // block id: 234
            ();
            true;
            var238
        }[2][0]
    }
;
    func func546(param547 : Aggregate9) : Float32 { // block id: 548
        let var570 : Option<Result<UInt16>> = Option<Result<UInt16>>.None;
        Float32(((var570 ?? Result<UInt16>.Err(Exception())) ?? match (Result<List<Bool>>.Ok(var358)) {
            case _ : Result<UInt16> =>
                ();
                var219;
                UInt16(161)

            case _ =>
                (UInt8(55)..UInt8(219):(-47)|1);
                UInt16(28)

        }))
    }
;
    func func737(namedParam738 ! : Range<Int16>, namedParam739 ! : (Int32*Range<UInt8>)) : Aggregate9 { // block id: 740
        ();
        Aggregate9()
    }
;
    func func875() : Enum648 { // block id: 876
        var var882 : Enum848 = Enum848.defaultValue;
        var var893 : Range<UInt64> = (UInt64(86)..UInt64(73):115|1);
        try { // block id: 880
            var882;
            var885
        } catch (e: Exception) { // block id: 887
            ();
            var885
        } finally { // block id: 890
            ();
            var893;
            var885
        }[0];
        var var903 : Bool = (UInt8(59) is Class195);
        let var908 : Result<Option<(Range<Int32>*Range<Int8>*Bool*Int64*Float64)>> = Result<Option<(Range<Int32>*Range<Int8>*Bool*Int64*Float64)>>.Err(Exception());
        if (try { // block id: 899
            var219;
            var219;
            var903
        } catch (_) { // block id: 906
            var908;
            ();
            true
        }) { (try { // block id: 923
            var219;
            var926
        } finally { // block id: 932
            var219;
            Option<UInt64>.Some(var918)
        } ?? var918) } else { UInt64(match ("o7_UR< dhs") {
            case caseVar941 : Enum648 =>
                var219;
                var945

            case caseVar949 =>
                var945

            case "cf78_RCFny" | "'7K /Fhre " | $var955 =>
                ();
                var219;
                var945

            case caseVar963 =>
                ();
                UInt8(146)

            case _ =>
                UInt8(170)

        }) } ;
        let var997 : Int64 = 39;
        let var1000 : Range<Int8> = (Int8((-62.0))..Int8(103):(Int64(Int16(Float32(UInt8(145))))|1));
        match {
            case (var277 is Range<Int16>) =>
            var975
            case true =>
            var var1012 : Float64 = (-32.0);
            if (var903) { ((Int32(-28)..var393:(var997|1)), var1000, true, var997, var1012) } else { var603 } ;
            try { // block id: 1016
                ();
                var358;
                Enum648.enumValue783
            } catch (e: Exception) { // block id: 1020
                var975
            }
            case _ =>
            try { // block id: 1024
                var219;
                Enum648.defaultValue
            } catch (_) { // block id: 1027
                Enum648.enumValue783
            }
        }
    }
;
    func func797(namedParam798 ! : Option<Result<UInt16>>, namedParam799 ! : Result<Option<(Range<Int32>*Range<Int8>*Bool*Int64*Float64)>>, namedParam800 ! : Float64) : Range<UInt8> { // block id: 801
        var var826 : List<Aggregate9> = [Aggregate9(), Aggregate9(), Aggregate9(), Aggregate9(), Aggregate9()];
        if (((Option<(UInt16*(Int16*Int32))>.None ?? var810) is Result<List<Bool>>)) { if ((var707 is Result<Option<(Range<Int32>*Range<Int8>*Bool*Int64*Float64)>>)) { // block id: 821
            var219;
            ()
        } else if ((var826 is Char)) { // block id: 833
            var219;
            ();
            ()
        } } else { (if ((Result<Bool>.Ok(var707) ?? var707)) { match (Enum848.defaultValue) {
            case _ =>
                var219;
                var219

        } } else { (if (false) { var219 } else { () } ) } ) } ;
        if (((var277 ?? var274) is Option<(Range<Int32>*Range<Int8>*Bool*Int64*Float64)>)) { // block id: 864
            if (var707) { var868 } else { Int16(-15) } ;
            this.func875()
        } else { // block id: 1029
            var loopTimeVar1034 : Range<UInt64> = (UInt64(Float64(UInt16(Int32(33))))..UInt64(194):(Int64(UInt16(Int32(70)))|1));
            for (i in loopTimeVar1034) if (true) {
                Result<List<Bool>>.Err(Exception())
            };
            var975
        };
        var511
    }

}


external record Aggregate325 {
    public init() { // block id: 327

    }
;
    public static var var403 : List<(Range<Int32>*Range<Int8>*Bool*Int64*Float64)> = [((Int32(-53)..=Int32(-64):((-93)|1)), (Int8((-111.0))..Int8(Int32(-78)):(91|1)), true, Int64(Float32(UInt32(129))), 18.0), ((Int32(UInt16(46))..Int32(Int32(-29)):(66|1)), (Int8(26)..=Int8(4):(-31)|1), false, 20, 103.0), ((Int32(15)..=Int32(16):((-16)|1)), (Int8(-7)..=Int8(-3):(Int64(Float32(44.0))|1)), ([UInt16(216), UInt16(231), UInt16(214), UInt16(5), UInt16(31)] is Char), Int64(UInt32(131)), 39.0), ((Int32(6)..=Int32(-16):(-58)|1), (Int8(-22)..=Int8(-64):66|1), ((UInt8(78)..UInt8(30):((-97)|1)) is Int64), Int64(18), 40.0), ((Int32(29)..=Int32(55):68|1), (Int8(Int32(-78))..=Int8(UInt16(40)):(51|1)), (Float32(Float32(-61.0)) is UInt64), 5, Float64(UInt16(UInt16(34))))];
    public mut func func332(optionalParam333 ! : List<UInt16> = [UInt16(UInt8(91)), UInt16(93), UInt16(88), UInt16(UInt64(16)), UInt16(2)]) : (Range<Int32>*Range<Int8>*Bool*Int64*Float64) { // block id: 342
        if (if (true) { true } else { false } ) { // block id: 348

        };
        let var636 : Class195 = Class195(Class195());
        if ((Result<List<Bool>>.Err(Exception()) ?? var358)[3]) { // block id: 378
            let var386 : Float64 = Float64(UInt16(214));
            match (Float32(-67.0)) {
                case _ =>
                    var219;
                    Option<Option<(Int32*Range<UInt8>)>>.None;
                    var386

            };
            if (false) { // block id: 391
                var393;
                ();
                ()
            };
            var403[3]
        } else { // block id: 479
            var var483 : List<Int16> = [Int16(98), Int16(UInt8(Int32(-42))), Int16(UInt32(UInt16(Int8(0)))), Int16(UInt32(Float32(-40.0))), Int16(71)];
            var483[4];
            Int16(33);
            let var641 : Result<Option<(Range<Int32>*Range<Int8>*Bool*Int64*Float64)>> = Result<Option<(Range<Int32>*Range<Int8>*Bool*Int64*Float64)>>.Err(Exception());
            let var667 : Bool = false;
            let var692 : Int8 = Int8(UInt16(12));
            func func500() : (Range<Int32>*Range<Int8>*Bool*Int64*Float64) { // block id: 501
                let var538 : Float64 = (-27.0);
                Int8(func506(namedParam507 : (UInt16(225)..=UInt16(26):((-62)|1)), namedParam508 : var538)[0]);
                let var543 : Interface196 = Class195();
                var var593 : Aggregate9 = Aggregate9();
                var543.func546([Aggregate9(), Aggregate9(), Aggregate9(), var593, Aggregate9()][0]);
                let var659 : List<Unit> = [(), (), (), (), ()];
                var var684 : Int64 = 34;
                ((match (var631) {
                    case _ =>
                        var636;
                        var641

                } ?? (var641 ?? var631)) ?? match {
                    case match (Enum648.defaultValue) {
                        case defaultValue =>
                            true

                        case defaultValue =>
                            var659;
                            var667

                        case defaultValue =>
                            var667

                        case _ =>
                            var667

                    } =>
                    var603;
                    ();
                    ((Int32(-91)..Int32(73):(-123)|1), (Int8(115)..=Int8(-77):(-25)|1), var667, var684, (-7.0))
                    case _ =>
                    ((Int32(-87)..=Int32(-31):(-55)|1), (var692..=var696:(84|1)), true, 95, var538)
                })
            }
;
            func500()
        }
    }

}


internal func func506(namedParam507 ! : Range<UInt16>, namedParam508 ! : Float64) : (UInt16*(Int16*Int32)) { // block id: 509
    var511;
    var522
}





external enum Enum648 {
    defaultValue |
    enumValue783 |
    enumValue977(List<Int16>)
}


external enum Enum848 {
    defaultValue
}



extend Class195 {

}

extend Aggregate9 {

}

extend Enum648 {

}


