// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

// random seed:1629725381863

// All global variable need to be defined before use!
external var var24 : Int64 = Int64(Int16(Int32(Float64(UInt32(121)))))
external let var66 : Float32 = Float32(-102.0)
external var var70 : Bool = true
internal let var77 : UInt16 = UInt16(Int32(72))
external let var146 : Int32 = Int32((-10.0))
external var var159 : Range<Int16> = (Int16(Int32(Int64(UInt32(234))))..=Int16(117):(25|1))
external let var225 : Aggregate195<Float32, Unit, Aggregate611> = Aggregate195<Float32, Unit, Aggregate611>()
external let var239 : UInt16 = UInt16(Float32(19.0))
external var var256 : UInt32 = UInt32(Int16(UInt64(87)))
external let var266 : Option<UInt32> = Option<UInt32>.None
external var var310 : (Option<UInt32>*Int64) = (Option<UInt32>.Some(var256), (-124))
internal let var323 : Range<Int8> = (Int8(UInt16(UInt8(163)))..Int8(Int32(84)):((-34)|1))
external var var344 : Unit = ()
external var var355 : Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>> = Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue34
external var var389 : ((Int32*Unit*Range<Int16>)*Interface10*String) = ((Int32(Int16(UInt64(254))), (), (Int16(-8)..=Int16(-42):40|1)), Class8(), "iM![9y&oz/")
external var var420 : ((Int32*Unit*Range<Int16>)*Interface10*String) = ((Int32(-39), (), (Int16(-87)..Int16(-9):55|1)), Class8(), "15hXB6}DM=")
external var var432 : UInt8 = UInt8(Float32(UInt16(226)))
internal var var438 : Interface10 = Class8()
external var var465 : Interface9<Range<UInt32>, Range<Int16>, String> = Class8()
external var var481 : Result<Unit> = Result<Unit>.Ok(var344)
external var var501 : Int16 = Int16(-98)
external var var601 : Range<UInt8> = (UInt8(39)..UInt8(158):41|1)
external var var604 : String = "X6Xkbrb:C'"
external let var633 : Option<Bool> = Option<Bool>.Some(var70)
internal var var648 : (List<Range<Int64>>*(Float64*Unit)*Bool) = ([((-45)..=107:35|1), (9..(-90):95|1), (99..=(-2):115|1), (26..=(-90):(-126)|1), (38..=56:28|1)], (99.0, ()), true)
external var var684 : Float64 = Float64(UInt16(235))
external var var689 : (Float64*Unit) = (90.0, ())
external var var730 : List<(Float64*Unit)> = [((-61.0), ()), (31.0, ()), (Float64(UInt64(122)), ()), (126.0, ()), ((-12.0), ())]
internal let var763 : (Char*UInt64*Unit*UInt32*(Int32*Unit*Range<Int16>)) = ('Z', UInt64(Int16(-9)), (), UInt32(149), (Int32(-111), (), (Int16(98)..Int16(15):(Int64(UInt32(121))|1))))
external let var782 : Bool = false
internal var var804 : Option<Bool> = Option<Bool>.None
external var var817 : Char = 'D'
external var var833 : List<Option<UInt32>> = [Option<UInt32>.Some(var256), Option<UInt32>.None, Option<UInt32>.Some(var256), ((Option<List<Option<UInt32>>>.None as Bool) as UInt32), (Float64(UInt32(49)) as UInt32)]
external let var847 : Option<List<Option<UInt32>>> = Option<List<Option<UInt32>>>.None
external var var868 : Aggregate611 = Aggregate611()
external var var885 : Aggregate611 = Aggregate611()
external let var888 : Range<Int64> = ((-49)..Int64(Int32(Float64(Float32(-27.0)))):(Int64(UInt64(123))|1))
external var var900 : Unit = ()
external let var903 : Range<UInt64> = (UInt64(222)..=UInt64(195):12|1)
external var var917 : Result<Unit> = Result<Unit>.Err(Exception())
external var var954 : List<Bool> = [false, false, true, false, false]
external let var957 : Option<List<Bool>> = ("&H?NskwL5H" as List<Bool>)
external var var969 : Range<Int8> = (Int8(UInt64(Float32(UInt8(17))))..=Int8(3):(Int64(UInt64(UInt16(187)))|1))
external let var1038 : Option<Result<Unit>> = (Option<Result<Unit>>.Some(var481) as Result<Unit>)
external var var1253 : Int8 = Int8(-85)
external var var1280 : Unit = ()
external let var1327 : UInt32 = UInt32(160)
external var var1366 : (Int32*Unit*Range<Int16>) = (Int32(Int32(51)), (), (Int16(113)..Int16(55):92|1))
external var var1401 : UInt64 = UInt64(190)
func main(): Int64 {
    Class8.func15<Result<Unit>>(var782)
    // CRC Check All Variables
    var crccheck = CrcCheck(5000, 32)
    crccheck.updateBuffer(UInt64(var24), 64)
    crccheck.updateBuffer(UInt64(var77), 64)
    crccheck.updateBuffer(UInt64(var1327), 64)
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
external open class Class8 <: Interface9<Range<UInt32>, Range<Int16>, String> & Interface10 {
    public init() { // block id: 12

    }
;
    public static let var41 : Unit = ();
    private static var var131 : UInt8 = UInt8(67);
    public static let var362 : Bool = (Int8(111) is Int64);
    public static let var1152 : Result<Bool> = Result<Bool>.Ok(var782);
    protected init(optionalParam1103 ! : Interface10 = Class8(), namedParam1105 ! : (Char*UInt64*Unit*UInt32*(Int32*Unit*Range<Int16>)), optionalParam1106 ! : (Int32*Unit*Range<Int16>) = (Int32(UInt8(UInt64(205))), (), (Int16(-51)..=Int16(-50):42|1)), optionalParam1113 ! : Option<UInt32> = Option<UInt32>.Some(var256)) { // block id: 1116
        if ((UInt8(167) is Range<UInt32>)) { // block id: 1120
            var loopTimeVar1124 : Range<UInt64> = (UInt64(UInt16(Int32(17)))..UInt64(38):((-47)|1));
            for (i in loopTimeVar1124) if (var782) {

            };
            var loopTimeVar1135 : Range<UInt64> = (UInt64(Int16(UInt8(237)))..UInt64(157):(Int64(UInt16(Int64(Int8(3))))|1));
            for (i in loopTimeVar1135) if (true) {
                var344
            }
        } else if ((var1152 ?? if (var782) { false } else { var782 } )) { // block id: 1158
            match (UInt16(32)) {
                case _ : Float64 =>
                    var146

                case caseVar1167 =>
                    'z';
                    Int32(28)

                case _ =>
                    var344;
                    Int32(-101)

                case 58 =>
                    var41;
                    ();
                    Int32(-53)

                case _ =>
                    var344;
                    var146

            };
            var loopTimeVar1192 : Int64 = 0;
            do {
                loopTimeVar1192++;
                ();
                var501
            } while (var70 && loopTimeVar1192 < 100 )
        };
        var var1201 : Result<Range<Int64>> = Result<Range<Int64>>.Err(Exception());
        match ((var1201 ?? (var24..var24:(var24|1)))) {
            case caseVar1209 =>
                var344;
                Class8()

            case _ =>
                var438

        }
    }
;
    private static var var1093 : List<Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>> = [Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue717(Class8(), UInt32(Int32(50))), Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue352, Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue717(Class8(optionalParam1103 : Class8(), namedParam1105 : ('1', UInt64(202), (), UInt32(52), (Int32(31), (), (Int16(-28)..Int16(-26):(-78)|1))), optionalParam1106 : (Int32(-99), (), (Int16(20)..Int16(106):((-15)|1)))), UInt32(UInt64((-46)))), Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue110, Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue703];
    public static let var1258 : Int8 = Int8(70);
    public static func func169<T0, T1>(optionalParam170 ! : Range<Int8> = (Int8(-107)..=Int8(-26):(-113)|1)) : Int64 { // block id: 172
        func func188<T0, T1>() : Range<Int64> { // block id: 189
            ['b', 'v', '4', 'u', 'o'][1];
            func199().var1082
        }
;
        if (false) { [(var24..var24:(var24|1)), ((-105)..=76:112|1), ((-7)..=(-110):44|1), ((-11)..=(-62):(-111)|1), ((-99)..(-96):53|1)][1] } else { func188<Unit, Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>>() } ;
        var loopTimeVar1247 : Int64 = 0;
        var loopTimeVar1287 : Range<UInt64> = (UInt64(71)..=UInt64(112):((-120)|1));
        [match (var1093) {
            case _ =>
                ();
                ();
                ()

        }, do {
            loopTimeVar1247++;

        } while (var362 && loopTimeVar1247 < 100 ) , (Result<Unit>.Ok(var344) ?? ()), match (var1253) {
            case $var1258 | $var1258 | 23 =>
                var41

            case _ : Result<Unit> =>
                var41

            case _ : Option<Result<Unit>> =>
                var900

            case _ : List<Option<UInt32>> =>
                var900;
                var900;
                ()

            case _ =>
                var1280

        }, for (i in loopTimeVar1287) if (var70) {
            ();
            ()
        }][2];
        var var1302 : Unit = ();
        let var1310 : Unit = ();
        if (match ((Result<Range<Int64>>.Ok(var888) ?? var888)) {
            case _ =>
                var1302;
                var1302;
                var782

            case _ =>
                var41;
                var1310;
                false

        }) { // block id: 1313
            match (var256) {
                case caseVar1318 : UInt64 =>
                    var var1322 : Result<Unit> = Result<Unit>.Err(Exception());
                    Option<Result<Unit>>.Some(var481)

                case 139 | $var1327 =>
                    ();
                    ();
                    var1038

                case _ =>
                    [var355, var355, Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue110, Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue1340(var323), Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue110];
                    ();
                    Option<Result<Unit>>.Some(var481)

            };
            match (var1038) {
                case _ =>
                    ()

                case _ =>
                    var1310

            };
            Int64(var146)
        } else { // block id: 1357
            var1280;
            Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue352;
            var24
        }
    }
;
    public static func func15<T0>(param16 : Bool) : Int64 { // block id: 17
        match (try { // block id: 22
                var24;
                ();
                Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.defaultValue
            } catch (_) { // block id: 32
                Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue34
            }) {
            case caseVar37 =>
                'g';
                var41

            case enumValue34 =>
                Int16(-101);
                var41

            case _ =>
                ();
                ()

        };
        var var104 : List<Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>> = [Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue34, Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.defaultValue, Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.defaultValue, Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue110, Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue112((Int16(16)..Int16(98):(-70)|1), 'i', 2.0)];
        if ((if ((Class8() is Int64)) { match (Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.defaultValue) {
            case enumValue34 =>
                ();
                param16

            case _ =>
                var66;
                ();
                var70

        } } else { match (UInt16(28)) {
            case 187 | $var77 | $var77 =>
                param16

            case _ =>
                false

            case _ =>
                Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.defaultValue;
                Int16(15);
                var70

        } } )) { match (var104[1]) {
            case _ =>
                ();
                ()

        } } else { if (false) { // block id: 128
            var41;
            var131;
            var var134 : (Int32*Unit*Range<Int16>) = (Int32(Int64(UInt64(UInt64(64)))), (), (Int16(-90)..Int16(-105):(-118)|1));
            var134
        } else if (true) { // block id: 143
            (var146, (), (Int16(-120)..Int16(72):(var24|1)))
        } else { // block id: 154
            (var146, (), var159)
        }[1] } ;
        func169<Range<UInt16>, Class8>(optionalParam170 : (match (Class8(namedParam1105 : var763, optionalParam1106 : var1366)) {
            case caseVar1374 : Result<Unit> =>
                var24;
                ();
                Int8(24)

            case _ =>
                Int8(-85)

            case _ =>
                var900;
                var1253

        }..Int8(120):(try { // block id: 1389
            var24
        } finally { // block id: 1391
            ();
            [Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue1395(var1401, Int16(-94), true, UInt8(222)), Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue1069(var77, Option<Result<Unit>>.None), Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue352, var355, Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue1069(var77, var1038)];
            var24
        }|1)))
    }

}

external interface Interface9<T0, T1, T2> where T0 <: Range<UInt32>, T1 <: Range<Int16>, T2 <: String {
    func func332() : Result<Range<Int8>> { // block id: 333
        Result<Range<Int8>>.Err(Exception())
    }
;
    func func468(namedParam469 ! : UInt32, namedParam470 ! : UInt8) : Bool { // block id: 471
        var var488 : Char = 'r';
        var var492 : Unit = ();
        let var537 : Unit = ();
        try { // block id: 473
            var481.getOrThrow();
            (var488, UInt64(219), var492, UInt32(205), (var146, var344, (Int16(-96)..var501:(var24|1))))[2];
            (Option<Bool>.None ?? var70)
        } catch (e: Exception) { // block id: 508
            match (Result<Range<Int8>>.Ok(var323)) {
                case caseVar514 =>
                    ();
                    var344

                case _ =>
                    var344

            };
            if (true) { // block id: 523
                var389;
                var492;
                var70
            } else if (var70) { // block id: 528
                (namedParam470..UInt8(226):(84|1));
                var492;
                var70
            } else { // block id: 535
                var537;
                var70
            }
        } finally { // block id: 540
            try { // block id: 542
                ();
                Option<Bool>.None;
                ()
            } catch (e: Exception) { // block id: 546

            } finally { // block id: 547
                var323;
                ()
            };
            [var70, true, false, var70, var70][0]
        }
    }
;
    func func565(param566 : (List<Range<Int64>>*(Float64*Unit)*Bool), param567 : Range<UInt8>, namedParam568 ! : String, namedParam569 ! : ((Int32*Unit*Range<Int16>)*Interface10*String)) : Unit { // block id: 570

    }
;
    func func368(namedParam369 ! : Range<Int32>) : Bool { // block id: 370
        var var443 : Range<UInt32> = (UInt32(147)..UInt32(223):85|1);
        if (([(68..(-53):7|1), (56..(-56):8|1), (117..(-70):69|1), (59..(-91):(-99)|1), ((-63)..=29:55|1)], (84.0, ()), false)[2]) { if (false) { // block id: 384
            var var386 : Range<UInt16> = (UInt16(148)..UInt16(85):73|1);
            var386;
            var389
        } else if (var70) { // block id: 400
            var var403 : (Int32*Unit*Range<Int16>) = (Int32(Int16(Int8(49))), (), (Int16(13)..Int16(118):(29|1)));
            var var415 : String = "mVr 0,pz5&";
            (var403, Class8(), var415)
        } else { // block id: 417
            ();
            var420
        }[1] } else { if ((var432 is UInt32)) { // block id: 436
            var438
        } else { // block id: 440
            (UInt32(87)..=UInt32(243):(-11)|1);
            var443;
            Class8()
        } } ;
        if (if ((Option<Bool>.None ?? var70)) { (if (false) { false } else { true } ) } else { (Aggregate195<Float32, Unit, Aggregate611>() is ((Int32*Unit*Range<Int16>)*Interface10*String)) } ) { // block id: 462
            var465.func468(namedParam469 : var256, namedParam470 : UInt8(238))
        } else { // block id: 561
            var var572 : (List<Range<Int64>>*(Float64*Unit)*Bool) = ([((-119)..Int64(UInt32(14)):(Int64(UInt16(127))|1)), ((-121)..Int64(Int8(100)):(Int64(UInt32(3))|1)), (47..=(-14):119|1), (Int64(Int8(-6))..=Int64(82):(Int64(Float32(-108.0))|1)), ((-64)..=(-112):83|1)], (58.0, ()), true);
            var465.func565(var572, var601, namedParam568 : var604, namedParam569 : var420);
            (Result<Unit>.Err(Exception()) ?? ());
            Aggregate611.var616
        }
    }
;
    func func340(param341 : (Int32*Unit*Range<Int16>)) : (List<Range<Int64>>*(Float64*Unit)*Bool) { // block id: 342
        var344;
        func347(optionalParam350 : var355);
        if ((if ((Class8.var362)) { (this.func368(namedParam369 : (var146..=Int32(-69):((-121)|1)))) } else { (var633 ?? var70) } )) { (if (try { // block id: 638
            UInt32(148);
            ((-1.0), ());
            false
        } catch (_) { // block id: 644
            var344;
            var70
        }) { var648 } else { (Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>.Err(Exception()) ?? var648) } ) } else { try { // block id: 664
            ();
            var648
        } finally { // block id: 667
            var344;
            ();
            var648
        } }
    }
;
    static func func15(param16 : Bool) : Int64

}

external interface Interface10 <: Interface9<Range<UInt32>, Range<Int16>, String> {
    func func280() : (Float64*Unit) { // block id: 281
        var var287 : Range<UInt64> = (UInt64(168)..=UInt64(Int8(Float64((-88)))):(79|1));
        var loopTimeVar316 : Int64 = 0;
        while (var70 && loopTimeVar316 < 100 ) {
            loopTimeVar316++;
            match (var287) {
                case caseVar297 : Class8 =>
                    ()

                case caseVar302 : (Float64*Unit) =>
                    ();
                    UInt8(46);
                    ()

                case _ =>
                    var310;
                    ()

            }
        };
        (func332() ?? (Int8(-53)..Int8(-24):121|1));
        if (func340((Int32(9), (), (var501..=Int16(-124):((-125)|1))))[2]) { // block id: 679
            if (var70) { (var684, var344) } else { var689 }
        } else { // block id: 693
            try { // block id: 695
                ();
                var344;
                let var699 : List<Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>> = [Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue352, Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue703, Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue112((Int16(-26)..=Int16(-31):36|1), 'n', Float64(UInt32(UInt64(206)))), Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue34, Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.defaultValue];
                var699
            } catch (e: Exception) { // block id: 712
                ();
                ();
                [Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue717(Class8(), var256), var355, var355, var355, var355]
            };
            ();
            var730[0]
        }
    }
;
    func func753(param754 : Aggregate611, namedParam755 ! : Range<Int64>, namedParam756 ! : Range<UInt64>) : Option<UInt32> { // block id: 757
        let var785 : Bool = ((UInt64(70)..=UInt64(56):94|1) is ((Int32*Unit*Range<Int16>)*Interface10*String));
        match ((if (true) { var763 } else { var763 }  is UInt32)) {
            case $var782 | $var785 =>
                ()

            case false | $var785 | true =>
                var344

            case _ =>
                var344

        };
        var loopTimeVar824 : Int64 = 0;
        while (([var804, var804, Option<Bool>.None, var804, Option<Bool>.Some(var70)][2] ?? true) && loopTimeVar824 < 100 ) {
            loopTimeVar824++;
            try { // block id: 814
                (UInt16(212)..UInt16(222):(-47)|1);
                var817;
                var344
            } catch (e: Exception) { // block id: 820
                var344;
                ()
            }
        };
        (Option<List<Option<UInt32>>>.None ?? (var847 ?? [Option<UInt32>.Some(var256), Option<UInt32>.None, var266, Option<UInt32>.None, var266]))[0]
    }
;
    func func275() : Option<UInt32> { // block id: 276
        func280()[0];
        var438.func753(match ((UInt64(5)..=UInt64(234):((-12)|1))) {
            case caseVar864 =>
                ();
                var868

            case caseVar872 =>
                var868

            case caseVar877 : Interface10 =>
                var344;
                var868

            case _ =>
                ((-102)..=(-51):(-47)|1);
                var885

        }, namedParam755 : var888, namedParam756 : try { // block id: 898
            var900;
            var903
        } finally { // block id: 905
            var903
        })
    }
;
    static func func15(param16 : Bool) : Int64

}

external enum Enum19<T0, T1, T2> {
    defaultValue |
    enumValue34 |
    enumValue110 |
    enumValue112(Range<Int16>, Char, Float64) |
    enumValue352 |
    enumValue703 |
    enumValue717(Interface10, UInt32) |
    enumValue1069(UInt16, Option<Result<Unit>>) |
    enumValue1340(Range<Int8>) |
    enumValue1395(UInt64, Int16, Bool, UInt8)
}
external record Aggregate195<T0, T1, T2> {
    public init() { // block id: 197

    }
;
    static var var942 : Int8 = Int8(93);
    public init(optionalParam245 ! : List<Range<Int64>> = [(102..=(-90):19|1), ((-97)..(-29):(-3)|1), (9..=(-102):(-87)|1), ((-8)..=(-3):(-4)|1), (40..115:(-128)|1)], namedParam247 ! : Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>, namedParam248 ! : List<Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>>) { // block id: 249
        var var272 : Interface10 = Class8();
        (if (true) { (var266, 45)[0] } else { (var272.func275()) }  ?? match ((Option<Result<Unit>>.Some(var481) ?? var917)) {
            case caseVar921 =>
                var256

            case caseVar926 : Aggregate611 =>
                UInt32(57)

            case caseVar931 : Option<List<Option<UInt32>>> =>
                var256

            case caseVar936 =>
                var256

            case _ =>
                var942;
                Aggregate195<Float32, Unit, Aggregate611>();
                var256

        });
        var var999 : Bool = ([(Int64((-20))..(-3):((-30)|1)), ((-116)..=31:(-126)|1), (89..(-76):(30|1)), (Int64(UInt64(27))..Int64(58):(44|1)), (31..=89:(-91)|1)] is Option<Bool>);
        if ((var957 ?? [true, true, var782, var782, var782])[4]) { // block id: 967
            var969
        } else if (if (match (namedParam247) {
            case caseVar984 =>
                var501;
                false

            case _ =>
                ();
                var256;
                false

        }) { var954[4] } else { (var633 ?? var999) } ) { // block id: 1019
            if (var999) { () } else { () } ;
            if (var782) { (Int8(35)..=Int8(75):53|1) } else { (Int8(70)..=Int8(-94):18|1) }
        } else { // block id: 1028
            try { // block id: 1030
                (Int8(-32)..=Int8(-78):(-119)|1)
            } finally { // block id: 1032
                (var942..var942:(104|1));
                var1038;
                (var942..=var942:(43|1))
            }
        };
        Aggregate195<Float32, Unit, Aggregate611>()
    }
;
    let var1082 : Range<Int64> = ((-67)..=Int64(Int32(25)):((-12)|1))
}

external func func199() : Aggregate195<Float32, Unit, Aggregate611> { // block id: 200
    let var215 : (Int32*Unit*Range<Int16>) = (Int32(80), (), (Int16(42)..Int16(86):(Int64(Float32(42.0))|1)));
    match (Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue110) {
        case caseVar205 =>
            Int16(-110);
            ();
            Aggregate195<Float32, Unit, Aggregate611>()

        case enumValue34 =>
            Int16(44);
            var215;
            var225

        case enumValue112(_, _, caseVar229) =>
            var225

        case defaultValue  =>
            ();
            (UInt16(236)..var239:(120|1));
            let var1062 : List<Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>> = [Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue34, Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue110, Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue110, Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue703, Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue1069(UInt16(225), (Int8(75) as Result<Unit>))];
            Aggregate195<Float32, Unit, Aggregate611>(optionalParam245 : [((-33)..=106:(var24|1)), var888, var888, ((-60)..(-34):9|1), (var24..=var24:((-22)|1))], namedParam247 : Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue352, namedParam248 : var1062)

        case _ =>
            (Int8(-32)..=Int8(-73):121|1);
            ();
            Aggregate195<Float32, Unit, Aggregate611>()

    }
}



external func func347(optionalParam348 ! : Option<UInt32> = Option<UInt32>.Some(var256), optionalParam350 ! : Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>> = Enum19<Option<Bool>, Result<Range<Int64>>, Result<(List<Range<Int64>>*(Float64*Unit)*Bool)>>.enumValue352) : Unit { // block id: 353

}



external record Aggregate611 {
    public init() { // block id: 613

    }
;
    static let var616 : Bool = (Option<UInt32>.Some(var256) is (Option<UInt32>*Int64))
}



extend Aggregate195<T0, T1, T2> where T0 <: Float32, T1 <: Unit, T2 <: Aggregate611 {

}

extend Aggregate611 {

}

extend Enum19<T0, T1, T2> where T0 <: Option<Bool>, T1 <: Result<Range<Int64>>, T2 <: Result<(List<Range<Int64>>*(Float64*Unit)*Bool)> {

}
