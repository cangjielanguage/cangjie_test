// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex Error VirtualMachineError StackOverflowError

// random seed:1627638409742

// All global variable need to be defined before use!
external let var14 : Unit = ()
external let var38 : UInt8 = UInt8(22)
external var var43 : Char = '4'
external let var68 : (Unit*UInt64) = ((), UInt64(178))
external let var78 : Option<(Unit*UInt64)> = Option<(Unit*UInt64)>.Some(var68)
external let var115 : Bool = false
external let var163 : (Float32*UInt8) = (Float32(-31.0), UInt8(6))
external let var179 : UInt32 = UInt32(99)
external var var197 : Class191 = Class191()
external let var233 : Int32 = Int32(28)
external let var281 : Int16 = Int16(-9)
external let var300 : Interface192 = Class191(namedParam266 : UInt32(107), namedParam267 : UInt8(39), optionalParam268 : UInt16(176), namedParam270 : ((false is Option<(Float32*UInt8)>) is Int32))
external var var319 : Bool = true
internal let var323 : Class191 = Class191(namedParam266 : UInt32(170), namedParam267 : UInt8(134), namedParam270 : false)
internal let var348 : Option<(Float32*UInt8)> = Option<(Float32*UInt8)>.None
external var var353 : Option<Option<(Float32*UInt8)>> = (Option<Option<(Float32*UInt8)>>.None as Option<(Float32*UInt8)>)
external let var369 : Unit = ()
internal let var396 : (Option<(Float32*UInt8)>*Float64*Int32) = (((Option<(Float32*UInt8)>.None as (Float32*UInt8)) as (Float32*UInt8)), 18.0, Int32(-107))
external var var411 : Int64 = 33
internal var var419 : Option<Int64> = Option<Int64>.None
internal var var422 : Option<Option<Int64>> = (Option<Option<Int64>>.None as Option<Int64>)
external let var535 : ((Float32*UInt8)*Bool*Char) = ((Float32(65.0), UInt8(5)), (false is Option<Option<(Float32*UInt8)>>), 'w')
external let var548 : Float64 = (-106.0)
external let var554 : Option<Bool> = (Option<Bool>.Some(var115) as Bool)
internal var var635 : Option<Bool> = ((Option<Bool>.None as Bool) as Bool)
external var var640 : Bool = false
func main(): Int64 {
    let var17 : Bool = false;
    var var668 : UInt16 = UInt16(124);
    if (if (false) { // block id: 9
        true
    } else { // block id: 11
        ();
        var14;
        var17
    }) { // block id: 19
        ();
        var14;
        var14
    } else if (func24(namedParam25 : var668, namedParam26 : ())) { // block id: 671
        ();
        ()
    };
    var411
    // CRC Check All Variables
    var crccheck = CrcCheck(5000, 32)
    crccheck.updateBuffer(UInt64(var668), 64)
    crccheck.updateBuffer(UInt64(var38), 64)
    crccheck.updateBuffer(UInt64(var281), 64)
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
external func func24(namedParam25 ! : UInt16, namedParam26 ! : Unit) : Bool { // block id: 27
    let var33 : Bool = ((true is UInt64) is UInt32);
    let var49 : Float32 = Float32(-27.0);
    (if (var33) { var38 } else { UInt8(238) } , (), var43, (var49, UInt8(152))[0])[1];
    var var654 : Option<Interface192> = (((Option<Interface192>.Some(var300) as Interface192) as Interface192) as Interface192);
    if ((if (func57(var49)) { if (var115) { // block id: 628
        false
    } else if (false) { // block id: 631
        var319
    } else { // block id: 633
        var635;
        var640
    } } else { var319 } )) { ((false is (UInt64*(UInt8*Unit*Char*Float32))) is Option<Int64>) } else { match ((var654 ?? var300)) {
        case _ =>
            true

    } }
}

external func func57(param58 : Float32) : Bool { // block id: 59
    ((Option<Option<(Unit*UInt64)>>.None ?? var78) ?? (Option<(Unit*UInt64)>.Some(var68) ?? var68))[0];
    let var561 : (UInt64*(UInt8*Unit*Char*Float32)) = (UInt64(174), (UInt8(46), (), 'g', Float32(60.0)));
    func func92() : Unit { // block id: 93
        var var100 : Aggregate96 = Aggregate96();
        if ((var100.func103(var411, var548, var43))) { (if ((var554 ?? var319)) { var561[0] } else { match ((param58, UInt8(63))) {
            case caseVar576 =>
                var179;
                UInt64(72)

            case _ =>
                ();
                var100;
                UInt64(240)

            case _ =>
                var369;
                UInt64(106)

        } } ) } else { UInt64(226) } ;
        var14;
        (Option<Unit>.Some(var369) ?? var369)
    }
;
    func92();
    if (false) { match {
        case var319 =>
        true
        case _ =>
        var68;
        var14;
        var115
    } } else { if ((var319 is Option<(Unit*UInt64)>)) { // block id: 614
        Float32(-69.0);
        var369;
        var319
    } else if (var319) { // block id: 619
        ();
        var369;
        false
    } else { // block id: 623
        false
    } }
}




external record Aggregate96 {
    public init() { // block id: 98

    }
;
    public mut func func103(param104 : Int64, param105 : Float64, param106 : Char) : Bool { // block id: 107
        var loopTimeVar525 : Int64 = 0;
        while ((func118() ?? (true is UInt32)) && loopTimeVar525 < 100 ) {
            loopTimeVar525++;
            var14
        };
        (match {
            case var319 =>
            Int16(-101);
            ();
            var535
            case _ =>
            var535
        }[1] is Option<Option<(Unit*UInt64)>>)
    }

}


external func func118() : Option<Bool> { // block id: 119
    var var168 : UInt32 = UInt32(28);
    var var184 : Option<Option<(Unit*UInt64)>> = Option<Option<(Unit*UInt64)>>.None;
    match (if (match (Option<(Unit*UInt64)>.None) {
            case _ : Option<Option<(Unit*UInt64)>> =>
                ();
                UInt32(218);
                false

            case caseVar132 : Int16 =>
                var115

            case _ : Float32 =>
                var115

            case _ =>
                'i';
                ();
                var115

        }) { // block id: 146
            var14;
            ();
            let var150 : UInt32 = UInt32(57);
            var150
        } else if (if (true) { // block id: 154
            var14;
            true
        } else { // block id: 157
            false
        }) { // block id: 159
            Option<Option<(Unit*UInt64)>>.Some(var78);
            var163;
            var168
        } else { // block id: 170
            (Float32(-118.0), UInt8(196));
            var14;
            var168
        }) {
        case 214 | 215 | $var179 | 191 =>
            var184

        case _ =>
            Option<Option<(Unit*UInt64)>>.None

    };
    Option<Bool>.Some(var115)
}

external open class Class191 <: Interface192 & Interface193<Int32> {
    public init() { // block id: 195

    }
;
    public var var228 : Interface193<Int32> = Class191();
    public init(namedParam266 ! : UInt32, namedParam267 ! : UInt8, optionalParam268 ! : UInt16 = UInt16(238), namedParam270 ! : Bool) { // block id: 271
        Class191()
    }
;
    public var var329 : Option<Bool> = Option<Bool>.None;
    private var var428 : Option<Bool> = (((Option<Bool>.Some(var115) as Bool) as Bool) as Bool);
    protected let var459 : Option<Option<(Unit*UInt64)>> = (Option<Option<(Unit*UInt64)>>.None as Option<(Unit*UInt64)>);
    open func func200() : Bool { // block id: 201
        var var214 : Int32 = Int32(71);
        match (match (var163) {
                case _ : Int16 =>
                    Int32(-3)

                case caseVar211 =>
                    var214

                case _ : Float64 =>
                    var14;
                    Int32(-12)

                case _ =>
                    Int32(-107)

            }) {
            case _ : UInt32 =>
                var228

            case $var233 | -26 | $var233 | $var233 =>
                var14;
                var228

            case -20 =>
                var14;
                ();
                var228

            case _ : Int32 =>
                ();
                (-41.0);
                var228

            case _ =>
                var163;
                ();
                Class191()

        };
        func259(namedParam260 : (var228.func292() ?? var163), optionalParam261 : ((var422 ?? Option<Int64>.None) ?? match (var428) {
            case caseVar435 =>
                UInt16(190);
                var369;
                36

            case caseVar442 =>
                ();
                (-119)

            case caseVar448 =>
                var14;
                var369;
                var411

            case caseVar455 : Unit =>
                var459;
                ();
                (-87)

            case _ =>
                (-23.0);
                'K';
                var411

        }));
        var var512 : Float32 = Float32(16.0);
        match {
            case true =>
            if (var115) { // block id: 474
                true
            } else { // block id: 476
                Class191();
                var14;
                false
            }
            case var115 =>
            if (true) { // block id: 484
                var163
            } else { // block id: 486
                UInt16(7);
                (Float32(-48.0), var38)
            };
            var loopTimeVar496 : Int64 = 0;
            do {
                loopTimeVar496++;
                ()
            } while (var319 && loopTimeVar496 < 100 ) ;
            match (Int32(-5)) {
                case _ =>
                    var115

            }
            case _ =>
            match {
                case var115 =>
                26.0;
                ();
                var281
                case var115 =>
                var512;
                Int8(-4);
                Int16(-29)
                case _ =>
                Int16(9)
            };
            (var115 is Option<(Unit*UInt64)>)
        }
    }

}

external interface Interface192 {
    func func309(param310 : Int32) : (Option<(Float32*UInt8)>*Float64*Int32) { // block id: 311
        var loopTimeVar340 : Int64 = 0;
        do {
            loopTimeVar340++;
            var loopTimeVar338 : Int64 = 0;
            do {
                loopTimeVar338++;
                'z'
            } while (var115 && loopTimeVar338 < 100 )
        } while ((var323.var329 ?? var319) && loopTimeVar340 < 100 ) ;
        ((if (true) { var353 } else { var353 }  ?? if (var319) { // block id: 359
            Float32(18.0);
            var14;
            Option<(Float32*UInt8)>.Some(var163)
        } else if (true) { // block id: 364
            (var14, UInt64(158));
            var369;
            Option<(Float32*UInt8)>.Some(var163)
        } else { // block id: 373
            let var375 : (UInt8*Unit*Char*Float32) = (UInt8(241), (), 'E', Float32(-56.0));
            var375;
            var var382 : Option<(Unit*UInt64)> = ((Option<(Unit*UInt64)>.None as (Unit*UInt64)) as (Unit*UInt64));
            var382;
            var348
        }), (var348, 126.0, Int32(77))[1], param310)
    }
;
    func func200() : Bool

}

external interface Interface193<T1> {
    func func292() : Option<(Float32*UInt8)> { // block id: 293
        if (true) { (var300.func309(var233)) } else { var396 } [0]
    }
;
    func func200() : Bool

}

external func func259(namedParam260 ! : (Float32*UInt8), optionalParam261 ! : Int64 = (-52), optionalParam263 ! : Class191 = Class191(namedParam266 : UInt32(120), namedParam267 : UInt8(1), optionalParam268 : UInt16(13), namedParam270 : true), optionalParam277 ! : Unit = ()) : Int16 { // block id: 279
    var281
}









/*
return code: 139
*/
