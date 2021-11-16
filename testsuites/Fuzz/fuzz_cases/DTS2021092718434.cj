// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-0: %run %run_opt %output %run_args

// random seed:1631112594958

// All global variable need to be defined before use!
internal let var16 : Unit = ()
external var var72 : Int64 = 86
external let var107 : Int16 = Int16(UInt64(180))
external let var208 : Class86 = Class86()
external let var224 : Option<Unit> = ((UInt32(203)..=UInt32(UInt16(Float32(-3.0))):((-48)|1)) as Unit)
external let var233 : Option<Option<Unit>> = (UInt8(UInt8(186)) as Option<Unit>)
external let var408 : Bool = ((UInt64(207)..=UInt64(Float64(UInt32(14))):((-64)|1)) is String)
external var var436 : Float64 = Float64(Int8(UInt16(40)))
external let var517 : (Unit*Range<UInt32>) = ((), (UInt32(8)..UInt32(92):(Int64(Int32(-95))|1)))
external let var548 : UInt32 = UInt32(UInt8(119))
internal var var559 : Unit = ()
external let var568 : Range<UInt16> = (UInt16(32)..=UInt16(97):116|1)
internal let var572 : Range<UInt8> = (UInt8(202)..UInt8(164):78|1)
external var var592 : Result<Bool> = Result<Bool>.Err(Exception())
external var var608 : (Float32*Char*Float32) = (Float32(61.0), 'O', Float32(UInt8(226)))
internal var var664 : Unit = ()
internal var var685 : UInt8 = UInt8(Int16(UInt8(131)))
internal let var736 : Float32 = Float32(UInt32(166))
external var var746 : Result<Float32> = Result<Float32>.Err(Exception())
func main(): Int64 {
    var var9 : (Bool*UInt64) = (false, UInt64(UInt8(9)));
    var loopTimeVar22 : Int64 = 0;
    if (var9[0]) { var16 } else { do {
        loopTimeVar22++;

    } while (false && loopTimeVar22 < 100 )  } ;
    let var35 : (Bool*UInt64) = ((Float32(-68.0) is UInt8), UInt64(Int8(49)));
    let var46 : Result<Unit> = Result<Unit>.Ok(var16);
    let var76 : Int32 = Int32(UInt16(158));
    let var280 : UInt64 = UInt64(UInt32((-91.0)));
    func func305<T0>(optionalParam306 ! : () -> Float32 = {  => Float32(71.0) }, namedParam312 ! : Char, namedParam313 ! : Char, namedParam314 ! : UInt32) : Unit where T0 <: List<Bool> { // block id: 315
        var var324 : Aggregate320 = Aggregate320();
        (var324.var327, func330())[0];
        ();
        Class86.var621
    }
;
    let var668 : (UInt32*UInt32*Int64*String) = (UInt32(104), UInt32(143), Int64(UInt16(93)), """
d~(z_bD0J_
6~$ZJ/8Fjh
""");
    func func24() : Float32 { // block id: 25
        let var59 : Aggregate55 = Aggregate55();
        (if (var35[0]) { Result<Unit>.Ok(var16) } else { match (var46) {
            case _ => 
                ();
                ();
                var46
            
        } }  ?? var59.func62(namedParam63 : var72, optionalParam64 : 41.0, namedParam66 : var76));
        func func285<T0>(param286 : Range<UInt8>, optionalParam287 ! : UInt8 = UInt8(23), namedParam289 ! : UInt8, namedParam290 ! : List<Unit>) : Unit where T0 <: String { // block id: 291
            Class86.var295;
            ();
            var var629 : () -> Float32 = func24;
            var var632 : Char = '9';
            func305<List<Bool>>(optionalParam306 : var629, namedParam312 : var632, namedParam313 : if (var408) { // block id: 638
                var436;
                ['B', var632, 'A', '1', var632, var632, var632, var632, var632, var632]
            } else if (var408) { // block id: 652
                ['E', 'T', 'H', 'X', 'f', 'Q', 'I', 'R', 'e', 'v']
            } else { // block id: 654
                ();
                ['8', 'I', 'I', 'r', 'x', 'n', 'N', 'D', 'l', 'g']
            }[9], namedParam314 : if (var408) { // block id: 662
                var664;
                UInt8(13);
                var668
            } else { // block id: 675
                var668
            }[1])
        }
;
        var var690 : Option<UInt8> = Option<UInt8>.Some(var685);
        (Class86.func91(namedParam92 : true, optionalParam93 : UInt32(174), namedParam96 : var280) ?? func285<String>(var572, optionalParam287 : (var690 ?? var685), namedParam289 : try { // block id: 694
            var685
        } catch (e: Exception) { // block id: 696
            ();
            ();
            var685
        } finally { // block id: 700
            var559;
            var685
        }, namedParam290 : Class86.var706));
        var var725 : Aggregate721 = Aggregate721();
        try { // block id: 719
            var725.var728;
            Result<Float32>.Ok(var736).getOrThrow()
        } catch (e: Exception) { // block id: 741
            var loopTimeVar750 : Int64 = 0;
            do {
                loopTimeVar750++;
                var746;
                var16
            } while (var408 && loopTimeVar750 < 100 ) ;
            Float32(UInt64(203))
        }
    }
;
    func24();
    if (if (var408) { true } else { false } ) { // block id: 758
        var72
    } else { // block id: 760
        var72
    }
    // CRC Check All Variables
    var crccheck = CrcCheck(5000, 32)
    crccheck.updateBuffer(UInt64(loopTimeVar22), 64)
    crccheck.updateBuffer(UInt64(var76), 64)
    crccheck.updateBuffer(UInt64(var280), 64)
    crccheck.updateBuffer(UInt64(var72), 64)
    crccheck.updateBuffer(UInt64(var107), 64)
    crccheck.updateBuffer(UInt64(var548), 64)
    crccheck.updateBuffer(UInt64(var685), 64)
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
        crc_output = Array<Int64>(crc_output_n, { i => 0 })
        buffer = Array<Int64>(buffer_n, { i => 0 })
        poly_n = crc_n + 1
        if (crc_n == 32) {
            poly = Array<Int64>([1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1])
        } else if (crc_n == 16) {
            poly = Array<Int64>([1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1])
        } else if (crc_n == 8) {
            poly = Array<Int64>([1, 0, 0, 0, 0, 0, 1, 1, 1])
        } else {
            poly = Array<Int64>([1, 1, 0, 0, 1])
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
        var byteArray = Array<Int64>(byte_n, { i => 0 })
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
        var crc_buffer = Array<Int64>(crc_output_n, { i => 0 })
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
        crc_output = Array<Int64>(crc_output_n, { i => 0 })
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
        print("\n")
    }
}

