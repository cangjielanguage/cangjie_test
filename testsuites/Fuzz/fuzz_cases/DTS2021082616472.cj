// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

// random seed:1629705830679

// All global variable need to be defined before use!
external var var8 : Unit = ()
external var var17 : Bool = true
external var var21 : Bool = true
external let var25 : Int8 = Int8(104)
external var var31 : UInt32 = UInt32(101)
external let var59 : Bool = false
external var var142 : List<Int16> = [Int16(-108), Int16(-73), Int16(-54), Int16(-19), Int16(26)]
internal let var151 : Unit = ()
external var var154 : Result<Unit> = Result<Unit>.Ok(var151)
external var var164 : Unit = ()
internal var var176 : Interface74<Int16, List<Bool>, Int16> = Class73<List<List<Int64>>, Range<Int64>, Int64>()
external var var181 : List<Result<Interface74<Int16, List<Bool>, Int16>>> = [Result<Interface74<Int16, List<Bool>, Int16>>.Err(Exception()), Result<Interface74<Int16, List<Bool>, Int16>>.Ok(var176), Result<Interface74<Int16, List<Bool>, Int16>>.Err(Exception()), Result<Interface74<Int16, List<Bool>, Int16>>.Ok(var176), Result<Interface74<Int16, List<Bool>, Int16>>.Err(Exception())]
internal let var209 : (Int8*List<List<Int64>>) = (Int8(-85), [[(-2), (-5), (-124), 37, 78], [99, 16, (-56), (-122), 102], [93, 9, 34, 52, (-88)], [24, (-60), 109, 78, 67], [91, 66, (-78), 90, 35]])
external var var219 : Int64 = Int64(Int8(116))
external var var237 : Range<Int16> = (Int16(Float32(Int32(-30)))..=Int16(UInt16(72)):((-84)|1))
external let var258 : Int64 = Int64(UInt64(UInt8(Float32(-125.0))))
external var var269 : Option<Int64> = Option<Int64>.None
external var var291 : List<Int64> = [Int64(Int64(Int8(-89))), 35, 59, (-87), (-96)]
external let var314 : Int16 = Int16(51)
external let var368 : List<Unit> = [(), (), (), (), ()]
external let var398 : Int64 = (-72)
internal var var450 : (Option<Int64>*Int8) = (Option<Int64>.None, Int8(Int32(8)))
external let var473 : Range<UInt8> = (UInt8((-8.0))..=UInt8(238):(90|1))
external let var531 : Char = 'Y'
internal let var541 : Result<Unit> = Result<Unit>.Err(Exception())
func main(): Int64 {
    var8;
    let var34 : Unit = ();
    if ((Result<Bool>.Err(Exception()) ?? var21)) { match (var25) {
        case _ => 
            var31;
            var34;
            var34
        
        case _ => 
            var34
        
        case caseVar43 => 
            39.0;
            var34;
            var8
        
        case _ => 
            var25;
            UInt8(74);
            ()
        
    } } else { if (false) { // block id: 55
        var8;
        ()
    } else if (var59) { // block id: 61
        ();
        var34
    } } ;
    func func66(param67 : Unit, param68 : Float32) : Bool { // block id: 69
        UInt64(108);
        (-40.0);
        let var604 : Int32 = Int32(-43);
        Class73<List<List<Int64>>, Range<Int64>, Int64>.func80<Char, Result<Unit>>(namedParam81 : if (var59) { var604 } else { var604 } )
    }
;
    let var609 : Float32 = Float32(Int64(Int64(UInt64(UInt64(17)))));
    if (func66(var8, var609)) { (var269 ?? var219) } else { ((), (-7))[1] } 
    // CRC Check All Variables
    var crccheck = CrcCheck(5000, 32)
    crccheck.updateBuffer(UInt64(var219), 64)
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

internal open class Class73<T0, T1, T2> <: Interface74<Int16, List<Bool>, Int16> & Interface75 where T0 <: List<List<Int64>>, T1 <: Range<Int64>, T2 <: Int64 {
    public init() { // block id: 77

    }
;
    var var229 : UInt64 = UInt64(UInt64(Int8(Int8(-7))));
    static let var424 : Interface75 = Class73<List<List<Int64>>, Range<Int64>, Int64>();
    static var var469 : UInt16 = UInt16(2);
    static var var480 : List<Bool> = [(Int16(55) is List<Unit>), (Float64(Int32(-4)) is List<Result<Interface74<Int16, List<Bool>, Int16>>>), (((-88)..=(-23):(-44)|1) is List<Int64>), ((Int8(Int16(109)), [[70, 40, 103, 89, 100], [(-80), (-69), (-42), 78, 24], [14, 112, 53, (-45), 6], [(-116), 33, (-89), 88, (-106)], [(-114), 11, 61, (-19), (-56)]]) is Unit), false];
    public static var var496 : List<List<Int64>> = [[(-34), (-70), 42, 46, 66], [32, (-100), (-117), 110, (-9)], [(-20), (-125), 126, (-66), (-77)], [102, (-128), 84, (-100), 57], [Int64(Int16(51)), Int64((-55)), Int64(Int16(93)), (-102), Int64(UInt8(UInt8(251)))]]
}

external interface Interface74<T0, T1, T2> where T0 <: Int16, T1 <: List<Bool>, T2 <: Int16 {
    static func func102<T0>(namedParam103 ! : Int16) : List<Unit> { // block id: 104
        let var226 : Class73<List<List<Int64>>, Range<Int64>, Int64> = Class73<List<List<Int64>>, Range<Int64>, Int64>();
        func func118<T0, T1>(param119 : Interface75) : List<Int64> { // block id: 120
            func124(optionalParam125 : var226.var229, optionalParam130 : if (var59) { var237 } else { (namedParam103..Int16(-72):(25|1)) } )[2]
        }
;
        if (([(), (), (), (), ()][2] is UInt16)) { func118<Range<Int16>, Int64>(Class73<List<List<Int64>>, Range<Int64>, Int64>())[3] } else { ([Option<Int64>.None, Option<Int64>.None, var269, Option<Int64>.Some(var258), Option<Int64>.None][3] ?? var219) } ;
        let var320 : List<List<Int64>> = [[46, 100, 5, 94, 122], [(-85), 97, 75, 90, (-27)], [42, (-98), (-99), 81, (-92)], [126, 107, 111, (-26), (-60)], [(-80), 20, 51, (-28), (-60)]];
        let var337 : Int64 = Int64(UInt8(Int32(Float64(UInt32(177)))));
        match (if ([false, false, true, false, true][4]) { (if (var59) { [[75, 45, 51, (-59), (-121)], [(-38), 7, 48, 111, (-16)], [66, 30, (-53), 87, (-31)], [123, 16, 105, 37, 29], [39, (-49), 92, (-60), (-49)]] } else { [[var219, 82, var219, 98, var219], var291, [var219, var219, 123, (-26), 71], [9, 105, 39, 101, (-62)], var291] } ) } else { try { // block id: 309
                [Int16(68), Int16(21), var314, var314, Int16(-55)];
                var8;
                var320
            } catch (_) { // block id: 322
                ();
                true;
                [[22, 25, 70, 10, 5], var291, var291, [var219, (-2), var219, var219, (-13)], [var337, var337, var219, 4, (-42)]]
            } finally { // block id: 347
                [[36, var337, var219, 124, (-90)], [92, (-58), (-115), 67, 20], [(-27), (-52), 76, (-3), 36], [var219, (-69), 86, var337, (-70)], var291]
            } } ) {
            case _ => 
                var368
            
            case _ => 
                [(), (), var164, var8, ()]
            
            case caseVar386 => 
                var368
            
            case _ => 
                [var291, [(-103), 66, (-13), (-25), 40], [(-80), (-89), 5, 61, 7], [var398, var398, (-45), var398, var337], [(-86), var337, var398, var398, 4]];
                ();
                var368
            
            case _ => 
                ();
                UInt8(22);
                [(), (), (), (), ()]
            
        }
    }

}

external interface Interface75 {
    func func427(namedParam428 ! : Range<UInt16>, namedParam429 ! : Range<UInt8>, namedParam430 ! : List<Bool>, namedParam431 ! : List<List<Int64>>) : Bool { // block id: 432
        if (match (UInt32(52)) {
            case 110 => 
                var17
            
            case _ => 
                (UInt16(157)..=UInt16(79):(-6)|1);
                ();
                true
            
        }) { match (var450[0]) {
            case _ => 
                ();
                var8;
                false
            
        } } else { ([(Int8(97)..=Int8(-44):46|1), (Int8(104)..=Int8(-74):94|1), (Int8(50)..Int8(40):(-33)|1), (Int8(-28)..=Int8(-108):(-25)|1), (Int8(-62)..=Int8(38):9|1)][4] is Float64) } 
    }

}

internal func func124(optionalParam125 ! : UInt64 = UInt64((-58.0)), optionalParam128 ! : Interface75 = Class73<List<List<Int64>>, Range<Int64>, Int64>(), optionalParam130 ! : Range<Int16> = (Int16(-91)..Int16(Int8(41)):(66|1))) : List<List<Int64>> { // block id: 136
    try { // block id: 138
        var142[1];
        var154.getOrThrow()
    } finally { // block id: 157
        Int16(UInt8(66));
        [var151, var164, (), var164, var8][0]
    };
    (var181[2] ?? try { // block id: 190
        Class73<List<List<Int64>>, Range<Int64>, Int64>()
    } finally { // block id: 192
        var151;
        var176
    });
    if ([var21, true, var59, true, var59][3]) { // block id: 207
        var209
    } else { // block id: 213
        ();
        (Int8(55)..=var25:(var219|1));
        var209
    }[1]
}





extend Class73<T0, T1, T2> where T0 <: List<List<Int64>>, T1 <: Range<Int64>, T2 <: Int64 {
    static func func80<T0, T1>(namedParam81 ! : Int32) : Bool { // block id: 82
        if (match {
            case false => 
            var8;
            false
            case _ => 
            false
        }) { func102<UInt16>(namedParam103 : var314) } else { [(), (), (), (), ()] } [3];
        var loopTimeVar521 : Range<UInt64> = (UInt64(Int32(22))..UInt64(UInt32(171)):(13|1));
        for (i in loopTimeVar521) if (if (var424.func427(namedParam428 : (UInt16(20)..var469:(var219|1)), namedParam429 : var473, namedParam430 : var480, namedParam431 : var496)) { // block id: 513
            var469;
            true
        } else { // block id: 516
            ();
            var25;
            var59
        }) {

        };
        let var562 : Result<Unit> = Result<Unit>.Err(Exception());
        var var583 : Unit = ();
        if ((var531 is UInt8)) { // block id: 533
            (var541 ?? ());
            if (false) { var59 } else { false } 
        } else if (match {
            case true => 
            true
            case _ => 
            (Int32(95)..namedParam81:(var398|1));
            UInt8(111);
            var59
        }) { // block id: 559
            match (var562) {
                case caseVar566 : Interface75 => 
                    var151;
                    Class73<List<List<Int64>>, Range<Int64>, Int64>();
                    ()
                
                case caseVar573 : List<Unit> => 
                    (Int8(-39)..=Int8(-72):46|1);
                    [Int16(20), Int16(-28), Int16(7), Int16(-28), Int16(-73)];
                    var164
                
                case caseVar580 : Range<Int32> => 
                    var583
                
                case _ => 
                    ();
                    var151
                
            };
            if (true) { // block id: 591
                var176;
                ();
                true
            } else { // block id: 595
                ();
                Int32(91);
                var21
            }
        } else { // block id: 599
            var21
        }
    }

}


/*
return code: 139
*/
