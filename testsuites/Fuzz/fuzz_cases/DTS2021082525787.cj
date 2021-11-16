// EXEC: %compiler %cmp_opt -overflow wrapping %f -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

// random seed:1629772394767

// All global variable need to be defined before use!
external var var16 : Enum13<UInt16, List<Bool>, Float64> = Enum13<UInt16, List<Bool>, Float64>.defaultValue
external let var36 : Bool = false
external let var56 : UInt16 = UInt16(251)
external var var70 : Int8 = Int8(Float32(UInt16(Int32(15))))
external let var76 : Result<Int8> = Result<Int8>.Ok(var70)
external var var113 : Class107 = Class107()
external var var127 : Option<Bool> = (Int16(Int32(56)) as Bool)
external let var160 : Unit = ()
external var var163 : Result<Int8> = Result<Int8>.Err(Exception())
external let var180 : Int32 = Int32(94)
internal var var216 : (Bool*Bool*Range<UInt8>*UInt16) = (false, (Int64(Int64(UInt32(144))) is Int16), (UInt8(136)..=UInt8(36):(-73)|1), UInt16(UInt64(UInt8(164))))
external let var236 : Int16 = Int16(10)
external let var241 : Interface109<List<Aggregate516<UInt8, Range<Int16>, Enum13<UInt16, List<Bool>, Float64>>>, Range<UInt16>, UInt8> = Class107()
external var var276 : UInt32 = UInt32(UInt64((-30.0)))
external let var292 : (Char*UInt32*Float32) = ('C', UInt32(UInt32(225)), Float32(Float32(-73.0)))
external var var300 : Result<(Char*UInt32*Float32)> = Result<(Char*UInt32*Float32)>.Ok(var292)
external let var380 : Int64 = Int64(Float32(-73.0))
external var var412 : Range<UInt8> = (UInt8(147)..UInt8(195):105|1)
internal var var438 : List<Class107> = [Class107(), Class107(), Class107(), Class107(), Class107()]
external let var454 : List<Int64> = [Int64(UInt64(UInt16(195))), Int64(63), Int64(UInt32(87)), Int64(UInt16(219)), Int64(Int32(-115))]
external var var536 : List<Int16> = [Int16(-31), Int16(UInt16(UInt8(Int8(61)))), Int16(-90), Int16(Int64(Int32(-4))), Int16(Int8(-60))]
external var var581 : List<Unit> = [(), (), (), (), ()]
internal var var584 : (List<Class107>*String*List<Unit>) = ([Class107(), Class107(), Class107(), Class107(), Class107()], "nu.LJ&Vx|e", [(), (), (), (), ()])
external var var606 : Unit = ()
external var var641 : Aggregate516<UInt8, Range<Int16>, Enum13<UInt16, List<Bool>, Float64>> = Aggregate516<UInt8, Range<Int16>, Enum13<UInt16, List<Bool>, Float64>>()
external var var672 : Int32 = Int32(102)
external var var724 : List<Aggregate516<UInt8, Range<Int16>, Enum13<UInt16, List<Bool>, Float64>>> = [Aggregate516<UInt8, Range<Int16>, Enum13<UInt16, List<Bool>, Float64>>(), Aggregate516<UInt8, Range<Int16>, Enum13<UInt16, List<Bool>, Float64>>(), Aggregate516<UInt8, Range<Int16>, Enum13<UInt16, List<Bool>, Float64>>(), Aggregate516<UInt8, Range<Int16>, Enum13<UInt16, List<Bool>, Float64>>(), Aggregate516<UInt8, Range<Int16>, Enum13<UInt16, List<Bool>, Float64>>()]
external var var774 : Enum771<Aggregate516<UInt8, Range<Int16>, Enum13<UInt16, List<Bool>, Float64>>, Range<Int8>, Interface108> = Enum771<Aggregate516<UInt8, Range<Int16>, Enum13<UInt16, List<Bool>, Float64>>, Range<Int8>, Interface108>.defaultValue
external let var809 : Int64 = 16
external let var829 : Interface108 = Class107()
external var var847 : (Int32*(Int64*String)) = (Int32(Int8(-91)), (33, "a{)W':GkB)"))
external var var892 : String = "=yY4QCdTMV"
func main(): Int64 {
    let var47 : Unit = ();
    let var82 : Float64 = Float64(Float32(UInt8(46)));
    func func7<T0, T1>(namedParam8 ! : Int16) : Int16 { // block id: 9
        if (match (match (var16) {
                case defaultValue =>
                    "HkV66(]mm!"

                case defaultValue =>
                    "6$OdYk|\"T7"

                case _ =>
                    let var29 : String = "K[N6 aXNnk";
                    var29

            }) {
            case caseVar33 =>
                var36

            case caseVar40 : Float64 =>
                var36

            case _ =>
                var47;
                Int8(9);
                false

            case caseVar53 =>
                var56;
                false

            case _ =>
                var47;
                false

        }) { // block id: 63
            (var76 ?? var70);
            UInt32(var82);
            try { // block id: 87

            } finally { // block id: 88
                ();
                var47
            }
        };
        if (if (true) { // block id: 94
            var56;
            var47;
            true
        } else if ((Int16(32) is UInt16)) { // block id: 100
            var36
        } else { // block id: 102
            ();
            var47;
            true
        }) { (var113.func116()) } else { Int16([Int16(101), Int16(-127), Int16(-7), Int16(86), Int16(-20)][1]) }
    }
;
    func7<List<Int16>, Result<(Char*UInt32*Float32)>>(namedParam8 : var536[4]);
    let var553 : Interface108 = Class107();
    var553.func556(Result<(Char*UInt32*Float32)>.Ok(var292), namedParam558 : var892, namedParam559 : Class107())[4];
    Int64(UInt64(50))
    // CRC Check All Variables
    var crccheck = CrcCheck(5000, 32)
    crccheck.updateBuffer(UInt64(var70), 64)
    crccheck.updateBuffer(UInt64(var180), 64)
    crccheck.updateBuffer(UInt64(var276), 64)
    crccheck.updateBuffer(UInt64(var380), 64)
    crccheck.updateBuffer(UInt64(var672), 64)
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
external enum Enum13<T0, T1, T2> {
    defaultValue
}

external open class Class107 <: Interface108 & Interface109<List<Aggregate516<UInt8, Range<Int16>, Enum13<UInt16, List<Bool>, Float64>>>, Range<UInt16>, UInt8> {
    public init() { // block id: 111

    }
;
    protected var var132 : Bool = true;
    protected let var183 : List<Unit> = [(), (), (), (), ()];
    protected open func func135(param136 : Interface109<List<Aggregate516<UInt8, Range<Int16>, Enum13<UInt16, List<Bool>, Float64>>>, Range<UInt16>, UInt8>, param137 : UInt16) : Bool { // block id: 138
        match (if (var132) { // block id: 152
                var76
            } else if (var132) { // block id: 155
                ();
                var76
            } else { // block id: 158
                var160;
                var163
            }) {
            case caseVar167 : Unit =>
                [caseVar167, var160, (), (), ()]

            case caseVar177 =>
                var180;
                var183

            case caseVar187 : Bool =>
                var183;
                var183

            case _ =>
                'h';
                [(), (), (), (), ()]

            case _ =>
                var180;
                [(), (), (), (), ()]

        }[1];
        var loopTimeVar230 : Int64 = 0;
        if (try { // block id: 203
            false
        } catch (_) { // block id: 205
            var160;
            var36
        } finally { // block id: 208
            var56;
            var183;
            false
        }) { while (var216[1] && loopTimeVar230 < 100 ) {
            loopTimeVar230++;

        } } else { if (var132) { // block id: 233
            ();
            var236;
            ()
        } } ;
        true
    }
;
    protected let var315 : Range<Int16> = (Int16(55)..=Int16(80):(-41)|1);
    protected var var366 : Unit = ();
    let var469 : Int16 = Int16(UInt8(254));
    open func func116() : Int16 { // block id: 117
        let var248 : List<Bool> = [false, (Class107() is Option<Bool>), false, true, ((12..117:(Int64(UInt32(50))|1)) is UInt8)];
        if ((if ((var127 ?? var132)) { func135(var241, var56) } else { var248[0] } )) { Float32(match ([false, false, true, true, true]) {
            case caseVar267 =>
                UInt32(41)

            case _ =>
                '5';
                ();
                var276

            case _ =>
                var160;
                UInt32(30)

        }) } else { (var300 ?? var292)[2] } ;
        Class107();
        let var332 : Interface108 = Class107();
        let var347 : Char = 'r';
        var var351 : Float32 = Float32(Int16(Int32(Float32(UInt16(182)))));
        var var476 : Range<Int64> = ((-16)..18:(-74)|1);
        match {
            case if ((var315 is Option<Bool>)) { // block id: 317
                false
            } else if (if (var36) { false } else { true } ) { // block id: 323
                var160;
                true
            } else { // block id: 326
                var160;
                true
            } =>
            match (var332) {
                case caseVar336 =>
                    var160;
                    ();
                    (Int8(48)..=Int8(-41):104|1)

                case caseVar343 : Int64 =>
                    (var347, var276, var351);
                    (Int8(-27)..Int8(-95):(60|1))

                case _ =>
                    ();
                    var366;
                    let var369 : Range<Int8> = (Int8(-50)..Int8(23):108|1);
                    var369

                case _ =>
                    [(), (), (), (), ()];
                    Int8(-125);
                    (var70..Int8(112):(var380|1))

                case _ =>
                    ();
                    var160;
                    (Int8(8)..=Int8(38):(54|1))

            };
            func392<Enum13<UInt16, List<Bool>, Float64>>(namedParam393 : UInt16(77), namedParam394 : var380, namedParam395 : var36, namedParam396 : var476)
            case _ =>
            func480(namedParam481 : var127, namedParam482 : (Int32(108)..=Int32(-5):84|1), namedParam483 : [(-26), 84, 98, (-128), 112], namedParam484 : Class107())
        }
    }

}

external interface Interface108 {
    func func832() : (Unit*Int32) { // block id: 833
        var606;
        let var836 : (Unit*Int32) = ((), Int32(Int32(67)));
        var836
    }
;
    func func556(param557 : Result<(Char*UInt32*Float32)>, namedParam558 ! : String, namedParam559 ! : Interface109<List<Aggregate516<UInt8, Range<Int16>, Enum13<UInt16, List<Bool>, Float64>>>, Range<UInt16>, UInt8>) : List<Unit> { // block id: 560
        func func562<T0, T1>(param563 : Range<UInt32>, param564 : List<Int64>) : UInt16 { // block id: 565
            [([Class107(), Class107(), Class107(), var113, Class107()], namedParam558, var581), var584, (var438, namedParam558, var581), (var438, namedParam558, [var160, var160, (), var606, ()]), ([var113, Class107(), var113, Class107(), Class107()], namedParam558, var581)][0][0][4];
            var var748 : Range<UInt8> = (UInt8(140)..=UInt8(164):(-70)|1);
            match {
                case func623(namedParam624 : (Option<Int32>.None ?? var672), namedParam634 : namedParam559.func677(var536, namedParam679 : var724, namedParam680 : var236, namedParam681 : var454)) =>
                Result<(Char*UInt32*Float32)>.Ok(var292);
                (Option<Class107>.Some(var113) ?? Class107());
                (var36, false, var748, var56)
                case if (match (Option<Int32>.Some(var180)) {
                    case _ : (List<Class107>*String*List<Unit>) =>
                        var160;
                        var606;
                        true

                    case _ =>
                        ();
                        false

                }) { // block id: 764
                    var160;
                    false
                } else { // block id: 767
                    var36
                } =>
                match (var774) {
                    case defaultValue =>
                        var160;
                        (-123);
                        (true, true, (UInt8(36)..UInt8(45):(-2)|1), UInt16(25))

                    case _ =>
                        ();
                        var160;
                        var216

                }
                case _ =>
                var loopTimeVar798 : Int64 = 0;
                while (false && loopTimeVar798 < 100 ) {
                    loopTimeVar798++;
                    'I';
                    ()
                };
                var216
            };
            UInt16(170)
        }
;
        func562<Int16, List<Class107>>((UInt32(104)..UInt32(106):125|1), [(Option<Int64>.None ?? var809), var380, (Option<Int64>.Some(var809) ?? var380), Int64(UInt8(21)), ((-31), "1BHx%7\"_<J")[0]]);
        var829.func832()[0];
        match ((var847[0] as Class107)) {
            case _ : Int8 =>
                var160;
                var160;
                [(), var160, var160, var160, ()]

            case caseVar868 =>
                var581

            case _ : Interface108 =>
                ();
                ();
                var581

            case _ =>
                ([var113, Class107(), var113, Class107(), var113], "9oIC|HLV{C", [(), (), (), (), ()]);
                var581

        }
    }
;
    func func116() : Int16

}

external interface Interface109<T0, T1, T2> <: Interface108 where T0 <: List<Aggregate516<UInt8, Range<Int16>, Enum13<UInt16, List<Bool>, Float64>>>, T1 <: Range<UInt16>, T2 <: UInt8 {
    static func func392<T0>(namedParam393 ! : UInt16, namedParam394 ! : Int64, namedParam395 ! : Bool, namedParam396 ! : Range<Int64>) : Int16 { // block id: 397
        var160;
        func401(var454[2]).var469
    }
;
    func func677(param678 : List<Int16>, namedParam679 ! : List<Aggregate516<UInt8, Range<Int16>, Enum13<UInt16, List<Bool>, Float64>>>, namedParam680 ! : Int16, namedParam681 ! : List<Int64>) : Int8 { // block id: 682
        let var692 : Range<Int32> = (Int32(19.0)..Int32(Float64(Int8(UInt8(41)))):(49|1));
        var loopTimeVar702 : Int64 = 0;
        if (var36) { while (if (false) { true } else { true }  && loopTimeVar702 < 100 ) {
            loopTimeVar702++;
            var692
        } } else { try { // block id: 704
            var606;
            ()
        } catch (_) { // block id: 707
            var606;
            ()
        } finally { // block id: 710
            let var712 : List<Unit> = [(), (), (), (), ()];
            var712;
            var606;
            var606
        } } ;
        var70
    }
;
    func func116() : Int16

}



external func func401(param402 : Int64) : Class107 { // block id: 403
    var loopTimeVar421 : Range<UInt64> = (UInt64(UInt64(Int8(94)))..=UInt64(Int16(Int16(UInt64(180)))):(Int64((-93))|1));
    for (i in loopTimeVar421) if (if (var36) { (false, true, var412, var56)[1] } else { (if (true) { false } else { true } ) } ) {

    };
    match {
        case var36 =>
        var438[0]
        case _ =>
        var438[3]
    }
}

external func func480(namedParam481 ! : Option<Bool>, namedParam482 ! : Range<Int32>, namedParam483 ! : List<Int64>, namedParam484 ! : Interface108) : Int16 { // block id: 485
    Int32(match {
        case if (false) { false } else { var36 }  =>
        [true, var36, var36, var36, false];
        var70
        case _ =>
        var70
    });
    Result<Int8>.Err(Exception());
    let var520 : Aggregate516<UInt8, Range<Int16>, Enum13<UInt16, List<Bool>, Float64>> = Aggregate516<UInt8, Range<Int16>, Enum13<UInt16, List<Bool>, Float64>>();
    match {
        case false =>
        [(), (), (), (), ()][3];
        if (false) { var236 } else { Int16(-42) }
        case _ =>
        var520.var523
    }
}

external record Aggregate516<T0, T1, T2> where T0 <: UInt8, T1 <: Range<Int16>, T2 <: Enum13<UInt16, List<Bool>, Float64> {
    public init() { // block id: 518

    }
;
    let var523 : Int16 = Int16(-17)
}

external func func623(namedParam624 ! : Int32, optionalParam625 ! : Range<Int16> = (Int16(Float64(Int8(40.0)))..Int16(UInt32(134)):((-41)|1)), namedParam634 ! : Int8) : Bool { // block id: 635
    var var657 : Int64 = Int64(UInt64(141));
    match ([var641, Aggregate516<UInt8, Range<Int16>, Enum13<UInt16, List<Bool>, Float64>>(), Aggregate516<UInt8, Range<Int16>, Enum13<UInt16, List<Bool>, Float64>>(), Aggregate516<UInt8, Range<Int16>, Enum13<UInt16, List<Bool>, Float64>>(), var641][2]) {
        case caseVar650 : List<Bool> =>
            var36;
            (UInt32(21)..UInt32(85):(var657|1));
            var36

        case _ =>
            true

    }
}



external enum Enum771<T0, T1, T2> {
    defaultValue
}

extend Class107 {

}

extend Aggregate516<T0, T1, T2> where T0 <: UInt8, T1 <: Range<Int16>, T2 <: Enum13<UInt16, List<Bool>, Float64> {

}