external record Aggregate55 {
    public init() { // block id: 57

    }
;
    public func func62(namedParam63 ! : Int64, optionalParam64 ! : Float64 = 115.0, namedParam66 ! : Int32, optionalParam67 ! : Int8 = Int8(Int32(110))) : Unit { // block id: 70

    }

}


external open class Class86 {
    public init() { // block id: 88

    }
;
    public static var var203 : Bool = true;
    public prop let var211 : Unit { // block id: 212
        get() { // block id: 214
            ();
            ()
        }

    };
    public static let var247 : Option<Unit> = Option<Unit>.None;
    static prop let var256 : Result<Unit> { // block id: 257
        get() { // block id: 259
            ();
            ();
            Result<Unit>.Err(Exception())
        }

    };
    static let var295 : Range<Int32> = (Int32(Int64(UInt64(124)))..=Int32(Int8(-97)):((-96)|1));
    public static var var351 : (Bool*Range<UInt16>*Bool*Range<UInt8>*Range<Int64>*Range<UInt32>) = ((((-9)..=(-49):(-78)|1) is Int64), (UInt16(38)..=UInt16(135):67|1), (((Int16(93) as Option<Unit>), Float32(49.0)) is UInt32), (UInt8(103)..UInt8(Int8(UInt16(174))):(Int64(Int32((-40.0)))|1)), (Int64(Int8(100))..Int64(Int16(UInt16(84))):((-119)|1)), (UInt32(224)..UInt32(UInt64(Int32(-80))):(Int64(UInt16(Int16(-58)))|1)));
    var var603 : Int8 = Int8(-32);
    static prop let var621 : Unit { // block id: 622
        get() { // block id: 624
            Class86();
            ();
            ()
        }

    };
    static var var706 : List<Unit> = [(), (), (), (), (), (), (), (), (), ()]
}


external record Aggregate320 {
    public init() { // block id: 322

    }
;
    var var327 : Option<Option<Unit>> = Option<Option<Unit>>.None
}

