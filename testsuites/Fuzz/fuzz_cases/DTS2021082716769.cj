// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex is used before initialization

// random seed:1629929356755

// Int64[] -> Array<Int64>, Success -> Ok, Failure -> Err, Make Enum161 external.

// All global variable need to be defined before use!
internal var var6 : Unit = ()
external let var43 : UInt16 = UInt16(32)
internal var var49 : Int64 = 45
external let var106 : Unit = ()
external var var128 : Interface73 = Class71<Range<UInt64>, List<List<(Bool*(Int64*Range<Int8>*(Unit*Float32))*Range<UInt16>)>>, Range<Int32>>((-35.0))
internal var var141 : Bool = (((), Float32(107.0)) is UInt64)
internal var var148 : Class71<Range<UInt64>, List<List<(Bool*(Int64*Range<Int8>*(Unit*Float32))*Range<UInt16>)>>, Range<Int32>> = Class71<Range<UInt64>, List<List<(Bool*(Int64*Range<Int8>*(Unit*Float32))*Range<UInt16>)>>, Range<Int32>>()
external let var202 : List<Unit> = [(), (), (), (), ()]
internal var var212 : Interface72 = Class71<Range<UInt64>, List<List<(Bool*(Int64*Range<Int8>*(Unit*Float32))*Range<UInt16>)>>, Range<Int32>>(Float64(UInt16(UInt8(253))))
external let var338 : (Int64*Range<Int8>*(Unit*Float32)) = (Int64(UInt32(Int8(Int16(2)))), (Int8(-68)..=Int8(10):69|1), ((), Float32(29)))
internal let var366 : (Bool*(Int64*Range<Int8>*(Unit*Float32))*Range<UInt16>) = (((Aggregate175() is Int8) is Int16), ((-55), (Int8(-8)..=Int8(-63):(Int64((-108.0))|1)), ((), Float32(UInt32(80)))), (UInt16(214)..UInt16(164):66|1))
external var var397 : (Unit*Float32) = ((), Float32(UInt16(236)))
internal let var485 : List<(Int64*Float64)> = [(Int64(Int32(-56)), 40.0), ((-66), Float64(94.0)), (21, Float64(UInt8(UInt64(46)))), (Int64(UInt16(248)), Float64(Int16(-69))), (Int64(Float64(112.0)), 71.0)]
internal let var694 : Range<UInt16> = (UInt16(76)..=UInt16(247):5|1)
external var var719 : Int8 = Int8(115)
internal var var726 : Float32 = Float32(1.0)
external var var848 : Float32 = Float32(6.0)
internal var var949 : (Int64*Float64) = (Int64(UInt32(Int32(75))), Float64(Float32(UInt8(249))))
external let var1014 : Float64 = (-117.0)
internal let var1035 : List<Bool> = [('o' is Int32), false, false, (Option<List<(Int64*Float64)>>.None is (Range<UInt32>*Range<Int32>)), ([[false, false, false, true, false], [false, false, false, true, true], [true, true, false, true, false], [true, true, true, false, true], [true, true, false, true, true]] is Range<Int64>)]
external let var1173 : Bool = ((Int8(UInt8(36))..Int8(76):((-5)|1)) is Char)
internal var var1224 : Int32 = Int32(72)
internal let var1295 : String = "~r7'F#-gC&"
internal var var1305 : Result<(Unit*Float32)> = Result<(Unit*Float32)>.Ok(var397)
internal let var1314 : Option<Result<(Unit*Float32)>> = Option<Result<(Unit*Float32)>>.Some(var1305)
external var var1330 : Option<(Int64*Float64)> = (Class71<Range<UInt64>, List<List<(Bool*(Int64*Range<Int8>*(Unit*Float32))*Range<UInt16>)>>, Range<Int32>>() as (Int64*Float64))
external let var1362 : (UInt16*UInt16*UInt16*UInt16*(Int64*Float64)) = (UInt16(Int32(-126)), UInt16(237), UInt16(Float64(UInt32(13))), UInt16(Float32(95.0)), ((-27), Float64(UInt32(236))))
func main(): Int64 {
    var6;
    let var32 : (Unit*Float32) = ((), Float32(-4.0));
    func func27() : Bool { // block id: 28
        var32[0];
        true
    }
;
    let var62 : (Int64*Float64) = (Int64(Int8(14)), (-44.0));
    let var77 : Class71<Range<UInt64>, List<List<(Bool*(Int64*Range<Int8>*(Unit*Float32))*Range<UInt16>)>>, Range<Int32>> = Class71<Range<UInt64>, List<List<(Bool*(Int64*Range<Int8>*(Unit*Float32))*Range<UInt16>)>>, Range<Int32>>(31.0);
    let var1379 : UInt32 = UInt32(130);
    func func11(param12 : UInt64, namedParam13 ! : UInt8, optionalParam14 ! : UInt64 = UInt64(Int32(-45)), optionalParam17 ! : Unit = ()) : (Int64*Float64) { // block id: 19
        func func21(param22 : Bool) : UInt64 { // block id: 23
            UInt64(if (func27()) { (UInt16(196), var43, var43, var43, (var49, (-65.0)))[2] } else { var43 } )
        }
;
        func21(try { // block id: 55
            (UInt16(234), UInt16(88), UInt16(98), UInt16(15), var62);
            true
        } catch (_) { // block id: 68
            false
        });
        var77.func119(namedParam120 : var397, namedParam121 : (var1379..=UInt32(124):(102|1)), namedParam122 : false)
    }
;
    var var1386 : UInt8 = UInt8(166);
    var var1389 : UInt64 = UInt64(250);
    func11(UInt64(69), namedParam13 : var1386, optionalParam14 : var1389, optionalParam17 : var106)[0]
    // CRC Check All Variables
    var crccheck = CrcCheck(5000, 32)
    crccheck.updateBuffer(UInt64(var1379), 64)
    crccheck.updateBuffer(UInt64(var1386), 64)
    crccheck.updateBuffer(UInt64(var1389), 64)
    crccheck.updateBuffer(UInt64(var43), 64)
    crccheck.updateBuffer(UInt64(var49), 64)
    crccheck.updateBuffer(UInt64(var719), 64)
    crccheck.updateBuffer(UInt64(var1224), 64)
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
internal open class Class71<T0, T1, T2> <: Interface72 & Interface73 where T0 <: Range<UInt64>, T1 <: List<List<(Bool*(Int64*Range<Int8>*(Unit*Float32))*Range<UInt16>)>>, T2 <: Range<Int32> {
    public init() { // block id: 75

    }
;
    private static let var98 : List<Bool> = [true, true, false, true, false];
    public static var var115 : Class71<Range<UInt64>, List<List<(Bool*(Int64*Range<Int8>*(Unit*Float32))*Range<UInt16>)>>, Range<Int32>> = Class71<Range<UInt64>, List<List<(Bool*(Int64*Range<Int8>*(Unit*Float32))*Range<UInt16>)>>, Range<Int32>>();
    public init(param80 : Float64) { // block id: 81
        var loopTimeVar113 : Int64 = 0;
        do {
            loopTimeVar113++;
            try { // block id: 103
                ();
                var106
            } catch (e: Exception) { // block id: 108
                var106
            } finally { // block id: 110
                ()
            }
        } while (match ((-30.0)) {
            case _ =>
                var98

        }[1] && loopTimeVar113 < 100 ) ;
        var115
    }
;
    private var var317 : Int8 = Int8(UInt8(Int32(Int32(Int8(-96)))));
    public static var var387 : (Unit*Float32) = ((), Float32(116.0));
    static var var980 : List<Bool> = [(UInt64(141) is UInt8), (112.0 is (Range<UInt32>*Range<Int32>)), (((-65)..(-32):(-53)|1) is (Bool*(Int64*Range<Int8>*(Unit*Float32))*Range<UInt16>)), true, (Class71<Range<UInt64>, List<List<(Bool*(Int64*Range<Int8>*(Unit*Float32))*Range<UInt16>)>>, Range<Int32>>() is Range<UInt8>)];
    public static func func445(namedParam446 ! : Char, namedParam447 ! : Result<(Unit*Float32)>, namedParam448 ! : (UInt16*UInt16*UInt16*UInt16*(Int64*Float64))) : (Int64*Float64) { // block id: 449
        try { // block id: 451
            var loopTimeVar455 : Range<UInt64> = (UInt64(8)..UInt64(UInt64(Float64(Float32(-58.0)))):(Int64(Int8(-127))|1));
            for (i in loopTimeVar455) if (var141) {

            };
            try { // block id: 465
                let var469 : UInt16 = UInt16(187);
                (var43, var469, var469, UInt16(84), (var49, (-119.0)));
                ()
            } catch (_) { // block id: 477
                var6;
                var106;
                var6
            } finally { // block id: 481

            };
            var485[1]
        } finally { // block id: 511
            let var515 : List<(Range<UInt32>*Range<Int32>)> = [((UInt32(158)..UInt32(UInt64(63)):(Int64(Int32(-116))|1)), (Int32(-21)..Int32(UInt32(221)):(Int64(Int32(68))|1))), ((UInt32(Int16(-70))..=UInt32(31):(Int64(UInt64(107))|1)), (Int32((-19))..Int32(Int32(-16)):(13|1))), ((UInt32(Int16(-36))..=UInt32(223):(Int64(UInt64(103))|1)), (Int32(-38)..=Int32(-46):(Int64(UInt64(243))|1))), ((UInt32(243)..=UInt32(61):(Int64(UInt32(148))|1)), (Int32(Int32(-80))..Int32(UInt64(117)):(2|1))), ((UInt32(48)..UInt32(34):(-50)|1), (Int32(-96)..Int32(-82):123|1))];
            var515[4];
            (Option<Unit>.Some(var106) ?? var6);
            func581()
        }
    }
;
    public func func119(namedParam120 ! : (Unit*Float32), namedParam121 ! : Range<UInt32>, namedParam122 ! : Bool) : (Int64*Float64) { // block id: 123
        let var279 : Int32 = Int32(Int32(22));
        let var284 : Int64 = (-33);
        var var293 : Float64 = Float64(Float32(-1.0));
        let var329 : (Int64*Range<Int8>*(Unit*Float32)) = (Int64(UInt16(173)), (Int8(40)..=Int8(-92):(-22)|1), ((), Float32(-69.0)));
        var var406 : Float32 = Float32(Int8(Float64(UInt32(Int32(28)))));
        var var413 : (Unit*Float32) = ((), Float32(Int64(Int8(-107))));
        if ((if ((var128.func132(namedParam133 : (Int32(26)..=Int32(27):120|1), namedParam134 : UInt8(54)))) { func132(namedParam133 : (var279..var279:(var284|1)), namedParam134 : UInt8(24)) } else { match {
            case namedParam122 =>
            (95, var293);
            Class71<Range<UInt64>, List<List<(Bool*(Int64*Range<Int8>*(Unit*Float32))*Range<UInt16>)>>, Range<Int32>>(119.0);
            namedParam122
            case namedParam122 =>
            true;
            var115;
            false
            case _ =>
            Int32(-107);
            ();
            false
        } } )) { [(116, (var317..var317:((-76)|1)), (var6, Float32(-89.0))), var329, var338, (var49, (Int8(120)..=Int8(-26):(14|1)), namedParam120), (var284, (Int8(-39)..Int8(100):37|1), namedParam120)][4][2] } else { (if (var366[0]) { (Class71<Range<UInt64>, List<List<(Bool*(Int64*Range<Int8>*(Unit*Float32))*Range<UInt16>)>>, Range<Int32>>.var387) } else { (Result<(Unit*Float32)>.Ok(var397) ?? var413) } ) } ;
        var loopTimeVar443 : Int64 = 0;
        while ([[false, true, false, true, true], [false, false, true, true, false], [true, false, true, true, false], [false, true, false, true, false], [true, false, false, false, true]][1][0] && loopTimeVar443 < 100 ) {
            loopTimeVar443++;
            var var433 : UInt32 = UInt32(Float32(-107.0));
            ((UInt32(204)..=var433:((-61)|1)), (Int32(96)..=Int32(19):(var49|1)))[0]
        };
        func445(namedParam446 : '2', namedParam447 : (('K' as Result<(Unit*Float32)>) ?? (var1314 ?? Result<(Unit*Float32)>.Err(Exception()))), namedParam448 : var128.func1321())
    }

}

internal interface Interface72 {
    func func218(param219 : Range<Int8>, namedParam220 ! : Int8) : Unit { // block id: 221

    }
;
    static func func596(param597 : Range<UInt8>) : Unit { // block id: 598
        let var605 : Result<(Unit*Float32)> = Result<(Unit*Float32)>.Ok(var397);
        let var614 : List<(Bool*(Int64*Range<Int8>*(Unit*Float32))*Range<UInt16>)> = [((UInt8(UInt8(163)) is Interface72), ((-48), (Int8(-30)..=Int8(42):(-39)|1), ((), Float32(-21.0))), (UInt16(250)..=UInt16(119):(-85)|1)), (false, (Int64(86), (Int8(-68)..Int8(-81):55|1), ((), Float32(18.0))), (UInt16(Int16(-40))..=UInt16(UInt64(7)):(Int64(Int32(115))|1))), (true, ((-8), (Int8(-36)..=Int8(126):((-37)|1)), ((), Float32(4.0))), (UInt16(26)..UInt16(UInt8(167)):(Int64(107)|1))), (false, (Int64((-19)), (Int8(-71)..=Int8(-5):33|1), ((), Float32(96.0))), (UInt16(154)..=UInt16(198):79|1)), ((((UInt32(142)..=UInt32(139):(-122)|1) as Unit) is Range<Int32>), (Int64(Int8(18)), (Int8(-95)..=Int8(-94):(-9)|1), ((), Float32(-81.0))), (UInt16(13)..=UInt16(78):99|1))];
        match (var605) {
            case _ =>
                var106;
                [(), (), (), (), ()];
                [var614, var614, var614, var614, [(var141, var338, (UInt16(58)..UInt16(107):(-79)|1)), (false, var338, var694), var366, (var141, var338, (UInt16(100)..UInt16(174):((-67)|1))), var366]]

            case _ =>
                var6;
                var366;
                let var806 : Range<Int8> = (Int8(13)..=Int8(7):32|1);
                [[var366, var366, (var141, (var49, (var719..var719:((-80)|1)), ((), var726)), (UInt16(194)..UInt16(203):50|1)), (true, (var49, (var719..=Int8(-11):(var49|1)), var397), var694), (true, (var49, (var719..=Int8(79):(var49|1)), ((), var726)), (UInt16(86)..UInt16(185):40|1))], [(true, var338, var694), (true, ((-21), (Int8(-114)..var719:(var49|1)), (var106, Float32(-40.0))), var694), (true, var338, (UInt16(23)..=UInt16(248):106|1)), (true, var338, var694), var366], [var366, var366, (var141, (var49, (Int8(112)..=Int8(2):(-51)|1), (var106, var726)), var694), (var141, (var49, (Int8(52)..=Int8(47):105|1), (var6, var726)), (UInt16(166)..=UInt16(219):(-9)|1)), var366], [var366, (false, (39, var806, var397), (UInt16(64)..UInt16(4):8|1)), var366, (var141, ((-35), (Int8(-9)..=Int8(39):(-3)|1), var397), (UInt16(252)..UInt16(83):(-2)|1)), (var141, (124, (Int8(-69)..var719:((-103)|1)), var397), (UInt16(63)..UInt16(92):(-17)|1))], [(var141, (var49, var806, var397), var694), (var141, var338, (UInt16(4)..=UInt16(216):52|1)), (true, ((-29), var806, ((), var848)), (UInt16(184)..UInt16(198):(-75)|1)), var366, (var141, ((-51), var806, var397), (var43..var43:((-3)|1)))]]

        }[3][0];
        func865();
        let var916 : (UInt16*UInt16*UInt16*UInt16*(Int64*Float64)) = (UInt16(60), UInt16(Int32(UInt32(47))), UInt16(UInt64(69)), UInt16(UInt8(62)), (47, (-35.0)));
        func func913() : (UInt16*UInt16*UInt16*UInt16*(Int64*Float64)) { // block id: 914
            var916
        }
;
        let var939 : (Int64*Float64) = (Int64(UInt8(220)), 104.0);
        func func873<T0, T1>(namedParam874 ! : (UInt16*UInt16*UInt16*UInt16*(Int64*Float64)), optionalParam875 ! : List<(Range<UInt32>*Range<Int32>)> = [((UInt32(174)..UInt32(234):(-106)|1), (Int32(31)..Int32(-29):107|1)), ((UInt32((-86.0))..UInt32(Int8(-68)):(Int64(UInt8(150))|1)), (Int32(34)..=Int32(39):68|1)), ((UInt32(79)..UInt32(207):(-31)|1), (Int32(-78)..=Int32(19):(-125)|1)), ((UInt32(Int16(114))..=UInt32(166):(80|1)), (Int32(-93)..Int32(-117):(-23)|1)), ((UInt32(139)..UInt32(180):119|1), (Int32(97)..Int32(-6):80|1))], optionalParam902 ! : Range<UInt32> = (UInt32(8)..UInt32(133):(Int64(Int8(-32))|1)), namedParam908 ! : List<Bool>) : Unit { // block id: 909
            var loopTimeVar992 : Int64 = 0;
            while ((func913() is Int16) && loopTimeVar992 < 100 ) {
                loopTimeVar992++;
                let var962 : Float64 = Float64(Int8(-62));
                (Option<List<(Int64*Float64)>>.Some(var485) ?? [(26, var962), (44, 105.0), (var49, 125.0), (115, var962), (var49, var962)]);
                Class71<Range<UInt64>, List<List<(Bool*(Int64*Range<Int8>*(Unit*Float32))*Range<UInt16>)>>, Range<Int32>>.var980
            };
            var var994 : Unit = ();
            var994
        }
;
        var var1008 : Option<(Int64*Float64)> = ((UInt8(121)..=UInt8(113):77|1) as (Int64*Float64));
        let var1103 : UInt16 = UInt16(UInt16(123));
        func873<Option<List<Bool>>, Range<UInt16>>(namedParam874 : (UInt16(12), var43, var43, var43, (var1008 ?? (119, var1014))), optionalParam902 : try { // block id: 1017
            ();
            (UInt64(139)..UInt64(21):(var49|1));
            (UInt32(46)..UInt32(223):17|1)
        } catch (_) { // block id: 1024
            (UInt32(77)..=UInt32(31):((-111)|1))
        }, namedParam908 : (Option<List<Bool>>.None ?? match (Option<List<Bool>>.None) {
            case caseVar1075 : Aggregate175 =>
                [false, var141, var141, false, var141]

            case _ =>
                var6;
                [var141, var141, false, var141, var141]

            case caseVar1095 : List<List<Bool>> =>
                [true, true, false, true, false]

            case _ =>
                (var1103..UInt16(128):(var49|1));
                [var141, false, false, true, var141]

            case _ =>
                (Int32(-115)..Int32(-20):27|1);
                [(96, var1014), var939, (10, (-13.0)), var949, var939];
                [var141, var141, true, var141, var141]

        }))
    }
;
    static func func581() : (Int64*Float64) { // block id: 582
        var var587 : Bool = false;
        var var1193 : Bool = (((-70)..(-87):123|1) is List<List<(Bool*(Int64*Range<Int8>*(Unit*Float32))*Range<UInt16>)>>);
        let var1227 : Result<Int32> = Result<Int32>.Err(Exception());
        if ([var587, false, false, true, true][3]) { // block id: 594
            func596((UInt8(72)..=UInt8(40):(-79)|1));
            (Option<Unit>.Some(var106) ?? ());
            match (Class71<Range<UInt64>, List<List<(Bool*(Int64*Range<Int8>*(Unit*Float32))*Range<UInt16>)>>, Range<Int32>>((-7.0))) {
                case caseVar1143 =>
                    var6;
                    var397;
                    (var49, (-100.0))

                case _ =>
                    (UInt32(217)..UInt32(85):(-12)|1);
                    var6;
                    var949

                case _ =>
                    var949

                case caseVar1162 =>
                    var949

                case _ =>
                    var949

            }
        } else if (if ((if (var587) { false } else { var1173 } )) { try { // block id: 1181
            var var1183 : UInt64 = UInt64(UInt16(37));
            var1183;
            true
        } catch (_) { // block id: 1187
            ();
            Option<Unit>.None;
            var1173
        } } else { if (var1193) { // block id: 1196
            true
        } else if (var587) { // block id: 1199
            ();
            false
        } else { // block id: 1202
            var106;
            var var1205 : (Range<UInt32>*Range<Int32>) = ((UInt32(Int8(-1))..=UInt32((-53)):(Int64(Float32(Int8(109)))|1)), (Int32(-123)..Int32(-64):44|1));
            var1205;
            false
        } } ) { // block id: 1217
            (var1227 ?? var1224);
            let var1253 : Range<Int8> = (Int8(-79)..=Int8(121):(Int64(UInt32(Float32(Float32(-4.0))))|1));
            match (Enum1231.defaultValue) {
                case _ : Float64 =>
                    var var1238 : Range<Int16> = (Int16(Float64(Int8(93.0)))..=Int16(Int32(62)):(46|1));
                    var1238

                case _ =>
                    (80, var1253, (var106, var848));
                    ();
                    (Int16(-93)..=Int16(82):(-20)|1)

                case _ =>
                    Option<(Int64*Float64)>.Some(var949);
                    (Int16(-46)..=Int16(69):(-102)|1)

            };
            var949
        } else { // block id: 1274
            var var1282 : Result<Int8> = Result<Int8>.Err(Exception());
            (var1282 ?? Int8(63));
            if (var141) { // block id: 1287
                Int8(125);
                let var1290 : String = "Fq&oz[rZia";
                var1290
            } else { // block id: 1292
                var43;
                var1295
            };
            var949
        }
    }
;
    func func119(namedParam120 ! : (Unit*Float32), namedParam121 ! : Range<UInt32>, namedParam122 ! : Bool) : (Int64*Float64)

}

external interface Interface73 {
    func func132(namedParam133 ! : Range<Int32>, namedParam134 ! : UInt8) : Bool { // block id: 135
        var loopTimeVar153 : Range<UInt64> = (UInt64(Float32(22.0))..=UInt64(165):(78|1));
        for (i in loopTimeVar153) if (try { // block id: 138
            [false, false, true, false, false];
            var141
        } finally { // block id: 146
            var148;
            true
        }) {
            var49
        };
        var6;
        let var224 : Int8 = Int8(65);
        func func164(optionalParam165 ! : Bool = (Class71<Range<UInt64>, List<List<(Bool*(Int64*Range<Int8>*(Unit*Float32))*Range<UInt16>)>>, Range<Int32>>((-10.0)) is UInt16)) : Enum161<UInt32, List<(Int64*Range<Int8>*(Unit*Float32))>, Result<(Unit*Float32)>> { // block id: 169
            ();
            if (var141) { // block id: 173
                Aggregate175.var180
            } else if (match (match (Float32(101.0)) {
                    case caseVar187 =>
                        UInt8(172);
                        Enum161<UInt32, List<(Int64*Range<Int8>*(Unit*Float32))>, Result<(Unit*Float32)>>.defaultValue

                    case _ =>
                        Enum161<UInt32, List<(Int64*Range<Int8>*(Unit*Float32))>, Result<(Unit*Float32)>>.defaultValue

                }) {
                case _ =>
                    ();
                    optionalParam165

            }) { // block id: 198
                var202[1];
                var212.func218((var224..=var224:(var49|1)), namedParam220 : var224);
                let var233 : Range<UInt32> = (UInt32(Int32(Float32(-34.0)))..UInt32(UInt16(198)):(66|1));
                let var242 : Enum161<UInt32, List<(Int64*Range<Int8>*(Unit*Float32))>, Result<(Unit*Float32)>> = Enum161<UInt32, List<(Int64*Range<Int8>*(Unit*Float32))>, Result<(Unit*Float32)>>.defaultValue;
                if (var141) { // block id: 231
                    var233;
                    var242
                } else { // block id: 244
                    var106;
                    Enum161<UInt32, List<(Int64*Range<Int8>*(Unit*Float32))>, Result<(Unit*Float32)>>.defaultValue
                }
            } else { // block id: 247
                if (false) { Class71<Range<UInt64>, List<List<(Bool*(Int64*Range<Int8>*(Unit*Float32))*Range<UInt16>)>>, Range<Int32>>((-107.0)) } else { var128 } ;
                var var254 : Enum161<UInt32, List<(Int64*Range<Int8>*(Unit*Float32))>, Result<(Unit*Float32)>> = Enum161<UInt32, List<(Int64*Range<Int8>*(Unit*Float32))>, Result<(Unit*Float32)>>.defaultValue;
                var254
            }
        }
;
        match (func164(optionalParam165 : false)) {
            case _ =>
                var106;
                var141

            case _ =>
                var141

            case defaultValue =>
                var6;
                true

            case _ =>
                false

        }
    }
;
    func func1321() : (UInt16*UInt16*UInt16*UInt16*(Int64*Float64)) { // block id: 1322
        var var1341 : (Range<UInt32>*Range<Int32>) = ((UInt32(Int16(95))..UInt32(UInt32(144)):(Int64(UInt64(Int8(-65)))|1)), (Int32(-50)..=Int32(119):(Int64(98)|1)));
        match ((Result<Option<(Int64*Float64)>>.Ok(var1330) ?? ((-108.0) as (Int64*Float64)))) {
            case caseVar1338 =>
                var1341;
                Class71<Range<UInt64>, List<List<(Bool*(Int64*Range<Int8>*(Unit*Float32))*Range<UInt16>)>>, Range<Int32>>()

            case _ =>
                106.0;
                this

        };
        var1362
    }
;
    static func func445(namedParam446 ! : Char, namedParam447 ! : Result<(Unit*Float32)>, namedParam448 ! : (UInt16*UInt16*UInt16*UInt16*(Int64*Float64))) : (Int64*Float64)

}

external enum Enum161<T0, T1, T2> {
    defaultValue
}
external record Aggregate175 {
    public init() { // block id: 177

    }
;
    static var var180 : Enum161<UInt32, List<(Int64*Range<Int8>*(Unit*Float32))>, Result<(Unit*Float32)>> = Enum161<UInt32, List<(Int64*Range<Int8>*(Unit*Float32))>, Result<(Unit*Float32)>>.defaultValue
}



func func865() : Unit { // block id: 866
    var loopTimeVar871 : Int64 = 0;
    while (var141 && loopTimeVar871 < 100 ) {
        loopTimeVar871++;

    }
}





internal enum Enum1231 {
    defaultValue
}



extend Aggregate175 {

}


/*
return code: 139
*/
