// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex is used before initialization

// random seed:1629702573623

// All global variable need to be defined before use!
external var var13 : Unit = ()
external let var21 : Class16 = Class16()
external let var39 : Int8 = Int8(UInt32(UInt8(Float32(Int32(69)))))
external let var51 : UInt16 = UInt16(Int8(UInt16(Int8(UInt64(70)))))
internal let var58 : Option<Int8> = (Int8(12) as Int8)
internal let var159 : UInt8 = UInt8(192)
internal var var166 : (Range<UInt8>*Range<UInt8>*Interface17*Int8*List<Int64>) = ((UInt8(84)..=UInt8(112):121|1), (UInt8(11.0)..UInt8(98):(Int64(Int16(18))|1)), Class16(), Int8(77), [28, (-110), (-14), (-27), 8])
external let var182 : Range<UInt8> = (UInt8(165)..UInt8(28):63|1)
internal var var197 : Bool = (() is UInt64)
external let var260 : Interface17 = Class16()
internal var var280 : Bool = (true is Range<UInt8>)
internal let var306 : List<Unit> = [(), (), (), (), ()]
external let var325 : Result<Bool> = Result<Bool>.Ok(var197)
external let var390 : Char = '3'
external var var470 : List<Int64> = [Int64(UInt16(68)), Int64(Int64(UInt32(186))), Int64(UInt8(UInt64(112))), Int64(UInt16(UInt8(143))), (-48)]
external let var500 : Range<UInt32> = (UInt32(53)..=UInt32(203):(-126)|1)
internal var var599 : Bool = false
internal let var604 : List<Bool> = [false, false, true, true, false]
external let var675 : Int64 = 6
external let var714 : (Int32*Int32*Int64) = (Int32(-15), Int32(34), Int64(37.0))
func main(): Int64 {
    (var21.var24 ?? try { // block id: 28
        var13;
        ();
        var13
    } finally { // block id: 32

    });
    (match (Option<Int8>.None) {
        case _ : Class16 => 
            var51;
            var58
        
        case _ : Int16 => 
            var58
        
        case _ => 
            UInt8(187);
            var13;
            Option<Int8>.None
        
        case _ => 
            var58;
            var58
        
    } ?? Int8(UInt64(183)));
    var var81 : Interface17 = Class16();
    if (true) { (var81.func84('o')) } else { var714[2] } 
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

external open class Class16 <: Interface17 {
    public init() { // block id: 19

    }
;
    let var24 : Result<Unit> = Result<Unit>.Ok(var13);
    public let var203 : Result<Bool> = Result<Bool>.Ok(var197);
    public static let var273 : Bool = ([30, (-123), (-55), 8, (-124)] is Class16);
    var var408 : ((List<Int64>*String)*Unit*UInt8*List<Int64>) = (([(-59), (-80), 95, 81, 35], "'F{ vR[)by"), (), UInt8(192), [(-86), Int64(Int16(-43)), Int64(Int64(Int32(-124))), (-121), (-52)]);
    public static var var619 : Range<Int64> = ((-39)..=(-18):93|1)
}

external interface Interface17 {
    func func263(param264 : List<Bool>, param265 : Range<Int64>, param266 : Float32) : Unit { // block id: 267
        let var287 : String = "Lw4[8d ;uj";
        var var290 : Range<UInt64> = (UInt64(14)..UInt64(117):(-128)|1);
        var var294 : Int16 = Int16(-94);
        var loopTimeVar332 : Int64 = 0;
        if ((if ((Class16.var273)) { (if (var197) { var197 } else { var280 } ) } else { (var287, var290, var197, var294, ((-13)..=(-77):117|1))[2] } )) { (Option<List<Unit>>.Some(var306) ?? [var13, var13, var13, var13, ()])[0] } else { do {
            loopTimeVar332++;

        } while ((var325 ?? false) && loopTimeVar332 < 100 )  } ;
        let var343 : List<(List<Int64>*String)> = [([58, Int64(UInt8(54)), (-53), Int64(UInt32(60)), Int64(84.0)], ">]-G-G/uU1"), ([Int64(Int8(-65)), Int64(Int32(22)), 89, Int64(UInt32(94)), Int64(UInt32(155))], "k$Oik\\03Uk"), ([105, 28, (-22), (-84), 2], "T5_VM*x5V@"), ([17, (-83), (-81), 9, (-8)], "l4zw%$',EU"), ([(-47), 35, (-109), 79, 35], "&a,f9e>Vhv")];
        match (Result<Unit>.Ok(var13)) {
            case _ => 
                var343
            
        }[1][1];
        var loopTimeVar585 : Int64 = 0;
        var loopTimeVar596 : Int64 = 0;
        if (if (var197) { // block id: 383
            Result<Unit>.Ok(var13);
            ();
            param264
        } else if (false) { // block id: 388
            var390;
            var var393 : List<Bool> = [false, false, true, false, true];
            var393
        } else { // block id: 395
            [false, var197, var280, false, var197]
        }[0]) { var21.var408[1] } else { (if (func427()) { while (true && loopTimeVar585 < 100 ) {
            loopTimeVar585++;

        } } else { while (false && loopTimeVar596 < 100 ) {
            loopTimeVar596++;
            (var287, var290, var197, var294, (126..(-42):(-39)|1))
        } } ) } 
    }
;
    func func185(namedParam186 ! : (Unit*UInt8), namedParam187 ! : Int64, namedParam188 ! : String) : Bool { // block id: 189
        let var210 : Int32 = Int32(122);
        let var222 : Range<Int32> = (Int32(90)..Int32(Float32(Float32(31.0))):(Int64(13.0)|1));
        if ((var21.var203 ?? ((Int32(107)..=var210:(namedParam187|1)) is Float64))) { if (try { // block id: 215
            var197
        } finally { // block id: 217
            var197
        }) { // block id: 219
            ();
            var222;
            ()
        } else if ([false, true, true, false, false][2]) { // block id: 240
            var var242 : Unit = ();
            var242;
            var13;
            ()
        } } else { (if (var197) { // block id: 249
            ();
            Result<Unit>.Err(Exception())
        } else { // block id: 252
            Result<Unit>.Ok(var13)
        } ?? if (false) { var13 } else { var13 } ) } ;
        var var628 : ((List<Int64>*String)*Unit*UInt8*List<Int64>) = (([(-27), (-25), 6, 95, 53], "!9FFwTjgyM"), (), UInt8(33), [55, (-86), (-18), 55, 93]);
        var var650 : Float32 = Float32(-82.0);
        var260.func263(match {
            case var599 => 
            ();
            var604
            case true => 
            [false, var280, var280, false, var599]
            case _ => 
            var604
        }, Class16.var619, match (Result<Unit>.Err(Exception())) {
            case caseVar625 : Range<Int8> => 
                var628;
                var13;
                var var638 : Float32 = Float32(-112.0);
                var638
            
            case _ => 
                var13;
                [true, true, false, var197, var599];
                var650
            
        });
        [true, false, false, false, true][2]
    }
;
    func func84(param85 : Char) : Int64 { // block id: 86
        var var101 : List<Int64> = [57, (-50), Int64(UInt8(234)), 30, (-110)];
        let var133 : (Unit*UInt8) = ((), UInt8(UInt16(31)));
        let var163 : Int64 = (-74);
        func func112<T0>(param113 : Range<UInt16>, param114 : List<Int64>, param115 : Range<UInt8>, optionalParam116 ! : Range<Int16> = (Int16(UInt16(Int32(-77)))..Int16(Int8(90)):(Int64(Int8(UInt32(Float32(-103.0))))|1))) : Interface17 { // block id: 127
            if (true) { var133[0] } else { var13 } ;
            let var151 : Interface17 = Class16();
            if (false) { // block id: 144
                var13;
                var13;
                ((UInt8(89)..=UInt8(200):(-114)|1), param115, var151, Int8(-117), [111, 49, (-42), (-58), 113])
            } else { // block id: 155
                var151;
                (var159..=var159:(var163|1));
                var166
            }[2]
        }
;
        if (false) { // block id: 89
            var101[2]
        } else if (func112<List<Unit>>((UInt16(226)..UInt16(192):(-10)|1), var101, var182).func185(namedParam186 : var133, namedParam187 : var163, namedParam188 : "*?I;RgV_uD")) { // block id: 658
            try { // block id: 660
                var13;
                Result<Bool>.Ok(var197);
                var163
            } catch (e: Exception) { // block id: 665
                var163
            } finally { // block id: 667
                var13;
                45
            }
        } else { // block id: 670
            var var681 : Int64 = Int64(UInt64(117));
            match (([var675, var163, 50, (-10), var681], "=a,-3{N$j[")) {
                case _ : Interface17 => 
                    ();
                    var13
                
                case _ => 
                    var var693 : Unit = ();
                    var693
                
            };
            var loopTimeVar698 : Range<UInt64> = (UInt64(UInt32(Int8(Int16(6))))..UInt64(15):(Int64(UInt32(Float32(Int8(34))))|1));
            for (i in loopTimeVar698) if (var280) {

            };
            var163
        }
    }

}




func func427() : Bool { // block id: 428
    let var441 : Int64 = Int64(UInt64(UInt16(108)));
    let var463 : Range<Int16> = (Int16(86)..Int16(-54):64|1);
    let var485 : String = "+>m&^oO)@V";
    match (if (true) { // block id: 432
            Result<Bool>.Ok(var197)
        } else if (if (false) { true } else { var280 } ) { // block id: 438
            (var441..=(-18):(113|1));
            [16, (-127), 66, (-79), var441];
            Result<Bool>.Ok(var197)
        } else { // block id: 455
            let var457 : Result<Bool> = Result<Bool>.Ok(var197);
            var457
        }) {
        case _ => 
            var463
        
        case _ : Result<Bool> => 
            (var470, var485);
            var463
        
        case _ => 
            (Int16(-79)..=Int16(73):(-53)|1)
        
    };
    let var514 : Range<UInt64> = (UInt64(103)..=UInt64(137):(-21)|1);
    let var522 : Bool = false;
    try { // block id: 492
        throw Exception()
    } catch (_) { // block id: 494
        ();
        var loopTimeVar502 : Range<UInt64> = (UInt64(31)..=UInt64(Int32(UInt64(Int16(113)))):((-111)|1));
        for (i in loopTimeVar502) if (true) {
            var500
        };
        ((var485, var514, var280, Int16(-67), ((-89)..=103:(-1)|1)) is Option<List<Unit>>)
    } finally { // block id: 519
        var loopTimeVar525 : Range<UInt64> = (UInt64(UInt8(199))..UInt64(27):(Int64((-118))|1));
        for (i in loopTimeVar525) if (var522) {

        };
        (Result<Bool>.Err(Exception()) ?? var522)
    };
    try { // block id: 541
        var var554 : String = "W<B#5z\\Y`V";
        if (false) { // block id: 544
            var var547 : Unit = ();
            (var547, var159)
        } else { // block id: 550
            (var470, var554);
            var21;
            ((), UInt8(250))
        };
        if (false) { // block id: 562
            UInt8(87)
        } else if (var197) { // block id: 565
            UInt8(24)
        } else { // block id: 567
            var13;
            UInt8(87)
        };
        [true, false, false, var280, var522][1]
    } finally { // block id: 578
        (var390 is List<Int64>)
    }
}


extend Class16 {

}


/*
return code: 139
*/