func func330() : Float32 { // block id: 331
    func330(optionalParam334 : var559, optionalParam336 : ('t' as Option<Unit>), namedParam338 : if ((false, var568, true, var572, (120..(-97):((-25)|1)), (UInt32(46)..UInt32(244):(-44)|1))[2]) { // block id: 580
        let var582 : Result<Unit> = Result<Unit>.Ok(var16);
        var582;
        var233
    } else if ((var592 ?? var408)) { // block id: 595
        var233
    } else { // block id: 597
        Aggregate492<Int16>();
        var233
    }, namedParam339 : var208.var603);
    var608[0]
}

internal func func330(optionalParam334 ! : Unit = (), optionalParam336 ! : Option<Option<Unit>> = Option<Option<Unit>>.Some(var224), namedParam338 ! : Option<Option<Unit>>, namedParam339 ! : Int8) : Unit { // block id: 340
    func func343(param344 : Int16) : Bool { // block id: 345
        Class86.var351[2]
    }
;
    var loopTimeVar499 : Range<UInt64> = (UInt64(Int64(Float32(Int8(-48))))..UInt64(150):(Int64(UInt16(Int8(-35)))|1));
    for (i in loopTimeVar499) if (func343(var107)) {
        func389();
        Aggregate492<Int16>.var497
    };
    var var531 : Option<(Unit*Range<UInt32>)> = Option<(Unit*Range<UInt32>)>.None;
    var var535 : Option<(Unit*Range<UInt32>)> = (Int32(Int32(-4)) as (Unit*Range<UInt32>));
    ([Option<(Unit*Range<UInt32>)>.Some(var517), var531, var531, var535, Option<(Unit*Range<UInt32>)>.None, Option<(Unit*Range<UInt32>)>.None, Option<(Unit*Range<UInt32>)>.Some(var517), Option<(Unit*Range<UInt32>)>.Some(var517), Option<(Unit*Range<UInt32>)>.None, Option<(Unit*Range<UInt32>)>.None][6] ?? var517)[0]
}

func func389() : Unit { // block id: 390
    var loopTimeVar451 : Int64 = 0;
    do {
        loopTimeVar451++;
        var var445 : UInt8 = UInt8(241);
        if (false) { // block id: 433
            ();
            var436;
            UInt8(87)
        } else if (true) { // block id: 443
            var445
        } else { // block id: 447
            ();
            var445
        }
    } while (if (try { // block id: 394
        true
    } finally { // block id: 396
        var16;
        true
    }) { // block id: 399
        var16;
        false
    } else if ([true, false, var408, true, true, true, true, var408, var408, var408][8]) { // block id: 424
        var16;
        var408
    } else { // block id: 427
        var16;
        true
    } && loopTimeVar451 < 100 ) ;
    let var456 : (Int8*Float32*Range<Int32>) = (Int8(-103), Float32(39), (Int32(-47)..=Int32(Int16(93)):(62|1)));
    match (var456[2]) {
        case _ : Aggregate55 => 
            (UInt8(197)..UInt8(71):(var72|1));
            var16;
            ()
        
        case _ : UInt64 => 
            ();
            ()
        
        case caseVar483 => 
            var16
        
        case _ => 
            var16;
            Class86();
            ()
        
    }
}

external record Aggregate492<T0> {
    public init() { // block id: 494

    }
;
    public static let var497 : Unit = ()
}




external record Aggregate721 {
    public init() { // block id: 723

    }
;
    var var728 : Unit = ()
}


extend Aggregate492<T0> where T0 <: Int16 {

}

extend Class86 {
    static func func91(namedParam92 ! : Bool, optionalParam93 ! : UInt32 = UInt32(UInt64(170)), namedParam96 ! : UInt64) : Option<Unit> { // block id: 97
        let var120 : Float64 = Float64(UInt64(UInt32(UInt16(213))));
        var loopTimeVar134 : Range<UInt64> = (UInt64(UInt32(Int64(UInt8(158))))..=UInt64(Float32(57.0)):(4|1));
        for (i in loopTimeVar134) if ((namedParam92, namedParam96)[0]) {
            match (var107) {
                case _ => 
                    ();
                    ();
                    let var115 : Option<Unit> = (Aggregate55() as Unit);
                    var115
                
            };
            match (var120) {
                case -91.0 => 
                    Int32(-5);
                    ();
                    ()
                
                case _ => 
                    var16
                
            }
        };
        let var158 : Int32 = Int32(Float64(Int16(-51)));
        var var170 : Char = 'G';
        var var187 : Range<UInt32> = (UInt32(UInt64(UInt64(UInt16(209))))..=UInt32(199):(Int64(UInt32(48))|1));
        if (if (match (Int32(72)) {
            case $var158 => 
                27.0;
                namedParam92
            
            case _ => 
                ();
                var170;
                true
            
            case caseVar175 : Range<Int8> => 
                namedParam92
            
            case 115 | $var158 | -36 => 
                var16;
                namedParam92
            
            case _ => 
                var187;
                false;
                namedParam92
            
        }) { ((UInt64(175)..UInt64(116):(-46)|1) is Int8) } else { (Class86.var203) } ) { // block id: 205
            var208.var211;
            var16;
            (var233 ?? Option<Unit>.None)
        } else if (((var158..var158:(var72|1)) is Float32)) { // block id: 243
            (Option<Option<Unit>>.None ?? var247)
        } else { // block id: 249
            [(), (), (), (), (), (), (), (), (), ()][9];
            match (var256) {
                case caseVar265 : Int32 => 
                    ();
                    ();
                    Int32(29)
                
                case _ => 
                    ();
                    UInt64(170);
                    Int32(-49)
                
            };
            (Option<Option<Unit>>.None as Unit)
        }
    }

}


/*
Call parameter type does not match function signature!
%Unit.Type* @"_ZN7default13$tmp_global$2"
 i8 addrspace(1)**  call void @llvm.gcwrite.static.cj(i8 addrspace(1)* %14, %Unit.Type* @"_ZN7default13$tmp_global$2"), !dbg !112
Instruction does not dominate all uses!
  %1 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @_ZN7default22__Auto__Environment_11.objKlass), !dbg !1597
  %2 = bitcast i8 addrspace(1)* %1 to %ObjLayout._ZN7default22__Auto__Environment_11 addrspace(1)*
Instruction does not dominate all uses!
  %var35 = alloca %Tuple2_bmE
  %5 = bitcast %Tuple2_bmE* %var35 to i8*
Instruction does not dominate all uses!
  %1 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @_ZN7default22__Auto__Environment_11.objKlass), !dbg !1597
  %6 = bitcast i8 addrspace(1)* %1 to %ObjLayout._ZN7default22__Auto__Environment_11 addrspace(1)*
Instruction does not dominate all uses!
  %var46 = alloca %record.Enum-Common
  %9 = addrspacecast %record.Enum-Common* %var46 to i8 addrspace(1)*
Instruction does not dominate all uses!
  %1 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @_ZN7default22__Auto__Environment_11.objKlass), !dbg !1597
  call void @llvm.gcwrite.agg.cj(i8 addrspace(1)* %1, i8 addrspace(1)* %8, i8 addrspace(1)* %9, i64 16)
Instruction does not dominate all uses!
  %var76 = alloca i32
  %10 = load i32, i32* %var76
Instruction does not dominate all uses!
  %1 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @_ZN7default22__Auto__Environment_11.objKlass), !dbg !1597
  %11 = bitcast i8 addrspace(1)* %1 to %ObjLayout._ZN7default22__Auto__Environment_11 addrspace(1)*
Instruction does not dominate all uses!
  %var280 = alloca i64
  %13 = load i64, i64* %var280
Instruction does not dominate all uses!
  %1 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @_ZN7default22__Auto__Environment_11.objKlass), !dbg !1597
  %14 = bitcast i8 addrspace(1)* %1 to %ObjLayout._ZN7default22__Auto__Environment_11 addrspace(1)*
Instruction does not dominate all uses!
  %1 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @_ZN7default22__Auto__Environment_11.objKlass), !dbg !1597
  %16 = call i8 addrspace(1)* @"_ZN033$Lambda__ZN7default4main6func24Ev.init"(i8 addrspace(1)* %1), !dbg !1684
Instruction does not dominate all uses!
  %var668 = alloca %Tuple4_jjl6StringE
  %81 = bitcast %Tuple4_jjl6StringE* %var668 to i8*, !dbg !1721
Instruction does not dominate all uses!
  %var668 = alloca %Tuple4_jjl6StringE
  %83 = bitcast %Tuple4_jjl6StringE* %var668 to i8*, !dbg !1721[CodeGen Error]: Generate module error.
error: Invalid record (Producer: 'LLVM8.0.0' Reader: 'LLVM 10.0.1')
1 error generated.

return code: 1
*/
