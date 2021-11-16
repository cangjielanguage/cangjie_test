// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

// random seed:1629069170671

// All global variable need to be defined before use!
external let var39 : Unit = ()
external let var99 : Bool = (true is UInt32)
external let var104 : Bool = false
external var var126 : Option<Unit> = ((Option<Unit>.None as Unit) as Unit)
external let var185 : Bool = ((false is Int8) is Bool)
external let var221 : Int16 = Int16(74)
external let var229 : Int32 = Int32(-4)
external let var248 : UInt64 = UInt64(5)
external let var268 : Class76 = Class76()
internal let var278 : Float32 = Float32(-20.0)
external let var354 : Aggregate8 = Aggregate8()
external let var383 : UInt32 = UInt32(5)
external let var399 : Bool = (false is Class76)
external let var404 : Int8 = Int8(-91)
internal var var469 : UInt16 = UInt16(19)
external let var474 : Int32 = Int32(-34)
internal let var479 : (Int16*Float64*UInt8) = (Int16(50), (-43.0), UInt8(85))
external let var555 : UInt8 = UInt8(216)
external let var568 : Bool = false
external var var581 : Char = 'J'
external var var594 : Float64 = 104.0
external var var661 : Option<Unit> = (((Option<Unit>.Some(var39) as Unit) as Unit) as Unit)
external var var686 : Bool = (false is UInt16)
external let var730 : (Bool*UInt32) = (false, UInt32(217))
external let var781 : Option<Aggregate8> = ((Option<Aggregate8>.Some(var354) as Aggregate8) as Aggregate8)
external var var838 : UInt8 = UInt8(55)
external let var862 : Option<Option<Unit>> = ((((Option<Option<Unit>>.Some(var661) as Option<Unit>) as Option<Unit>) as Option<Unit>) as Option<Unit>)
external let var935 : Option<Float32> = Option<Float32>.None
external let var942 : Option<Class76> = (Option<Class76>.Some(var268) as Class76)
external var var1038 : (Unit*Option<Aggregate8>*UInt32) = ((), (Option<Aggregate8>.Some(var354) as Aggregate8), UInt32(233))
external var var1050 : Int64 = (-107)
external var var1059 : Unit = ()
func main(): Int64 {
    func12().func853()
    // CRC Check All Variables
    var crccheck = CrcCheck(5000, 32)
    crccheck.updateBuffer(UInt64(var221), 64)
    crccheck.updateBuffer(UInt64(var404), 64)
    crccheck.updateBuffer(UInt64(var555), 64)
    crccheck.updateBuffer(UInt64(var1050), 64)
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
external record Aggregate8 {
    public init() { // block id: 10

    }
;
    public static let var1028 : Option<Bool> = Option<Bool>.Some(var185);
    public func func853() : Int64 { // block id: 854
        match ((if (var104) { // block id: 859
                Int8(-48);
                var862
            } else if (var185) { // block id: 870
                ();
                Option<Option<Unit>>.Some(var661)
            } else { // block id: 873
                var661;
                ();
                Option<Option<Unit>>.None
            } ?? Option<Unit>.None)) {
            case caseVar880 => 
                Option<Aggregate8>.Some(var354);
                var39;
                (var185, var383)
            
            case caseVar889 : Option<Aggregate8> => 
                (false, UInt32(91))
            
            case _ => 
                var39;
                (true, var383)
            
        };
        var var1069 : Option<Int64> = Option<Int64>.None;
        if (match (match (UInt8(100)) {
                case _ : Float64 => 
                    var39;
                    Class76(namedParam910 : ())
                
                case _ : Float32 => 
                    Class76()
                
                case _ : UInt16 => 
                    Class76(namedParam910 : (), optionalParam911 : Option<Float64>.Some(var594))
                
                case caseVar969 => 
                    var268
                
                case _ => 
                    ();
                    var39;
                    var268
                
            }) {
            case _ => 
                var39;
                ();
                var399
            
            case _ => 
                var var987 : Option<Aggregate8> = Option<Aggregate8>.None;
                var987;
                ();
                true
            
            case caseVar993 => 
                var104
            
            case _ : (Class76*Int8*UInt32) => 
                ();
                var686
            
            case _ => 
                var39;
                var39;
                var99
            
        }) { // block id: 1006
            match (var838) {
                case caseVar1011 : Option<Float64> => 
                    var var1014 : (Unit*Option<Aggregate8>*UInt32) = ((), (((Option<Aggregate8>.Some(var354) as Aggregate8) as Aggregate8) as Aggregate8), UInt32(248));
                    var1014
                
                case 105 => 
                    UInt16(168);
                    var1028;
                    ((), Option<Aggregate8>.Some(var354), var383)
                
                case _ => 
                    var1038
                
            };
            (Option<Int64>.None ?? (-49))
        } else { // block id: 1054
            if (var568) { // block id: 1057
                var1059;
                ();
                (-45)
            } else if (var568) { // block id: 1064
                true;
                (-2)
            } else { // block id: 1067
                var1069;
                (-14)
            }
        }
    }

}

external func func12() : Aggregate8 { // block id: 13
    var var22 : (Bool*UInt32) = ((((false is Aggregate8) is UInt16) is Aggregate8), UInt32(151));
    var var30 : Bool = true;
    var var34 : Unit = ();
    let var843 : Float64 = (-55.0);
    if (if (false) { // block id: 19
        ();
        var22
    } else if (var30) { // block id: 32
        var34;
        var22
    } else { // block id: 37
        var39;
        ();
        var22
    }[0]) { // block id: 44
        func46(namedParam52 : var469, namedParam53 : var581);
        if (false) { (var221, (-52.0), var838) } else { (Int16(11), var843, var555) } ;
        if (var399) { () } else { () } 
    };
    var34;
    Aggregate8()
}

external func func46(optionalParam47 ! : Bool = (((true is Char) is UInt64) is Int64), namedParam52 ! : UInt16, namedParam53 ! : Char, optionalParam54 ! : (Bool*UInt32) = (((true is Float32) is UInt8), UInt32(76))) : Unit { // block id: 60
    if (false) { // block id: 63
        var39;
        if (true) { // block id: 67

        } else if (optionalParam47) { // block id: 69
            UInt32(100);
            var39
        };
        func73()
    }
}

external func func73() : Unit { // block id: 74
    let var89 : Class76 = Class76();
    func func80(param81 : Float32, namedParam82 ! : Aggregate8, namedParam83 ! : UInt8) : Class76 { // block id: 84
        if (if (var89.var92) { // block id: 95
            var39;
            ();
            var99
        } else if ((var104 is Bool)) { // block id: 106
            true
        } else { // block id: 108
            UInt8(106);
            var var111 : Unit = ();
            var111;
            true
        }) { (match (Class76()) {
            case _ : Aggregate8 => 
                var126
            
            case caseVar132 : Int16 => 
                var126
            
            case _ => 
                var39;
                123;
                Option<Unit>.None
            
        } ?? var39) } else { if (var89.var145) { // block id: 151
            ();
            var39;
            ()
        } } ;
        Int8(123);
        let var253 : (Class76*Int8*UInt32) = (Class76(), Int8(25), UInt32(9));
        if (func158(namedParam161 : match (Option<Bool>.Some(var185)) {
            case caseVar242 => 
                UInt64(114)
            
            case _ => 
                var248
            
        })) { var253[0] } else { (if (var185) { var89 } else { (Option<Class76>.None ?? Class76()) } ) } 
    }
;
    func80(match (var104) {
        case _ => 
            ();
            var278
        
    }, namedParam82 : func281(optionalParam282 : var469, namedParam284 : Option<Bool>.Some(var185), namedParam285 : var474), namedParam83 : var479[2]).var486;
    Class76.func491(if (var99) { // block id: 795
        ();
        UInt32(79);
        (var469, Aggregate8())
    } else if (true) { // block id: 802
        ();
        ();
        let var806 : (UInt16*Aggregate8) = (UInt16(12), Aggregate8());
        var806
    } else { // block id: 810
        var39;
        let var813 : (UInt16*Aggregate8) = (UInt16(12), Aggregate8());
        var813
    }, optionalParam495 : if (var104) { var185 } else { var185 } );
    if ((if (true) { var568 } else { false }  is UInt8)) { // block id: 827
        var39;
        ()
    }
}

external open class Class76 {
    public init() { // block id: 78

    }
;
    var var92 : Bool = (true is (Bool*UInt32));
    public var var145 : Bool = ((((false is Bool) is UInt8) is UInt8) is Char);
    public let var313 : Bool = false;
    public var var438 : Aggregate423<Aggregate8, Char> = Aggregate423<Aggregate8, Char>();
    public open func func407(namedParam408 ! : Option<Aggregate8>, namedParam409 ! : UInt16, namedParam410 ! : Option<Aggregate8>) : Aggregate8 { // block id: 411
        var var418 : (UInt16*Aggregate8) = (UInt16(151), Aggregate8());
        if (var399) { // block id: 416
            var418
        } else if (Aggregate423<Aggregate8, Char>.var428) { // block id: 431
            var39;
            (namedParam409, var354)
        } else { // block id: 436
            var438;
            var418
        }[1]
    }
;
    let var486 : Int8 = Int8(109);
    public static var var506 : Bool = (false is UInt32);
    private func func540(namedParam541 ! : Bool) : Option<Unit> { // block id: 542
        var var550 : Option<Bool> = Option<Bool>.Some(var185);
        match ((if (var145) { // block id: 547
                Float32(115.0);
                var550
            } else if (var99) { // block id: 553
                var555;
                'U';
                var550
            } else { // block id: 559
                var550
            } as Bool)) {
            case _ => 
                var39;
                ();
                var126
            
        }
    }
;
    private static func func531(namedParam532 ! : UInt64, optionalParam533 ! : Aggregate8 = Aggregate8(), namedParam535 ! : Unit) : Option<Unit> { // block id: 536
        var268.func540(namedParam541 : if (var568) { true } else { var568 } );
        namedParam535;
        (Option<Unit>.None as Unit)
    }
;
    public static let var602 : Option<Float64> = (Option<Float64>.None as Float64);
    private static var var735 : Option<(Bool*UInt32)> = Option<(Bool*UInt32)>.None;
    private static func func641(param642 : UInt64, optionalParam643 ! : UInt64 = UInt64(48), optionalParam645 ! : Float32 = Float32(-105.0)) : Float64 { // block id: 647
        (((Option<Option<Unit>>.Some(var661) ?? Option<Unit>.Some(var39)) as Unit) ?? ());
        var loopTimeVar704 : Int64 = 0;
        var loopTimeVar720 : Int64 = 0;
        if ((if (false) { (var506 is (Class76*Int8*UInt32)) } else { (var506 is Option<Aggregate8>) } )) { (if (if (true) { // block id: 681
            var221;
            var39;
            var99
        } else if (var686) { // block id: 689
            Option<Option<Unit>>.None;
            Option<Aggregate8>.None;
            var506
        } else { // block id: 693
            ();
            ();
            false
        }) { while (var104 && loopTimeVar704 < 100 ) {
            loopTimeVar704++;
            var var701 : Option<Aggregate8> = Option<Aggregate8>.None;
            var701
        } } else { (if (var99) { var39 } else { () } ) } ) } else { (var126 ?? do {
            loopTimeVar720++;
            ((), Option<Aggregate8>.None, UInt32(223));
            ()
        } while (true && loopTimeVar720 < 100 ) ) } ;
        if (var506) { match ((var735 ?? (false, UInt32(178)))) {
            case (false | false,$var383 | 182) => 
                var39;
                71.0
            
            case (caseVar748 : UInt32,$caseVar748 | 148) => 
                ();
                var39;
                var594
            
            case _ => 
                var39;
                (-85.0)
            
            case _ => 
                38.0
            
        } } else { 77.0 } 
    }
;
    public static func func630(param631 : UInt8, namedParam632 ! : Int16, optionalParam633 ! : UInt32 = UInt32(207), optionalParam635 ! : Char = 'N') : Float64 { // block id: 637
        Class76.func641(if (false) { UInt64(229) } else { UInt64(225) } )
    }
;
    public static func func525(namedParam526 ! : UInt16) : Unit { // block id: 527
        Class76.func531(namedParam532 : var248, optionalParam533 : match (Option<Class76>.None) {
            case _ => 
                var581;
                var39;
                var var585 : Aggregate8 = Aggregate8();
                var585
            
        }, namedParam535 : var39);
        (if ((if (var506) { false } else { true } )) { var602 } else { match ((Int16(-44), var594, UInt8(54))) {
            case _ => 
                var39;
                var126;
                Option<Float64>.Some(var594)
            
            case caseVar618 : (Int16*Float64*UInt8) => 
                ();
                Option<Float64>.None
            
            case _ => 
                UInt16(151);
                ();
                var602
            
        } }  ?? Class76.func630(UInt8(77), namedParam632 : Int16(15), optionalParam633 : UInt32(5), optionalParam635 : 'w'));
        var loopTimeVar789 : Int64 = 0;
        while (var399 && loopTimeVar789 < 100 ) {
            loopTimeVar789++;
            (var781 ?? var354);
            ()
        }
    }
;
    static let var791 : UInt16 = UInt16(131);
    public static func func491(param492 : (UInt16*Aggregate8), optionalParam493 ! : UInt32 = UInt32(252), optionalParam495 ! : Bool = ((false is UInt16) is Int32)) : Unit { // block id: 499
        var229;
        Int8(28);
        let var511 : Bool = (false is Option<Class76>);
        if ((Class76.var506)) { (if (var511) { (if (optionalParam495) { () } else { var39 } ) } else { (if (optionalParam495) { var39 } else { var39 } ) } ) } else { (Class76.func525(namedParam526 : var791)) } 
    }
;
    public static var var938 : Float32 = Float32(92.0);
    public init(namedParam910 ! : Unit, optionalParam911 ! : Option<Float64> = Option<Float64>.None) { // block id: 913
        var var924 : (Unit*Option<Aggregate8>*UInt32) = ((), (Option<Aggregate8>.Some(var354) as Aggregate8), UInt32(174));
        (if (var568) { // block id: 922
            var924;
            Option<Float32>.None
        } else { // block id: 931
            var39;
            ();
            var935
        } ?? var938);
        match (var942) {
            case caseVar948 : UInt16 => 
                namedParam910;
                Float32(-12.0);
                Class76()
            
            case _ => 
                var268
            
        }
    }

}


external func func158(optionalParam159 ! : UInt16 = UInt16(25), namedParam161 ! : UInt64, optionalParam162 ! : Char = 'W') : Bool { // block id: 164
    let var193 : Float32 = Float32(-36.0);
    var var208 : Option<Bool> = (Option<Bool>.Some(var185) as Bool);
    if ((match (Option<Unit>.Some(var39)) {
        case caseVar172 => 
            var104
        
        case caseVar177 => 
            var39;
            var99
        
        case _ => 
            var185
        
        case _ => 
            var193;
            var99;
            var99
        
        case _ => 
            false
        
    } is Int16)) { if ((var208 ?? false)) { // block id: 212

    } } else { match (if (var104) { Int16(111) } else { Int16(89) } ) {
        case -50 | -49 | $var221 | -53 => 
            Int8(79);
            var39
        
        case _ => 
            var229;
            var39;
            var39
        
    } } ;
    var var234 : Unit = ();
    var234;
    var185
}



internal func func281(optionalParam282 ! : UInt16 = UInt16(231), namedParam284 ! : Option<Bool>, namedParam285 ! : Int32) : Aggregate8 { // block id: 286
    var var293 : Char = 'r';
    var loopTimeVar296 : Int64 = 0;
    let var300 : (Int32*Unit*Int64*UInt64) = (Int32(-61), (), (-106), UInt64(253));
    if (true) { while (true && loopTimeVar296 < 100 ) {
        loopTimeVar296++;
        var293
    } } else { var300[1] } ;
    ();
    let var372 : (Unit*Option<Aggregate8>*UInt32) = ((), Option<Aggregate8>.Some(var354), UInt32(163));
    func func388(optionalParam389 ! : Bool = false, optionalParam391 ! : Unit = (), optionalParam393 ! : Class76 = Class76(), namedParam395 ! : Int8) : Class76 { // block id: 396
        Class76()
    }
;
    func func341(param342 : Float32, namedParam343 ! : Int32, namedParam344 ! : Option<Unit>, optionalParam345 ! : Char = 'C') : Aggregate8 { // block id: 347
        (if (true) { // block id: 360
            var39;
            Int8(11);
            (var39, Option<Aggregate8>.Some(var354), UInt32(230))
        } else if (var99) { // block id: 369
            var221;
            var372
        } else { // block id: 377
            var39;
            ((), Option<Aggregate8>.Some(var354), var383)
        }[1] ?? func388(optionalParam389 : var399, optionalParam391 : var39, namedParam395 : var404).func407(namedParam408 : Option<Aggregate8>.Some(var354), namedParam409 : UInt16(208), namedParam410 : Option<Aggregate8>.Some(var354)))
    }
;
    if (if (var268.var313) { // block id: 315
        var104
    } else if (if (false) { false } else { true } ) { // block id: 321
        ();
        false
    } else { // block id: 324
        Int32(100);
        false
    }) { // block id: 327
        if (var104) { () } else { var39 } ;
        (Option<Unit>.None ?? ());
        func341(var278, namedParam343 : var229, namedParam344 : Option<Unit>.Some(var39), optionalParam345 : 'V')
    } else { // block id: 451
        Aggregate453<Int64, Bool>.var458;
        if (false) { // block id: 463
            ();
            Aggregate8()
        } else { // block id: 466
            Aggregate8()
        }
    }
}



external record Aggregate423<T1, T2> {
    public init() { // block id: 425

    }
;
    public static let var428 : Bool = (true is (Unit*Option<Aggregate8>*UInt32))
}

external record Aggregate453<T1, T2> {
    init() { // block id: 455

    }
;
    public static var var458 : Option<Unit> = (Option<Unit>.Some(var39) as Unit)
}









/*
Basic Block in function 'default_global_init' does not have terminator!
label %if.end6
Operand is null
  %icmpeq106 = icmp eq i32 %79, <null operand!>; ModuleID = 'default'
source_filename = "default"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%KlassInfo = type { i32, i32, %BitMap*, %KlassInfo*, i8**, i64*, i32, %KlassInfo** }
%BitMap = type { i32, [0 x i8] }
%Unit.Type = type { i8 }
%record._ZN7default10Aggregate8E = type { i8 }
%Tuple3_sdhE = type { i16, double, i8 }
%Tuple2_bjE = type { i1, i32 }
%Tuple3_u6Option10Aggregate8jE = type { %Unit.Type, i8 addrspace(1)*, i32 }
%ObjLayout._ZN7default7Class76E = type { %"ObjLayout._ZN12core$FS$core6ObjectE", i1, i1, i1, %record._ZN7default7default12Aggregate423I10Aggregate8cE, i8 }
%"ObjLayout._ZN12core$FS$core6ObjectE" = type { %ObjLayout.Object }
%ObjLayout.Object = type { %KlassInfo* }
%record._ZN7default7default12Aggregate423I10Aggregate8cE = type { i8 }
%Tuple2_t10Aggregate8E = type { i16, %record._ZN7default10Aggregate8E }
%"record._ZN12core$FS$core6StringE" = type { i8 addrspace(1)* }
%ObjLayout._ZN7default8CrcCheckE = type { %"ObjLayout._ZN12core$FS$core6ObjectE", i8 addrspace(1)*, i8 addrspace(1)*, i8 addrspace(1)*, i64, i64, i64 }
%ArrayLayout.Int64 = type { %ArrayBase, [0 x i64] }
%ArrayBase = type { %ObjLayout.Object, i32 }
%"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE" = type { %ObjLayout.Object, i64 }
%"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE$Some1" = type { %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE", %Tuple2_bjE }
%"ObjLayout._ZN7default12core$FS$core6OptionIdE" = type { %ObjLayout.Object, i64 }
%"ObjLayout._ZN7default12core$FS$core6OptionIdE$Some1" = type { %"ObjLayout._ZN7default12core$FS$core6OptionIdE", double }
%"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E" = type { %ObjLayout.Object, i64 }
%"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E$Some1" = type { %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E", i8 addrspace(1)* }
%"ObjLayout._ZN7default12core$FS$core6OptionIfE" = type { %ObjLayout.Object, i64 }
%"ObjLayout._ZN7default12core$FS$core6OptionIfE$Some1" = type { %"ObjLayout._ZN7default12core$FS$core6OptionIfE", float }
%"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE" = type { %ObjLayout.Object, i64 }
%"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE$Some1" = type { %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE", i8 addrspace(1)* }
%"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E" = type { %ObjLayout.Object, i64 }
%"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E$Some1" = type { %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E", %record._ZN7default10Aggregate8E }
%"ObjLayout._ZN7default12core$FS$core6OptionIbE" = type { %ObjLayout.Object, i64 }
%"ObjLayout._ZN7default12core$FS$core6OptionIbE$Some1" = type { %"ObjLayout._ZN7default12core$FS$core6OptionIbE", i1 }
%"ObjLayout._ZN7default12core$FS$core6OptionIuE" = type { %ObjLayout.Object, i64 }
%"ObjLayout._ZN7default12core$FS$core6OptionIuE$Some1" = type { %"ObjLayout._ZN7default12core$FS$core6OptionIuE", %Unit.Type }
%"ObjLayout._ZN12core$FS$core12core$FS$core6OptionIlE" = type { %ObjLayout.Object, i64 }
%"ObjLayout._ZN12core$FS$core12core$FS$core6OptionIlE$Some1" = type { %"ObjLayout._ZN12core$FS$core12core$FS$core6OptionIlE", i64 }
%ObjLayout._ZN7default21__Auto__Environment_6 = type { %"ObjLayout._ZN12core$FS$core6ObjectE", i8 addrspace(1)* }
%Tuple4_iulmE = type { i32, %Unit.Type, i64, i64 }
%ObjLayout._ZN7default21__Auto__Environment_8 = type { %"ObjLayout._ZN12core$FS$core6ObjectE", %Tuple3_u6Option10Aggregate8jE }
%record._ZN7default7default12Aggregate453IlbE = type { i8 }
%Tuple3_7Class76ajE = type { i8 addrspace(1)*, i8, i32 }

$"_ZN7default12core$FS$core6OptionITuple2_bjEE.init" = comdat any

$"_ZN7default12core$FS$core6OptionITuple2_bjEE$Some1.init" = comdat any

$"_ZN7default12core$FS$core6OptionIdE.init" = comdat any

$"_ZN7default12core$FS$core6OptionIdE$Some1.init" = comdat any

$"_ZN7default12core$FS$core6OptionI7Class76E.init" = comdat any

$"_ZN7default12core$FS$core6OptionI7Class76E$Some1.init" = comdat any

$"_ZN7default12core$FS$core6OptionIfE.init" = comdat any

$"_ZN7default12core$FS$core6OptionIfE$Some1.init" = comdat any

$"_ZN7default12core$FS$core6OptionI6OptionuE.init" = comdat any

$"_ZN7default12core$FS$core6OptionI6OptionuE$Some1.init" = comdat any

$"_ZN7default12core$FS$core6OptionI10Aggregate8E.init" = comdat any

$"_ZN7default12core$FS$core6OptionI10Aggregate8E$Some1.init" = comdat any

$"_ZN7default12core$FS$core6OptionIbE.init" = comdat any

$"_ZN7default12core$FS$core6OptionIbE$Some1.init" = comdat any

$"_ZN7default12core$FS$core6OptionIuE.init" = comdat any

$"_ZN7default12core$FS$core6OptionIuE$Some1.init" = comdat any

$_ZN7default7default12Aggregate423I10Aggregate8cE = comdat any

$_ZN7default10Aggregate8E = comdat any

$Tuple3_sdhE = comdat any

$Tuple2_bjE = comdat any

$Tuple3_u6Option10Aggregate8jE = comdat any

$Tuple4_iulmE = comdat any

$Tuple3_7Class76ajE = comdat any

$Tuple2_t10Aggregate8E = comdat any

$_ZN7default7default12Aggregate453IlbE = comdat any

@has_invoke_default_global_init = global i1 false, align 4
@"_ZN12core$FS$core6ObjectE.objKlass" = external global %KlassInfo #0
@_ZN7default21__Auto__Environment_6.objKlass = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @"_ZN12core$FS$core6ObjectE.objKlass", i8** null, i64* null, i32 0, %KlassInfo** null }, !RelatedType !0 #0
@_ZN7default7Class76E.vtable = global [3 x i8*] [i8* null, i8* bitcast (void (%record._ZN7default10Aggregate8E*, i8 addrspace(1)*, i8 addrspace(1)*, i16, i8 addrspace(1)*)* @_ZN7default7Class767func407E6Option10Aggregate8t6Option10Aggregate8 to i8*), i8* bitcast (i8 addrspace(1)* (i8 addrspace(1)*, i1)* @_ZN7default7Class767func540Eb to i8*)] #1
@_ZN7default7Class76E.objKlass = global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @"_ZN12core$FS$core6ObjectE.objKlass", i8** getelementptr inbounds ([3 x i8*], [3 x i8*]* @_ZN7default7Class76E.vtable, i32 0, i32 0), i64* null, i32 0, %KlassInfo** null }, !RelatedType !1 #0
@_ZN7default8CrcCheckE.vtable = global [4 x i8*] [i8* null, i8* bitcast (void (%Unit.Type*, i8 addrspace(1)*, i64, i64)* @_ZN7default8CrcCheck12updateBufferEml to i8*), i8* bitcast (void (%Unit.Type*, i8 addrspace(1)*)* @_ZN7default8CrcCheck8crcCheckEv to i8*), i8* bitcast (void (%Unit.Type*, i8 addrspace(1)*)* @_ZN7default8CrcCheck12getCrcOutputEv to i8*)] #1
@_ZN7default8CrcCheckE.objKlass = global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @"_ZN12core$FS$core6ObjectE.objKlass", i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @_ZN7default8CrcCheckE.vtable, i32 0, i32 0), i64* null, i32 0, %KlassInfo** null }, !RelatedType !2 #0
@_ZN7default21__Auto__Environment_8.objKlass = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @"_ZN12core$FS$core6ObjectE.objKlass", i8** null, i64* null, i32 0, %KlassInfo** null }, !RelatedType !3 #0
@"_ZN12core$FS$core9ThrowableE.objKlass" = external global %KlassInfo #0
@"_ZN7default12core$FS$core6OptionITuple2_bjEE.objKlass" = global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** null, i64* null, i32 0, %KlassInfo** null }, !RelatedType !4 #0
@"_ZN7default12core$FS$core6OptionITuple2_bjEE$Some1.objKlass" = global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @"_ZN7default12core$FS$core6OptionITuple2_bjEE.objKlass", i8** null, i64* null, i32 0, %KlassInfo** null }, !RelatedType !5 #0
@Object.objKlass = weak_odr global %KlassInfo zeroinitializer, !RelatedType !6 #0
@"_ZN7default12core$FS$core6OptionIdE.objKlass" = global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** null, i64* null, i32 0, %KlassInfo** null }, !RelatedType !7 #0
@"_ZN7default12core$FS$core6OptionIdE$Some1.objKlass" = global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @"_ZN7default12core$FS$core6OptionIdE.objKlass", i8** null, i64* null, i32 0, %KlassInfo** null }, !RelatedType !8 #0
@"_ZN7default12core$FS$core6OptionI7Class76E.objKlass" = global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** null, i64* null, i32 0, %KlassInfo** null }, !RelatedType !9 #0
@"_ZN7default12core$FS$core6OptionI7Class76E$Some1.objKlass" = global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @"_ZN7default12core$FS$core6OptionI7Class76E.objKlass", i8** null, i64* null, i32 0, %KlassInfo** null }, !RelatedType !10 #0
@"_ZN7default12core$FS$core6OptionIfE.objKlass" = global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** null, i64* null, i32 0, %KlassInfo** null }, !RelatedType !11 #0
@"_ZN7default12core$FS$core6OptionIfE$Some1.objKlass" = global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @"_ZN7default12core$FS$core6OptionIfE.objKlass", i8** null, i64* null, i32 0, %KlassInfo** null }, !RelatedType !12 #0
@"_ZN7default12core$FS$core6OptionI6OptionuE.objKlass" = global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** null, i64* null, i32 0, %KlassInfo** null }, !RelatedType !13 #0
@"_ZN7default12core$FS$core6OptionI6OptionuE$Some1.objKlass" = global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @"_ZN7default12core$FS$core6OptionI6OptionuE.objKlass", i8** null, i64* null, i32 0, %KlassInfo** null }, !RelatedType !14 #0
@"_ZN7default12core$FS$core6OptionI10Aggregate8E.objKlass" = global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** null, i64* null, i32 0, %KlassInfo** null }, !RelatedType !15 #0
@"_ZN7default12core$FS$core6OptionI10Aggregate8E$Some1.objKlass" = global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @"_ZN7default12core$FS$core6OptionI10Aggregate8E.objKlass", i8** null, i64* null, i32 0, %KlassInfo** null }, !RelatedType !16 #0
@"_ZN7default12core$FS$core6OptionIbE.objKlass" = global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** null, i64* null, i32 0, %KlassInfo** null }, !RelatedType !17 #0
@"_ZN7default12core$FS$core6OptionIbE$Some1.objKlass" = global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @"_ZN7default12core$FS$core6OptionIbE.objKlass", i8** null, i64* null, i32 0, %KlassInfo** null }, !RelatedType !18 #0
@"_ZN7default12core$FS$core6OptionIuE.objKlass" = global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** null, i64* null, i32 0, %KlassInfo** null }, !RelatedType !19 #0
@"_ZN7default12core$FS$core6OptionIuE$Some1.objKlass" = global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @"_ZN7default12core$FS$core6OptionIuE.objKlass", i8** null, i64* null, i32 0, %KlassInfo** null }, !RelatedType !20 #0
@"_ZN026$Lambda__ZN7default4mainEv.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN026$Lambda__ZN7default4mainEv.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN026$Lambda__ZN7default4mainEv.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN026$Lambda__ZN7default4mainEv.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN016$LambdaCommon_0l.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN026$Lambda__ZN7default4mainEv.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (i64 (i8 addrspace(1)*)* @_ZN7default4mainEv to i8*)] #1
@"_ZN026$Lambda__ZN7default4mainEv.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* bitcast (i64 (i8 addrspace(1)*)* @_ZN7default4mainEv to i8*)], i32* null } #2
@"_ZN026$Lambda__ZN7default4mainEv.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN016$LambdaCommon_0l.objKlass"]
@"_ZN041$Lambda__ZN7default10Aggregate87func853Ev.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN041$Lambda__ZN7default10Aggregate87func853Ev.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN041$Lambda__ZN7default10Aggregate87func853Ev.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN041$Lambda__ZN7default10Aggregate87func853Ev.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN041$Lambda__ZN7default10Aggregate87func853Ev.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (i64 (i8 addrspace(1)*, %record._ZN7default10Aggregate8E*)* @_ZN7default10Aggregate87func853Ev to i8*)] #1
@"_ZN041$Lambda__ZN7default10Aggregate87func853Ev.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* null, i8* null, i8* null, i8* null, i8* bitcast (i64 (i8 addrspace(1)*, %record._ZN7default10Aggregate8E*)* @_ZN7default10Aggregate87func853Ev to i8*), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], i32* null } #2
@"_ZN041$Lambda__ZN7default10Aggregate87func853Ev.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN028$LambdaCommon_1l10Aggregate8.objKlass"]
@"_ZN028$LambdaCommon_1l10Aggregate8.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN028$Lambda__ZN7default6func12Ev.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN028$Lambda__ZN7default6func12Ev.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN028$Lambda__ZN7default6func12Ev.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN028$Lambda__ZN7default6func12Ev.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN028$Lambda__ZN7default6func12Ev.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (void (%record._ZN7default10Aggregate8E*, i8 addrspace(1)*)* @_ZN7default6func12Ev to i8*)] #1
@"_ZN028$Lambda__ZN7default6func12Ev.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* bitcast (void (%record._ZN7default10Aggregate8E*, i8 addrspace(1)*)* @_ZN7default6func12Ev to i8*)], i32* null } #2
@"_ZN028$Lambda__ZN7default6func12Ev.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN027$LambdaCommon_010Aggregate8.objKlass"]
@"_ZN027$LambdaCommon_010Aggregate8.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN040$Lambda__ZN7default6func46EbtcTuple2_bjE.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN040$Lambda__ZN7default6func46EbtcTuple2_bjE.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN040$Lambda__ZN7default6func46EbtcTuple2_bjE.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN040$Lambda__ZN7default6func46EbtcTuple2_bjE.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN040$Lambda__ZN7default6func46EbtcTuple2_bjE.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (void (%Unit.Type*, i8 addrspace(1)*, i1, i16, i32, %Tuple2_bjE*)* @_ZN7default6func46EbtcTuple2_bjE to i8*)] #1
@"_ZN040$Lambda__ZN7default6func46EbtcTuple2_bjE.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* bitcast (void (%Unit.Type*, i8 addrspace(1)*, i1, i16, i32, %Tuple2_bjE*)* @_ZN7default6func46EbtcTuple2_bjE to i8*), i8* null, i8* null], i32* null } #2
@"_ZN040$Lambda__ZN7default6func46EbtcTuple2_bjE.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN029$LambdaCommon_4ubtcTuple2_bjE.objKlass"]
@"_ZN029$LambdaCommon_4ubtcTuple2_bjE.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN028$Lambda__ZN7default6func73Ev.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN028$Lambda__ZN7default6func73Ev.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN028$Lambda__ZN7default6func73Ev.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN028$Lambda__ZN7default6func73Ev.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN016$LambdaCommon_0u.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN028$Lambda__ZN7default6func73Ev.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (void (%Unit.Type*, i8 addrspace(1)*)* @_ZN7default6func73Ev to i8*)] #1
@"_ZN028$Lambda__ZN7default6func73Ev.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* bitcast (void (%Unit.Type*, i8 addrspace(1)*)* @_ZN7default6func73Ev to i8*)], i32* null } #2
@"_ZN028$Lambda__ZN7default6func73Ev.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN016$LambdaCommon_0u.objKlass"]
@"_ZN038$Lambda__ZN7default7func281Et6Optionbi.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN038$Lambda__ZN7default7func281Et6Optionbi.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN038$Lambda__ZN7default7func281Et6Optionbi.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN038$Lambda__ZN7default7func281Et6Optionbi.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN037$LambdaCommon_310Aggregate8t6Optionbi.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN038$Lambda__ZN7default7func281Et6Optionbi.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (void (%record._ZN7default10Aggregate8E*, i8 addrspace(1)*, i16, i8 addrspace(1)*, i32)* @_ZN7default7func281Et6Optionbi to i8*)] #1
@"_ZN038$Lambda__ZN7default7func281Et6Optionbi.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* bitcast (void (%record._ZN7default10Aggregate8E*, i8 addrspace(1)*, i16, i8 addrspace(1)*, i32)* @_ZN7default7func281Et6Optionbi to i8*), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], i32* null } #2
@"_ZN038$Lambda__ZN7default7func281Et6Optionbi.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN037$LambdaCommon_310Aggregate8t6Optionbi.objKlass"]
@"_ZN059$Lambda__ZN7default7Class767func491ETuple2_t10Aggregate8Ejb.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN059$Lambda__ZN7default7Class767func491ETuple2_t10Aggregate8Ejb.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN059$Lambda__ZN7default7Class767func491ETuple2_t10Aggregate8Ejb.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN059$Lambda__ZN7default7Class767func491ETuple2_t10Aggregate8Ejb.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN059$Lambda__ZN7default7Class767func491ETuple2_t10Aggregate8Ejb.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (void (%Unit.Type*, i8 addrspace(1)*, %Tuple2_t10Aggregate8E*, i32, i1)* @_ZN7default7Class767func491ETuple2_t10Aggregate8Ejb to i8*)] #1
@"_ZN059$Lambda__ZN7default7Class767func491ETuple2_t10Aggregate8Ejb.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* null, i8* null, i8* null, i8* bitcast (void (%Unit.Type*, i8 addrspace(1)*, %Tuple2_t10Aggregate8E*, i32, i1)* @_ZN7default7Class767func491ETuple2_t10Aggregate8Ejb to i8*), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], i32* null } #2
@"_ZN059$Lambda__ZN7default7Class767func491ETuple2_t10Aggregate8Ejb.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN039$LambdaCommon_3uTuple2_t10Aggregate8Ejb.objKlass"]
@"_ZN039$LambdaCommon_3uTuple2_t10Aggregate8Ejb.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN039$Lambda__ZN7default7Class767func641Emmf.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN039$Lambda__ZN7default7Class767func641Emmf.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN039$Lambda__ZN7default7Class767func641Emmf.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN039$Lambda__ZN7default7Class767func641Emmf.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN019$LambdaCommon_3dmmf.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN039$Lambda__ZN7default7Class767func641Emmf.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (double (i8 addrspace(1)*, i64, i64, float)* @_ZN7default7Class767func641Emmf to i8*)] #1
@"_ZN039$Lambda__ZN7default7Class767func641Emmf.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* bitcast (double (i8 addrspace(1)*, i64, i64, float)* @_ZN7default7Class767func641Emmf to i8*), i8* null], i32* null } #2
@"_ZN039$Lambda__ZN7default7Class767func641Emmf.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN019$LambdaCommon_3dmmf.objKlass"]
@"_ZN040$Lambda__ZN7default7Class767func630Ehsjc.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN040$Lambda__ZN7default7Class767func630Ehsjc.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN040$Lambda__ZN7default7Class767func630Ehsjc.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN040$Lambda__ZN7default7Class767func630Ehsjc.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN020$LambdaCommon_4dhsjc.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN040$Lambda__ZN7default7Class767func630Ehsjc.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (double (i8 addrspace(1)*, i8, i16, i32, i32)* @_ZN7default7Class767func630Ehsjc to i8*)] #1
@"_ZN040$Lambda__ZN7default7Class767func630Ehsjc.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* bitcast (double (i8 addrspace(1)*, i8, i16, i32, i32)* @_ZN7default7Class767func630Ehsjc to i8*), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], i32* null } #2
@"_ZN040$Lambda__ZN7default7Class767func630Ehsjc.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN020$LambdaCommon_4dhsjc.objKlass"]
@"_ZN037$Lambda__ZN7default7Class767func525Et.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN037$Lambda__ZN7default7Class767func525Et.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN037$Lambda__ZN7default7Class767func525Et.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN037$Lambda__ZN7default7Class767func525Et.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN037$Lambda__ZN7default7Class767func525Et.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (void (%Unit.Type*, i8 addrspace(1)*, i16)* @_ZN7default7Class767func525Et to i8*)] #1
@"_ZN037$Lambda__ZN7default7Class767func525Et.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* null, i8* null, i8* null, i8* null, i8* bitcast (void (%Unit.Type*, i8 addrspace(1)*, i16)* @_ZN7default7Class767func525Et to i8*), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], i32* null } #2
@"_ZN037$Lambda__ZN7default7Class767func525Et.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN017$LambdaCommon_1ut.objKlass"]
@"_ZN017$LambdaCommon_1ut.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN050$Lambda__ZN7default7Class767func531Em10Aggregate8u.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN050$Lambda__ZN7default7Class767func531Em10Aggregate8u.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN050$Lambda__ZN7default7Class767func531Em10Aggregate8u.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN050$Lambda__ZN7default7Class767func531Em10Aggregate8u.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN050$Lambda__ZN7default7Class767func531Em10Aggregate8u.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (i8 addrspace(1)* (i8 addrspace(1)*, i64, %record._ZN7default10Aggregate8E*, %Unit.Type*)* @_ZN7default7Class767func531Em10Aggregate8u to i8*)] #1
@"_ZN050$Lambda__ZN7default7Class767func531Em10Aggregate8u.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* bitcast (i8 addrspace(1)* (i8 addrspace(1)*, i64, %record._ZN7default10Aggregate8E*, %Unit.Type*)* @_ZN7default7Class767func531Em10Aggregate8u to i8*), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], i32* null } #2
@"_ZN050$Lambda__ZN7default7Class767func531Em10Aggregate8u.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN037$LambdaCommon_36Optionum10Aggregate8u.objKlass"]
@"_ZN037$LambdaCommon_36Optionum10Aggregate8u.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN031$Lambda__ZN7default7func158Etmc.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN031$Lambda__ZN7default7func158Etmc.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN031$Lambda__ZN7default7func158Etmc.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN031$Lambda__ZN7default7func158Etmc.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN031$Lambda__ZN7default7func158Etmc.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (i1 (i8 addrspace(1)*, i16, i64, i32)* @_ZN7default7func158Etmc to i8*)] #1
@"_ZN031$Lambda__ZN7default7func158Etmc.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* null, i8* null, i8* null, i8* null, i8* bitcast (i1 (i8 addrspace(1)*, i16, i64, i32)* @_ZN7default7func158Etmc to i8*), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], i32* null } #2
@"_ZN031$Lambda__ZN7default7func158Etmc.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN019$LambdaCommon_3btmc.objKlass"]
@"_ZN019$LambdaCommon_3btmc.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN076$Lambda__ZN7default12core$FS$core6OptionITuple2_bjE10getOrThrowITuple2_bjEEv.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN076$Lambda__ZN7default12core$FS$core6OptionITuple2_bjE10getOrThrowITuple2_bjEEv.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN076$Lambda__ZN7default12core$FS$core6OptionITuple2_bjE10getOrThrowITuple2_bjEEv.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN076$Lambda__ZN7default12core$FS$core6OptionITuple2_bjE10getOrThrowITuple2_bjEEv.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN042$LambdaCommon_1Tuple2_bjE6OptionTuple2_bjE.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN076$Lambda__ZN7default12core$FS$core6OptionITuple2_bjE10getOrThrowITuple2_bjEEv.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (void (%Tuple2_bjE*, i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionITuple2_bjE10getOrThrowITuple2_bjEEv" to i8*)] #1
@"_ZN076$Lambda__ZN7default12core$FS$core6OptionITuple2_bjE10getOrThrowITuple2_bjEEv.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* bitcast (void (%Tuple2_bjE*, i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionITuple2_bjE10getOrThrowITuple2_bjEEv" to i8*), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], i32* null } #2
@"_ZN076$Lambda__ZN7default12core$FS$core6OptionITuple2_bjE10getOrThrowITuple2_bjEEv.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN042$LambdaCommon_1Tuple2_bjE6OptionTuple2_bjE.objKlass"]
@"_ZN0106$Lambda__ZN7default12core$FS$core6OptionITuple2_bjE10getOrThrowITuple2_bjEE_ZN025$LambdaCommon_09Exception.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN0106$Lambda__ZN7default12core$FS$core6OptionITuple2_bjE10getOrThrowITuple2_bjEE_ZN025$LambdaCommon_09Exception.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN0106$Lambda__ZN7default12core$FS$core6OptionITuple2_bjE10getOrThrowITuple2_bjEE_ZN025$LambdaCommon_09Exception.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN0106$Lambda__ZN7default12core$FS$core6OptionITuple2_bjE10getOrThrowITuple2_bjEE_ZN025$LambdaCommon_09Exception.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN0106$Lambda__ZN7default12core$FS$core6OptionITuple2_bjE10getOrThrowITuple2_bjEE_ZN025$LambdaCommon_09Exception.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (void (%Tuple2_bjE*, i8 addrspace(1)*, i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionITuple2_bjE10getOrThrowITuple2_bjEE_ZN025$LambdaCommon_09Exception" to i8*)] #1
@"_ZN0106$Lambda__ZN7default12core$FS$core6OptionITuple2_bjE10getOrThrowITuple2_bjEE_ZN025$LambdaCommon_09Exception.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* bitcast (void (%Tuple2_bjE*, i8 addrspace(1)*, i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionITuple2_bjE10getOrThrowITuple2_bjEE_ZN025$LambdaCommon_09Exception" to i8*), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], i32* null } #2
@"_ZN0106$Lambda__ZN7default12core$FS$core6OptionITuple2_bjE10getOrThrowITuple2_bjEE_ZN025$LambdaCommon_09Exception.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN073$LambdaCommon_2Tuple2_bjE6OptionTuple2_bjE_ZN025$LambdaCommon_09Exception.objKlass"]
@"_ZN073$LambdaCommon_2Tuple2_bjE6OptionTuple2_bjE_ZN025$LambdaCommon_09Exception.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN058$Lambda__ZN7default12core$FS$core6OptionId10getOrThrowIdEv.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN058$Lambda__ZN7default12core$FS$core6OptionId10getOrThrowIdEv.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN058$Lambda__ZN7default12core$FS$core6OptionId10getOrThrowIdEv.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN058$Lambda__ZN7default12core$FS$core6OptionId10getOrThrowIdEv.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN024$LambdaCommon_1d6Optiond.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN058$Lambda__ZN7default12core$FS$core6OptionId10getOrThrowIdEv.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (double (i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionId10getOrThrowIdEv" to i8*)] #1
@"_ZN058$Lambda__ZN7default12core$FS$core6OptionId10getOrThrowIdEv.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* bitcast (double (i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionId10getOrThrowIdEv" to i8*), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], i32* null } #2
@"_ZN058$Lambda__ZN7default12core$FS$core6OptionId10getOrThrowIdEv.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN024$LambdaCommon_1d6Optiond.objKlass"]
@"_ZN088$Lambda__ZN7default12core$FS$core6OptionId10getOrThrowIdE_ZN025$LambdaCommon_09Exception.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN088$Lambda__ZN7default12core$FS$core6OptionId10getOrThrowIdE_ZN025$LambdaCommon_09Exception.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN088$Lambda__ZN7default12core$FS$core6OptionId10getOrThrowIdE_ZN025$LambdaCommon_09Exception.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN088$Lambda__ZN7default12core$FS$core6OptionId10getOrThrowIdE_ZN025$LambdaCommon_09Exception.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN088$Lambda__ZN7default12core$FS$core6OptionId10getOrThrowIdE_ZN025$LambdaCommon_09Exception.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (double (i8 addrspace(1)*, i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionId10getOrThrowIdE_ZN025$LambdaCommon_09Exception" to i8*)] #1
@"_ZN088$Lambda__ZN7default12core$FS$core6OptionId10getOrThrowIdE_ZN025$LambdaCommon_09Exception.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* bitcast (double (i8 addrspace(1)*, i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionId10getOrThrowIdE_ZN025$LambdaCommon_09Exception" to i8*), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], i32* null } #2
@"_ZN088$Lambda__ZN7default12core$FS$core6OptionId10getOrThrowIdE_ZN025$LambdaCommon_09Exception.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN055$LambdaCommon_2d6Optiond_ZN025$LambdaCommon_09Exception.objKlass"]
@"_ZN055$LambdaCommon_2d6Optiond_ZN025$LambdaCommon_09Exception.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN072$Lambda__ZN7default12core$FS$core6OptionI7Class7610getOrThrowI7Class76Ev.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN072$Lambda__ZN7default12core$FS$core6OptionI7Class7610getOrThrowI7Class76Ev.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN072$Lambda__ZN7default12core$FS$core6OptionI7Class7610getOrThrowI7Class76Ev.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN072$Lambda__ZN7default12core$FS$core6OptionI7Class7610getOrThrowI7Class76Ev.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN072$Lambda__ZN7default12core$FS$core6OptionI7Class7610getOrThrowI7Class76Ev.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (i8 addrspace(1)* (i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionI7Class7610getOrThrowI7Class76Ev" to i8*)] #1
@"_ZN072$Lambda__ZN7default12core$FS$core6OptionI7Class7610getOrThrowI7Class76Ev.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* bitcast (i8 addrspace(1)* (i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionI7Class7610getOrThrowI7Class76Ev" to i8*), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], i32* null } #2
@"_ZN072$Lambda__ZN7default12core$FS$core6OptionI7Class7610getOrThrowI7Class76Ev.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN038$LambdaCommon_17Class766Option7Class76.objKlass"]
@"_ZN038$LambdaCommon_17Class766Option7Class76.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN0102$Lambda__ZN7default12core$FS$core6OptionI7Class7610getOrThrowI7Class76E_ZN025$LambdaCommon_09Exception.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN0102$Lambda__ZN7default12core$FS$core6OptionI7Class7610getOrThrowI7Class76E_ZN025$LambdaCommon_09Exception.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN0102$Lambda__ZN7default12core$FS$core6OptionI7Class7610getOrThrowI7Class76E_ZN025$LambdaCommon_09Exception.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN0102$Lambda__ZN7default12core$FS$core6OptionI7Class7610getOrThrowI7Class76E_ZN025$LambdaCommon_09Exception.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN069$LambdaCommon_27Class766Option7Class76_ZN025$LambdaCommon_09Exception.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN0102$Lambda__ZN7default12core$FS$core6OptionI7Class7610getOrThrowI7Class76E_ZN025$LambdaCommon_09Exception.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (i8 addrspace(1)* (i8 addrspace(1)*, i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionI7Class7610getOrThrowI7Class76E_ZN025$LambdaCommon_09Exception" to i8*)] #1
@"_ZN0102$Lambda__ZN7default12core$FS$core6OptionI7Class7610getOrThrowI7Class76E_ZN025$LambdaCommon_09Exception.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* bitcast (i8 addrspace(1)* (i8 addrspace(1)*, i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionI7Class7610getOrThrowI7Class76E_ZN025$LambdaCommon_09Exception" to i8*), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], i32* null } #2
@"_ZN0102$Lambda__ZN7default12core$FS$core6OptionI7Class7610getOrThrowI7Class76E_ZN025$LambdaCommon_09Exception.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN069$LambdaCommon_27Class766Option7Class76_ZN025$LambdaCommon_09Exception.objKlass"]
@"_ZN058$Lambda__ZN7default12core$FS$core6OptionIf10getOrThrowIfEv.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN058$Lambda__ZN7default12core$FS$core6OptionIf10getOrThrowIfEv.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN058$Lambda__ZN7default12core$FS$core6OptionIf10getOrThrowIfEv.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN058$Lambda__ZN7default12core$FS$core6OptionIf10getOrThrowIfEv.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN024$LambdaCommon_1f6Optionf.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN058$Lambda__ZN7default12core$FS$core6OptionIf10getOrThrowIfEv.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (float (i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionIf10getOrThrowIfEv" to i8*)] #1
@"_ZN058$Lambda__ZN7default12core$FS$core6OptionIf10getOrThrowIfEv.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* bitcast (float (i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionIf10getOrThrowIfEv" to i8*), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], i32* null } #2
@"_ZN058$Lambda__ZN7default12core$FS$core6OptionIf10getOrThrowIfEv.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN024$LambdaCommon_1f6Optionf.objKlass"]
@"_ZN088$Lambda__ZN7default12core$FS$core6OptionIf10getOrThrowIfE_ZN025$LambdaCommon_09Exception.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN088$Lambda__ZN7default12core$FS$core6OptionIf10getOrThrowIfE_ZN025$LambdaCommon_09Exception.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN088$Lambda__ZN7default12core$FS$core6OptionIf10getOrThrowIfE_ZN025$LambdaCommon_09Exception.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN088$Lambda__ZN7default12core$FS$core6OptionIf10getOrThrowIfE_ZN025$LambdaCommon_09Exception.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN088$Lambda__ZN7default12core$FS$core6OptionIf10getOrThrowIfE_ZN025$LambdaCommon_09Exception.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (float (i8 addrspace(1)*, i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionIf10getOrThrowIfE_ZN025$LambdaCommon_09Exception" to i8*)] #1
@"_ZN088$Lambda__ZN7default12core$FS$core6OptionIf10getOrThrowIfE_ZN025$LambdaCommon_09Exception.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* bitcast (float (i8 addrspace(1)*, i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionIf10getOrThrowIfE_ZN025$LambdaCommon_09Exception" to i8*)], i32* null } #2
@"_ZN088$Lambda__ZN7default12core$FS$core6OptionIf10getOrThrowIfE_ZN025$LambdaCommon_09Exception.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN055$LambdaCommon_2f6Optionf_ZN025$LambdaCommon_09Exception.objKlass"]
@"_ZN055$LambdaCommon_2f6Optionf_ZN025$LambdaCommon_09Exception.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN072$Lambda__ZN7default12core$FS$core6OptionI6Optionu10getOrThrowI6OptionuEv.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN072$Lambda__ZN7default12core$FS$core6OptionI6Optionu10getOrThrowI6OptionuEv.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN072$Lambda__ZN7default12core$FS$core6OptionI6Optionu10getOrThrowI6OptionuEv.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN072$Lambda__ZN7default12core$FS$core6OptionI6Optionu10getOrThrowI6OptionuEv.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN038$LambdaCommon_16Optionu6Option6Optionu.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN072$Lambda__ZN7default12core$FS$core6OptionI6Optionu10getOrThrowI6OptionuEv.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (i8 addrspace(1)* (i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionI6Optionu10getOrThrowI6OptionuEv" to i8*)] #1
@"_ZN072$Lambda__ZN7default12core$FS$core6OptionI6Optionu10getOrThrowI6OptionuEv.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* bitcast (i8 addrspace(1)* (i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionI6Optionu10getOrThrowI6OptionuEv" to i8*), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], i32* null } #2
@"_ZN072$Lambda__ZN7default12core$FS$core6OptionI6Optionu10getOrThrowI6OptionuEv.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN038$LambdaCommon_16Optionu6Option6Optionu.objKlass"]
@"_ZN0102$Lambda__ZN7default12core$FS$core6OptionI6Optionu10getOrThrowI6OptionuE_ZN025$LambdaCommon_09Exception.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN0102$Lambda__ZN7default12core$FS$core6OptionI6Optionu10getOrThrowI6OptionuE_ZN025$LambdaCommon_09Exception.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN0102$Lambda__ZN7default12core$FS$core6OptionI6Optionu10getOrThrowI6OptionuE_ZN025$LambdaCommon_09Exception.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN0102$Lambda__ZN7default12core$FS$core6OptionI6Optionu10getOrThrowI6OptionuE_ZN025$LambdaCommon_09Exception.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN0102$Lambda__ZN7default12core$FS$core6OptionI6Optionu10getOrThrowI6OptionuE_ZN025$LambdaCommon_09Exception.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (i8 addrspace(1)* (i8 addrspace(1)*, i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionI6Optionu10getOrThrowI6OptionuE_ZN025$LambdaCommon_09Exception" to i8*)] #1
@"_ZN0102$Lambda__ZN7default12core$FS$core6OptionI6Optionu10getOrThrowI6OptionuE_ZN025$LambdaCommon_09Exception.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* null, i8* null, i8* null, i8* null, i8* bitcast (i8 addrspace(1)* (i8 addrspace(1)*, i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionI6Optionu10getOrThrowI6OptionuE_ZN025$LambdaCommon_09Exception" to i8*), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], i32* null } #2
@"_ZN0102$Lambda__ZN7default12core$FS$core6OptionI6Optionu10getOrThrowI6OptionuE_ZN025$LambdaCommon_09Exception.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN069$LambdaCommon_26Optionu6Option6Optionu_ZN025$LambdaCommon_09Exception.objKlass"]
@"_ZN069$LambdaCommon_26Optionu6Option6Optionu_ZN025$LambdaCommon_09Exception.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN080$Lambda__ZN7default12core$FS$core6OptionI10Aggregate810getOrThrowI10Aggregate8Ev.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN080$Lambda__ZN7default12core$FS$core6OptionI10Aggregate810getOrThrowI10Aggregate8Ev.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN080$Lambda__ZN7default12core$FS$core6OptionI10Aggregate810getOrThrowI10Aggregate8Ev.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN080$Lambda__ZN7default12core$FS$core6OptionI10Aggregate810getOrThrowI10Aggregate8Ev.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN046$LambdaCommon_110Aggregate86Option10Aggregate8.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN080$Lambda__ZN7default12core$FS$core6OptionI10Aggregate810getOrThrowI10Aggregate8Ev.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (void (%record._ZN7default10Aggregate8E*, i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionI10Aggregate810getOrThrowI10Aggregate8Ev" to i8*)] #1
@"_ZN080$Lambda__ZN7default12core$FS$core6OptionI10Aggregate810getOrThrowI10Aggregate8Ev.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* bitcast (void (%record._ZN7default10Aggregate8E*, i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionI10Aggregate810getOrThrowI10Aggregate8Ev" to i8*), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], i32* null } #2
@"_ZN080$Lambda__ZN7default12core$FS$core6OptionI10Aggregate810getOrThrowI10Aggregate8Ev.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN046$LambdaCommon_110Aggregate86Option10Aggregate8.objKlass"]
@"_ZN0110$Lambda__ZN7default12core$FS$core6OptionI10Aggregate810getOrThrowI10Aggregate8E_ZN025$LambdaCommon_09Exception.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN0110$Lambda__ZN7default12core$FS$core6OptionI10Aggregate810getOrThrowI10Aggregate8E_ZN025$LambdaCommon_09Exception.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN0110$Lambda__ZN7default12core$FS$core6OptionI10Aggregate810getOrThrowI10Aggregate8E_ZN025$LambdaCommon_09Exception.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN0110$Lambda__ZN7default12core$FS$core6OptionI10Aggregate810getOrThrowI10Aggregate8E_ZN025$LambdaCommon_09Exception.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN077$LambdaCommon_210Aggregate86Option10Aggregate8_ZN025$LambdaCommon_09Exception.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN0110$Lambda__ZN7default12core$FS$core6OptionI10Aggregate810getOrThrowI10Aggregate8E_ZN025$LambdaCommon_09Exception.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (void (%record._ZN7default10Aggregate8E*, i8 addrspace(1)*, i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionI10Aggregate810getOrThrowI10Aggregate8E_ZN025$LambdaCommon_09Exception" to i8*)] #1
@"_ZN0110$Lambda__ZN7default12core$FS$core6OptionI10Aggregate810getOrThrowI10Aggregate8E_ZN025$LambdaCommon_09Exception.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* bitcast (void (%record._ZN7default10Aggregate8E*, i8 addrspace(1)*, i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionI10Aggregate810getOrThrowI10Aggregate8E_ZN025$LambdaCommon_09Exception" to i8*), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], i32* null } #2
@"_ZN0110$Lambda__ZN7default12core$FS$core6OptionI10Aggregate810getOrThrowI10Aggregate8E_ZN025$LambdaCommon_09Exception.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN077$LambdaCommon_210Aggregate86Option10Aggregate8_ZN025$LambdaCommon_09Exception.objKlass"]
@"_ZN058$Lambda__ZN7default12core$FS$core6OptionIb10getOrThrowIbEv.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN058$Lambda__ZN7default12core$FS$core6OptionIb10getOrThrowIbEv.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN058$Lambda__ZN7default12core$FS$core6OptionIb10getOrThrowIbEv.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN058$Lambda__ZN7default12core$FS$core6OptionIb10getOrThrowIbEv.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN058$Lambda__ZN7default12core$FS$core6OptionIb10getOrThrowIbEv.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (i1 (i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionIb10getOrThrowIbEv" to i8*)] #1
@"_ZN058$Lambda__ZN7default12core$FS$core6OptionIb10getOrThrowIbEv.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* bitcast (i1 (i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionIb10getOrThrowIbEv" to i8*), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], i32* null } #2
@"_ZN058$Lambda__ZN7default12core$FS$core6OptionIb10getOrThrowIbEv.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN024$LambdaCommon_1b6Optionb.objKlass"]
@"_ZN024$LambdaCommon_1b6Optionb.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN088$Lambda__ZN7default12core$FS$core6OptionIb10getOrThrowIbE_ZN025$LambdaCommon_09Exception.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN088$Lambda__ZN7default12core$FS$core6OptionIb10getOrThrowIbE_ZN025$LambdaCommon_09Exception.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN088$Lambda__ZN7default12core$FS$core6OptionIb10getOrThrowIbE_ZN025$LambdaCommon_09Exception.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN088$Lambda__ZN7default12core$FS$core6OptionIb10getOrThrowIbE_ZN025$LambdaCommon_09Exception.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN088$Lambda__ZN7default12core$FS$core6OptionIb10getOrThrowIbE_ZN025$LambdaCommon_09Exception.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (i1 (i8 addrspace(1)*, i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionIb10getOrThrowIbE_ZN025$LambdaCommon_09Exception" to i8*)] #1
@"_ZN088$Lambda__ZN7default12core$FS$core6OptionIb10getOrThrowIbE_ZN025$LambdaCommon_09Exception.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* bitcast (i1 (i8 addrspace(1)*, i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionIb10getOrThrowIbE_ZN025$LambdaCommon_09Exception" to i8*), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], i32* null } #2
@"_ZN088$Lambda__ZN7default12core$FS$core6OptionIb10getOrThrowIbE_ZN025$LambdaCommon_09Exception.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN055$LambdaCommon_2b6Optionb_ZN025$LambdaCommon_09Exception.objKlass"]
@"_ZN055$LambdaCommon_2b6Optionb_ZN025$LambdaCommon_09Exception.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN058$Lambda__ZN7default12core$FS$core6OptionIu10getOrThrowIuEv.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN058$Lambda__ZN7default12core$FS$core6OptionIu10getOrThrowIuEv.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN058$Lambda__ZN7default12core$FS$core6OptionIu10getOrThrowIuEv.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN058$Lambda__ZN7default12core$FS$core6OptionIu10getOrThrowIuEv.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN058$Lambda__ZN7default12core$FS$core6OptionIu10getOrThrowIuEv.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (void (%Unit.Type*, i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionIu10getOrThrowIuEv" to i8*)] #1
@"_ZN058$Lambda__ZN7default12core$FS$core6OptionIu10getOrThrowIuEv.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* bitcast (void (%Unit.Type*, i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionIu10getOrThrowIuEv" to i8*), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], i32* null } #2
@"_ZN058$Lambda__ZN7default12core$FS$core6OptionIu10getOrThrowIuEv.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN024$LambdaCommon_1u6Optionu.objKlass"]
@"_ZN024$LambdaCommon_1u6Optionu.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN088$Lambda__ZN7default12core$FS$core6OptionIu10getOrThrowIuE_ZN025$LambdaCommon_09Exception.objKlass" = internal global %KlassInfo { i32 0, i32 0, %BitMap* null, %KlassInfo* @Object.objKlass, i8** getelementptr inbounds ([2 x i8*], [2 x i8*]* @"_ZN088$Lambda__ZN7default12core$FS$core6OptionIu10getOrThrowIuE_ZN025$LambdaCommon_09Exception.vtable", i32 0, i32 0), i64* bitcast ({ [23 x i8*], i32* }* @"_ZN088$Lambda__ZN7default12core$FS$core6OptionIu10getOrThrowIuE_ZN025$LambdaCommon_09Exception.itable" to i64*), i32 1, %KlassInfo** getelementptr inbounds ([1 x %KlassInfo*], [1 x %KlassInfo*]* @"_ZN088$Lambda__ZN7default12core$FS$core6OptionIu10getOrThrowIuE_ZN025$LambdaCommon_09Exception.interfaces", i32 0, i32 0) }, !RelatedType !6 #0
@"_ZN055$LambdaCommon_2u6Optionu_ZN025$LambdaCommon_09Exception.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@"_ZN088$Lambda__ZN7default12core$FS$core6OptionIu10getOrThrowIuE_ZN025$LambdaCommon_09Exception.vtable" = internal global [2 x i8*] [i8* null, i8* bitcast (void (%Unit.Type*, i8 addrspace(1)*, i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionIu10getOrThrowIuE_ZN025$LambdaCommon_09Exception" to i8*)] #1
@"_ZN088$Lambda__ZN7default12core$FS$core6OptionIu10getOrThrowIuE_ZN025$LambdaCommon_09Exception.itable" = internal global { [23 x i8*], i32* } { [23 x i8*] [i8* null, i8* null, i8* null, i8* bitcast (void (%Unit.Type*, i8 addrspace(1)*, i8 addrspace(1)*, i8 addrspace(1)*)* @"_ZN7default12core$FS$core6OptionIu10getOrThrowIuE_ZN025$LambdaCommon_09Exception" to i8*), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], i32* null } #2
@"_ZN088$Lambda__ZN7default12core$FS$core6OptionIu10getOrThrowIuE_ZN025$LambdaCommon_09Exception.interfaces" = internal global [1 x %KlassInfo*] [%KlassInfo* @"_ZN055$LambdaCommon_2u6Optionu_ZN025$LambdaCommon_09Exception.objKlass"]
@"_ZN025$LambdaCommon_09Exception.objKlass" = weak_odr global %KlassInfo zeroinitializer, !RelatedType !21 #0
@_ZN7default5var39E = global %Unit.Type zeroinitializer #3
@_ZN7default5var99E = global i1 false #3
@_ZN7default6var104E = global i1 false, align 4 #3
@_ZN7default6var126IuE = global i8 addrspace(1)* null #3
@_ZN7default6var185E = global i1 false #3
@_ZN7default6var221E = global i16 0 #3
@_ZN7default6var229E = global i32 0 #3
@_ZN7default6var248E = global i64 0 #3
@_ZN7default6var268E = global i8 addrspace(1)* null #3
@_ZN7default6var278E = global float 0.000000e+00 #3
@_ZN7default6var354E = global %record._ZN7default10Aggregate8E zeroinitializer #3
@_ZN7default6var383E = global i32 0 #3
@_ZN7default6var399E = global i1 false #3
@_ZN7default6var404E = global i8 0 #3
@_ZN7default6var469E = global i16 0 #3
@_ZN7default6var474E = global i32 0 #3
@_ZN7default6var479IsdhE = global %Tuple3_sdhE zeroinitializer #3
@_ZN7default6var555E = global i8 0 #3
@_ZN7default6var568E = global i1 false, align 4 #3
@_ZN7default6var581E = global i32 74, align 4 #3
@_ZN7default6var594E = global double 1.040000e+02, align 4 #3
@_ZN7default6var661IuE = global i8 addrspace(1)* null #3
@_ZN7default6var686E = global i1 false #3
@_ZN7default6var730IbjE = global %Tuple2_bjE zeroinitializer #3
@_ZN7default6var781I10Aggregate8E = global i8 addrspace(1)* null #3
@_ZN7default6var838E = global i8 0 #3
@_ZN7default6var862I6OptionuE = global i8 addrspace(1)* null #3
@_ZN7default6var935IfE = global i8 addrspace(1)* null #3
@_ZN7default6var942I7Class76E = global i8 addrspace(1)* null #3
@_ZN7default7var1038Iu6Option10Aggregate8jE = global %Tuple3_u6Option10Aggregate8jE zeroinitializer #3
@_ZN7default7var1050E = global i64 -107, align 4 #3
@_ZN7default7var1059E = global %Unit.Type zeroinitializer #3
@_ZN7default10Aggregate87var1028IbE = global i8 addrspace(1)* null #3
@_ZN7default7Class766var506E = global i1 false #3
@_ZN7default7Class766var602IdE = global i8 addrspace(1)* null #3
@_ZN7default7Class766var735ITuple2_bjEE = global i8 addrspace(1)* null #3
@_ZN7default7Class766var791E = global i16 0 #3
@_ZN7default7Class766var938E = global float 0.000000e+00 #3
@_ZN7default12Aggregate453IGT1EGT2E6var458IuE = global i8 addrspace(1)* null #3
@_ZN7default12Aggregate423IGT1EGT2E6var428E = global i1 false #3
@Unit.Val = weak_odr global %Unit.Type zeroinitializer #3
@"_ZN7default13$tmp_global$1" = global i1 true, align 4 #3
@"_ZN7default13$tmp_global$2" = global i8 addrspace(1)* null #3
@"_ZN7default13$tmp_global$3" = global i8 addrspace(1)* null #3
@"_ZN7default13$tmp_global$4" = global %Unit.Type zeroinitializer #3
@"_ZN7default13$tmp_global$5" = global %Unit.Type zeroinitializer #3
@"_ZN7default13$tmp_global$6" = global i1 false #3
@"_ZN7default13$tmp_global$7" = global i1 false, align 4 #3
@"_ZN7default13$tmp_global$8" = global i1 false, align 4 #3
@"_ZN7default13$tmp_global$9" = global i8 addrspace(1)* null #3
@"_ZN7default14$tmp_global$10" = global i8 addrspace(1)* null #3
@"_ZN7default14$tmp_global$11" = global i8 addrspace(1)* null #3
@"_ZN7default14$tmp_global$12" = global %Unit.Type zeroinitializer #3
@"_ZN7default14$tmp_global$13" = global %Unit.Type zeroinitializer #3
@"_ZN7default14$tmp_global$14" = global %Unit.Type zeroinitializer #3
@"_ZN7default14$tmp_global$15" = global i1 false, align 4 #3
@"_ZN7default14$tmp_global$16" = global i8 addrspace(1)* null #3
@"_ZN7default14$tmp_global$17" = global i8 addrspace(1)* null #3
@"_ZN7default14$tmp_global$18" = global %record._ZN7default10Aggregate8E zeroinitializer #3
@"_ZN7default14$tmp_global$19" = global %record._ZN7default10Aggregate8E zeroinitializer #3
@"_ZN7default14$tmp_global$20" = global i8 addrspace(1)* null #3
@"_ZN7default14$tmp_global$21" = global i8 addrspace(1)* null #3
@"_ZN7default14$tmp_global$22" = global i8 addrspace(1)* null #3
@"_ZN7default14$tmp_global$23" = global i8 addrspace(1)* null #3
@"_ZN7default14$tmp_global$24" = global i8 addrspace(1)* null #3
@"_ZN7default14$tmp_global$25" = global i8 addrspace(1)* null #3
@"_ZN7default14$tmp_global$26" = global i8 addrspace(1)* null #3
@"_ZN7default14$tmp_global$27" = global i8 addrspace(1)* null #3
@"_ZN7default14$tmp_global$28" = global i8 addrspace(1)* null #3
@"_ZN7default14$tmp_global$29" = global i8 addrspace(1)* null #3
@"_ZN7default14$tmp_global$30" = global i8 addrspace(1)* null #3
@"_ZN7default14$tmp_global$31" = global %record._ZN7default10Aggregate8E zeroinitializer #3
@"_ZN7default14$tmp_global$32" = global i1 false, align 4 #3
@"_ZN7default14$tmp_global$33" = global i8 addrspace(1)* null #3
@"_ZN7default14$tmp_global$34" = global double 0.000000e+00 #3
@"_ZN7default14$tmp_global$35" = global i8 addrspace(1)* null #3
@"_ZN7default14$tmp_global$36" = global %Unit.Type zeroinitializer #3
@"_ZN7default14$tmp_global$37" = global i1 true, align 4 #3
@Int64.arrayKlass = weak_odr global %KlassInfo zeroinitializer, !RelatedType !22 #0
@.str = private unnamed_addr constant [7 x i8] c"call$0\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"call$0\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"call$0\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"call$0\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"call$0\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"call$0\00", align 1
@.str.6 = private unnamed_addr constant [7 x i8] c"call$0\00", align 1
@.str.7 = private unnamed_addr constant [7 x i8] c"call$0\00", align 1

define void @default_global_init() gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %if.value86 = alloca i1
  %if.value82 = alloca i8 addrspace(1)*
  %if.value78 = alloca i8 addrspace(1)*
  %if.value74 = alloca i1
  %callRet73 = alloca %Tuple3_u6Option10Aggregate8jE
  %if.value69 = alloca i8 addrspace(1)*
  %if.value65 = alloca i8 addrspace(1)*
  %if.value61 = alloca i8 addrspace(1)*
  %if.value57 = alloca i8 addrspace(1)*
  %if.value53 = alloca i8 addrspace(1)*
  %if.value49 = alloca i8 addrspace(1)*
  %if.value45 = alloca i8 addrspace(1)*
  %if.value41 = alloca i8 addrspace(1)*
  %callRet40 = alloca %Tuple2_bjE
  %if.value36 = alloca i1
  %if.value32 = alloca i8 addrspace(1)*
  %if.value28 = alloca i8 addrspace(1)*
  %if.value24 = alloca i8 addrspace(1)*
  %callRet23 = alloca %Tuple3_sdhE
  %if.value19 = alloca i1
  %callRet = alloca %record._ZN7default10Aggregate8E
  %if.value15 = alloca i1
  %if.value11 = alloca i1
  %if.value7 = alloca i8 addrspace(1)*
  %if.value3 = alloca i8 addrspace(1)*
  %if.value = alloca i1
  call void @"core/core_global_init"()
  %0 = load i1, i1* @has_invoke_default_global_init
  br i1 %0, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  store i1 true, i1* @has_invoke_default_global_init
  %1 = bitcast %Unit.Type* @_ZN7default5var39E to i8*
  %2 = bitcast %Unit.Type* @Unit.Val to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 %2, i64 1, i1 false)
  br i1 false, label %if.then1, label %if.else

if.then1:                                         ; preds = %if.end
  store i1 true, i1* %if.value
  br label %if.end2

if.else:                                          ; preds = %if.end
  store i1 false, i1* %if.value
  br label %if.end2

if.end2:                                          ; preds = %if.else, %if.then1
  %3 = load i1, i1* %if.value
  store i1 %3, i1* @_ZN7default5var99E
  %4 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE.init"(i64 1)
  store i8 addrspace(1)* %4, i8 addrspace(1)** @"_ZN7default13$tmp_global$3"
  br i1 false, label %if.then8, label %if.else9
  br i1 false, label %if.then4, label %if.else5

if.then4:                                         ; preds = %if.end2
  %5 = load i8 addrspace(1)*, i8 addrspace(1)** @"_ZN7default13$tmp_global$3"
  store %Unit.Type zeroinitializer, %Unit.Type* @"_ZN7default13$tmp_global$4"
  %6 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE$Some1.init"(i64 0, %Unit.Type* @"_ZN7default13$tmp_global$4")
  store i8 addrspace(1)* %6, i8 addrspace(1)** %if.value3
  br label %if.end6

if.else5:                                         ; preds = %if.end2
  %7 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE.init"(i64 1)
  store i8 addrspace(1)* %7, i8 addrspace(1)** %if.value3
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  %8 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value3
  store i8 addrspace(1)* %8, i8 addrspace(1)** @"_ZN7default13$tmp_global$2"

if.then8:                                         ; preds = %if.end2
  %9 = load i8 addrspace(1)*, i8 addrspace(1)** @"_ZN7default13$tmp_global$2"
  store %Unit.Type zeroinitializer, %Unit.Type* @"_ZN7default13$tmp_global$5"
  %10 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE$Some1.init"(i64 0, %Unit.Type* @"_ZN7default13$tmp_global$5")
  store i8 addrspace(1)* %10, i8 addrspace(1)** %if.value7
  br label %if.end10

if.else9:                                         ; preds = %if.end2
  %11 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE.init"(i64 1)
  store i8 addrspace(1)* %11, i8 addrspace(1)** %if.value7
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %if.then8
  %12 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value7
  store i8 addrspace(1)* %12, i8 addrspace(1)** @_ZN7default6var126IuE
  br i1 true, label %if.then16, label %if.else17
  br i1 false, label %if.then12, label %if.else13

if.then12:                                        ; preds = %if.end10
  store i1 true, i1* %if.value11
  br label %if.end14

if.else13:                                        ; preds = %if.end10
  store i1 false, i1* %if.value11
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %if.then12
  %13 = load i1, i1* %if.value11
  store i1 %13, i1* @"_ZN7default13$tmp_global$6"

if.then16:                                        ; preds = %if.end10
  store i1 true, i1* %if.value15
  br label %if.end18

if.else17:                                        ; preds = %if.end10
  store i1 false, i1* %if.value15
  br label %if.end18

if.end18:                                         ; preds = %if.else17, %if.then16
  %14 = load i1, i1* %if.value15
  store i1 %14, i1* @_ZN7default6var185E
  store i16 74, i16* @_ZN7default6var221E
  store i32 -4, i32* @_ZN7default6var229E
  store i64 5, i64* @_ZN7default6var248E
  %15 = call i8 addrspace(1)* @_ZN7default7Class764initEv()
  store i8 addrspace(1)* %15, i8 addrspace(1)** @_ZN7default6var268E
  store float -2.000000e+01, float* @_ZN7default6var278E
  call void @_ZN7default10Aggregate84initEv(%record._ZN7default10Aggregate8E* sret %callRet, i8 addrspace(1)* null)
  %16 = bitcast %record._ZN7default10Aggregate8E* @_ZN7default6var354E to i8*
  %17 = bitcast %record._ZN7default10Aggregate8E* %callRet to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %16, i8* align 1 %17, i64 1, i1 false)
  store i32 5, i32* @_ZN7default6var383E
  br i1 false, label %if.then20, label %if.else21

if.then20:                                        ; preds = %if.end18
  store i1 true, i1* %if.value19
  br label %if.end22

if.else21:                                        ; preds = %if.end18
  store i1 false, i1* %if.value19
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %if.then20
  %18 = load i1, i1* %if.value19
  store i1 %18, i1* @_ZN7default6var399E
  store i8 -91, i8* @_ZN7default6var404E
  store i16 19, i16* @_ZN7default6var469E
  store i32 -34, i32* @_ZN7default6var474E
  call void @Tuple3_sdhE(%Tuple3_sdhE* sret %callRet23, i16 50, double -4.300000e+01, i8 85)
  %19 = bitcast %Tuple3_sdhE* @_ZN7default6var479IsdhE to i8*
  %20 = bitcast %Tuple3_sdhE* %callRet23 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %19, i8* align 8 %20, i64 24, i1 false)
  store i8 -40, i8* @_ZN7default6var555E
  %21 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE$Some1.init"(i64 0, %Unit.Type* @_ZN7default5var39E)
  store i8 addrspace(1)* %21, i8 addrspace(1)** @"_ZN7default14$tmp_global$11"
  br i1 false, label %if.then29, label %if.else30
  br i1 false, label %if.then33, label %if.else34
  br i1 false, label %if.then25, label %if.else26

if.then25:                                        ; preds = %if.end22
  %22 = load i8 addrspace(1)*, i8 addrspace(1)** @"_ZN7default14$tmp_global$11"
  store %Unit.Type zeroinitializer, %Unit.Type* @"_ZN7default14$tmp_global$12"
  %23 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE$Some1.init"(i64 0, %Unit.Type* @"_ZN7default14$tmp_global$12")
  store i8 addrspace(1)* %23, i8 addrspace(1)** %if.value24
  br label %if.end27

if.else26:                                        ; preds = %if.end22
  %24 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE.init"(i64 1)
  store i8 addrspace(1)* %24, i8 addrspace(1)** %if.value24
  br label %if.end27

if.end27:                                         ; preds = %if.else26, %if.then25
  %25 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value24
  store i8 addrspace(1)* %25, i8 addrspace(1)** @"_ZN7default14$tmp_global$10"

if.then29:                                        ; preds = %if.end22
  %26 = load i8 addrspace(1)*, i8 addrspace(1)** @"_ZN7default14$tmp_global$10"
  store %Unit.Type zeroinitializer, %Unit.Type* @"_ZN7default14$tmp_global$13"
  %27 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE$Some1.init"(i64 0, %Unit.Type* @"_ZN7default14$tmp_global$13")
  store i8 addrspace(1)* %27, i8 addrspace(1)** %if.value28
  br label %if.end31

if.else30:                                        ; preds = %if.end22
  %28 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE.init"(i64 1)
  store i8 addrspace(1)* %28, i8 addrspace(1)** %if.value28
  br label %if.end31

if.end31:                                         ; preds = %if.else30, %if.then29
  %29 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value28
  store i8 addrspace(1)* %29, i8 addrspace(1)** @"_ZN7default13$tmp_global$9"

if.then33:                                        ; preds = %if.end22
  %30 = load i8 addrspace(1)*, i8 addrspace(1)** @"_ZN7default13$tmp_global$9"
  store %Unit.Type zeroinitializer, %Unit.Type* @"_ZN7default14$tmp_global$14"
  %31 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE$Some1.init"(i64 0, %Unit.Type* @"_ZN7default14$tmp_global$14")
  store i8 addrspace(1)* %31, i8 addrspace(1)** %if.value32
  br label %if.end35

if.else34:                                        ; preds = %if.end22
  %32 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE.init"(i64 1)
  store i8 addrspace(1)* %32, i8 addrspace(1)** %if.value32
  br label %if.end35

if.end35:                                         ; preds = %if.else34, %if.then33
  %33 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value32
  store i8 addrspace(1)* %33, i8 addrspace(1)** @_ZN7default6var661IuE
  br i1 false, label %if.then37, label %if.else38

if.then37:                                        ; preds = %if.end35
  store i1 true, i1* %if.value36
  br label %if.end39

if.else38:                                        ; preds = %if.end35
  store i1 false, i1* %if.value36
  br label %if.end39

if.end39:                                         ; preds = %if.else38, %if.then37
  %34 = load i1, i1* %if.value36
  store i1 %34, i1* @_ZN7default6var686E
  call void @Tuple2_bjE(%Tuple2_bjE* sret %callRet40, i1 false, i32 217)
  %35 = bitcast %Tuple2_bjE* @_ZN7default6var730IbjE to i8*
  %36 = bitcast %Tuple2_bjE* %callRet40 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %35, i8* align 4 %36, i64 8, i1 false)
  %37 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E$Some1.init"(i64 0, %record._ZN7default10Aggregate8E* @_ZN7default6var354E)
  store i8 addrspace(1)* %37, i8 addrspace(1)** @"_ZN7default14$tmp_global$17"
  br i1 false, label %if.then46, label %if.else47
  br i1 false, label %if.then42, label %if.else43

if.then42:                                        ; preds = %if.end39
  %38 = load i8 addrspace(1)*, i8 addrspace(1)** @"_ZN7default14$tmp_global$17"
  store %record._ZN7default10Aggregate8E zeroinitializer, %record._ZN7default10Aggregate8E* @"_ZN7default14$tmp_global$18"
  %39 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E$Some1.init"(i64 0, %record._ZN7default10Aggregate8E* @"_ZN7default14$tmp_global$18")
  store i8 addrspace(1)* %39, i8 addrspace(1)** %if.value41
  br label %if.end44

if.else43:                                        ; preds = %if.end39
  %40 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E.init"(i64 1)
  store i8 addrspace(1)* %40, i8 addrspace(1)** %if.value41
  br label %if.end44

if.end44:                                         ; preds = %if.else43, %if.then42
  %41 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value41
  store i8 addrspace(1)* %41, i8 addrspace(1)** @"_ZN7default14$tmp_global$16"

if.then46:                                        ; preds = %if.end39
  %42 = load i8 addrspace(1)*, i8 addrspace(1)** @"_ZN7default14$tmp_global$16"
  store %record._ZN7default10Aggregate8E zeroinitializer, %record._ZN7default10Aggregate8E* @"_ZN7default14$tmp_global$19"
  %43 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E$Some1.init"(i64 0, %record._ZN7default10Aggregate8E* @"_ZN7default14$tmp_global$19")
  store i8 addrspace(1)* %43, i8 addrspace(1)** %if.value45
  br label %if.end48

if.else47:                                        ; preds = %if.end39
  %44 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E.init"(i64 1)
  store i8 addrspace(1)* %44, i8 addrspace(1)** %if.value45
  br label %if.end48

if.end48:                                         ; preds = %if.else47, %if.then46
  %45 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value45
  store i8 addrspace(1)* %45, i8 addrspace(1)** @_ZN7default6var781I10Aggregate8E
  store i8 55, i8* @_ZN7default6var838E
  %46 = load i8 addrspace(1)*, i8 addrspace(1)** @_ZN7default6var661IuE
  %47 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI6OptionuE$Some1.init"(i64 0, i8 addrspace(1)* %46)
  store i8 addrspace(1)* %47, i8 addrspace(1)** @"_ZN7default14$tmp_global$23"
  br i1 false, label %if.then54, label %if.else55
  br i1 false, label %if.then58, label %if.else59
  br i1 false, label %if.then62, label %if.else63
  br i1 false, label %if.then50, label %if.else51

if.then50:                                        ; preds = %if.end48
  %48 = load i8 addrspace(1)*, i8 addrspace(1)** @"_ZN7default14$tmp_global$23"
  store i8 addrspace(1)* %48, i8 addrspace(1)** @"_ZN7default14$tmp_global$24"
  %49 = load i8 addrspace(1)*, i8 addrspace(1)** @"_ZN7default14$tmp_global$24"
  %50 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI6OptionuE$Some1.init"(i64 0, i8 addrspace(1)* %49)
  store i8 addrspace(1)* %50, i8 addrspace(1)** %if.value49
  br label %if.end52

if.else51:                                        ; preds = %if.end48
  %51 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI6OptionuE.init"(i64 1)
  store i8 addrspace(1)* %51, i8 addrspace(1)** %if.value49
  br label %if.end52

if.end52:                                         ; preds = %if.else51, %if.then50
  %52 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value49
  store i8 addrspace(1)* %52, i8 addrspace(1)** @"_ZN7default14$tmp_global$22"

if.then54:                                        ; preds = %if.end48
  %53 = load i8 addrspace(1)*, i8 addrspace(1)** @"_ZN7default14$tmp_global$22"
  store i8 addrspace(1)* %53, i8 addrspace(1)** @"_ZN7default14$tmp_global$25"
  %54 = load i8 addrspace(1)*, i8 addrspace(1)** @"_ZN7default14$tmp_global$25"
  %55 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI6OptionuE$Some1.init"(i64 0, i8 addrspace(1)* %54)
  store i8 addrspace(1)* %55, i8 addrspace(1)** %if.value53
  br label %if.end56

if.else55:                                        ; preds = %if.end48
  %56 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI6OptionuE.init"(i64 1)
  store i8 addrspace(1)* %56, i8 addrspace(1)** %if.value53
  br label %if.end56

if.end56:                                         ; preds = %if.else55, %if.then54
  %57 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value53
  store i8 addrspace(1)* %57, i8 addrspace(1)** @"_ZN7default14$tmp_global$21"

if.then58:                                        ; preds = %if.end48
  %58 = load i8 addrspace(1)*, i8 addrspace(1)** @"_ZN7default14$tmp_global$21"
  store i8 addrspace(1)* %58, i8 addrspace(1)** @"_ZN7default14$tmp_global$26"
  %59 = load i8 addrspace(1)*, i8 addrspace(1)** @"_ZN7default14$tmp_global$26"
  %60 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI6OptionuE$Some1.init"(i64 0, i8 addrspace(1)* %59)
  store i8 addrspace(1)* %60, i8 addrspace(1)** %if.value57
  br label %if.end60

if.else59:                                        ; preds = %if.end48
  %61 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI6OptionuE.init"(i64 1)
  store i8 addrspace(1)* %61, i8 addrspace(1)** %if.value57
  br label %if.end60

if.end60:                                         ; preds = %if.else59, %if.then58
  %62 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value57
  store i8 addrspace(1)* %62, i8 addrspace(1)** @"_ZN7default14$tmp_global$20"

if.then62:                                        ; preds = %if.end48
  %63 = load i8 addrspace(1)*, i8 addrspace(1)** @"_ZN7default14$tmp_global$20"
  store i8 addrspace(1)* %63, i8 addrspace(1)** @"_ZN7default14$tmp_global$27"
  %64 = load i8 addrspace(1)*, i8 addrspace(1)** @"_ZN7default14$tmp_global$27"
  %65 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI6OptionuE$Some1.init"(i64 0, i8 addrspace(1)* %64)
  store i8 addrspace(1)* %65, i8 addrspace(1)** %if.value61
  br label %if.end64

if.else63:                                        ; preds = %if.end48
  %66 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI6OptionuE.init"(i64 1)
  store i8 addrspace(1)* %66, i8 addrspace(1)** %if.value61
  br label %if.end64

if.end64:                                         ; preds = %if.else63, %if.then62
  %67 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value61
  store i8 addrspace(1)* %67, i8 addrspace(1)** @_ZN7default6var862I6OptionuE
  %68 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIfE.init"(i64 1)
  store i8 addrspace(1)* %68, i8 addrspace(1)** @_ZN7default6var935IfE
  %69 = load i8 addrspace(1)*, i8 addrspace(1)** @_ZN7default6var268E
  %70 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI7Class76E$Some1.init"(i64 0, i8 addrspace(1)* %69)
  store i8 addrspace(1)* %70, i8 addrspace(1)** @"_ZN7default14$tmp_global$28"
  br i1 false, label %if.then66, label %if.else67

if.then66:                                        ; preds = %if.end64
  %71 = load i8 addrspace(1)*, i8 addrspace(1)** @"_ZN7default14$tmp_global$28"
  store i8 addrspace(1)* %71, i8 addrspace(1)** @"_ZN7default14$tmp_global$29"
  %72 = load i8 addrspace(1)*, i8 addrspace(1)** @"_ZN7default14$tmp_global$29"
  %73 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI7Class76E$Some1.init"(i64 0, i8 addrspace(1)* %72)
  store i8 addrspace(1)* %73, i8 addrspace(1)** %if.value65
  br label %if.end68

if.else67:                                        ; preds = %if.end64
  %74 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI7Class76E.init"(i64 1)
  store i8 addrspace(1)* %74, i8 addrspace(1)** %if.value65
  br label %if.end68

if.end68:                                         ; preds = %if.else67, %if.then66
  %75 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value65
  store i8 addrspace(1)* %75, i8 addrspace(1)** @_ZN7default6var942I7Class76E
  %76 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E$Some1.init"(i64 0, %record._ZN7default10Aggregate8E* @_ZN7default6var354E)
  store i8 addrspace(1)* %76, i8 addrspace(1)** @"_ZN7default14$tmp_global$30"
  br i1 false, label %if.then70, label %if.else71

if.then70:                                        ; preds = %if.end68
  %77 = load i8 addrspace(1)*, i8 addrspace(1)** @"_ZN7default14$tmp_global$30"
  store %record._ZN7default10Aggregate8E zeroinitializer, %record._ZN7default10Aggregate8E* @"_ZN7default14$tmp_global$31"
  %78 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E$Some1.init"(i64 0, %record._ZN7default10Aggregate8E* @"_ZN7default14$tmp_global$31")
  store i8 addrspace(1)* %78, i8 addrspace(1)** %if.value69
  br label %if.end72

if.else71:                                        ; preds = %if.end68
  %79 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E.init"(i64 1)
  store i8 addrspace(1)* %79, i8 addrspace(1)** %if.value69
  br label %if.end72

if.end72:                                         ; preds = %if.else71, %if.then70
  %80 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value69
  call void @Tuple3_u6Option10Aggregate8jE(%Tuple3_u6Option10Aggregate8jE* sret %callRet73, %Unit.Type* @Unit.Val, i8 addrspace(1)* %80, i32 233)
  %81 = bitcast %Tuple3_u6Option10Aggregate8jE* @_ZN7default7var1038Iu6Option10Aggregate8jE to i8*
  %82 = bitcast %Tuple3_u6Option10Aggregate8jE* %callRet73 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %81, i8* align 8 %82, i64 24, i1 false)
  %83 = bitcast %Unit.Type* @_ZN7default7var1059E to i8*
  %84 = bitcast %Unit.Type* @Unit.Val to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %83, i8* align 1 %84, i64 1, i1 false)
  %85 = load i1, i1* @_ZN7default6var185E
  %86 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIbE$Some1.init"(i64 0, i1 %85)
  store i8 addrspace(1)* %86, i8 addrspace(1)** @_ZN7default10Aggregate87var1028IbE
  br i1 false, label %if.then75, label %if.else76

if.then75:                                        ; preds = %if.end72
  store i1 true, i1* %if.value74
  br label %if.end77

if.else76:                                        ; preds = %if.end72
  store i1 false, i1* %if.value74
  br label %if.end77

if.end77:                                         ; preds = %if.else76, %if.then75
  %87 = load i1, i1* %if.value74
  store i1 %87, i1* @_ZN7default7Class766var506E
  %88 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIdE.init"(i64 1)
  store i8 addrspace(1)* %88, i8 addrspace(1)** @"_ZN7default14$tmp_global$33"
  br i1 false, label %if.then79, label %if.else80

if.then79:                                        ; preds = %if.end77
  %89 = load i8 addrspace(1)*, i8 addrspace(1)** @"_ZN7default14$tmp_global$33"
  store double 0.000000e+00, double* @"_ZN7default14$tmp_global$34"
  %90 = load double, double* @"_ZN7default14$tmp_global$34"
  %91 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIdE$Some1.init"(i64 0, double %90)
  store i8 addrspace(1)* %91, i8 addrspace(1)** %if.value78
  br label %if.end81

if.else80:                                        ; preds = %if.end77
  %92 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIdE.init"(i64 1)
  store i8 addrspace(1)* %92, i8 addrspace(1)** %if.value78
  br label %if.end81

if.end81:                                         ; preds = %if.else80, %if.then79
  %93 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value78
  store i8 addrspace(1)* %93, i8 addrspace(1)** @_ZN7default7Class766var602IdE
  %94 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionITuple2_bjEE.init"(i64 1)
  store i8 addrspace(1)* %94, i8 addrspace(1)** @_ZN7default7Class766var735ITuple2_bjEE
  store i16 131, i16* @_ZN7default7Class766var791E
  store float 9.200000e+01, float* @_ZN7default7Class766var938E
  %95 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE$Some1.init"(i64 0, %Unit.Type* @_ZN7default5var39E)
  store i8 addrspace(1)* %95, i8 addrspace(1)** @"_ZN7default14$tmp_global$35"
  br i1 false, label %if.then83, label %if.else84

if.then83:                                        ; preds = %if.end81
  %96 = load i8 addrspace(1)*, i8 addrspace(1)** @"_ZN7default14$tmp_global$35"
  store %Unit.Type zeroinitializer, %Unit.Type* @"_ZN7default14$tmp_global$36"
  %97 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE$Some1.init"(i64 0, %Unit.Type* @"_ZN7default14$tmp_global$36")
  store i8 addrspace(1)* %97, i8 addrspace(1)** %if.value82
  br label %if.end85

if.else84:                                        ; preds = %if.end81
  %98 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE.init"(i64 1)
  store i8 addrspace(1)* %98, i8 addrspace(1)** %if.value82
  br label %if.end85

if.end85:                                         ; preds = %if.else84, %if.then83
  %99 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value82
  store i8 addrspace(1)* %99, i8 addrspace(1)** @_ZN7default12Aggregate453IGT1EGT2E6var458IuE
  br i1 false, label %if.then87, label %if.else88

if.then87:                                        ; preds = %if.end85
  store i1 true, i1* %if.value86
  br label %if.end89

if.else88:                                        ; preds = %if.end85
  store i1 false, i1* %if.value86
  br label %if.end89

if.end89:                                         ; preds = %if.else88, %if.then87
  %100 = load i1, i1* %if.value86
  store i1 %100, i1* @_ZN7default12Aggregate423IGT1EGT2E6var428E
  br label %return

return:                                           ; preds = %if.then, %if.end89
  ret void
}

declare i32 @__ccc_personality_v0(...)

declare void @"core/core_global_init"()

define i8 addrspace(1)* @_ZN7default7Class767func540Eb(i8 addrspace(1)* %this, i1 %namedParam541) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %newVar-compiler = alloca i1
  %if.value5 = alloca i8 addrspace(1)*
  %if.value1 = alloca i8 addrspace(1)*
  %if.value = alloca i8 addrspace(1)*
  %var550 = alloca i8 addrspace(1)*
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %0 = load i1, i1* @_ZN7default6var185E
  %1 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIbE$Some1.init"(i64 0, i1 %0)
  store i8 addrspace(1)* %1, i8 addrspace(1)** %var550
  %2 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default7Class76E addrspace(1)*
  %3 = getelementptr %ObjLayout._ZN7default7Class76E, %ObjLayout._ZN7default7Class76E addrspace(1)* %2, i32 0, i32 2
  %4 = load i1, i1 addrspace(1)* %3
  br i1 %4, label %if.then, label %if.else

if.then:                                          ; preds = %chirblock.body
  %5 = load i8 addrspace(1)*, i8 addrspace(1)** %var550
  store i8 addrspace(1)* %5, i8 addrspace(1)** %if.value
  br label %if.end4

if.else:                                          ; preds = %chirblock.body
  %6 = load i1, i1* @_ZN7default5var99E
  br i1 %6, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.else
  %7 = load i8, i8* @_ZN7default6var555E
  %8 = load i8 addrspace(1)*, i8 addrspace(1)** %var550
  store i8 addrspace(1)* %8, i8 addrspace(1)** %if.value1
  br label %if.end

if.else3:                                         ; preds = %if.else
  %9 = load i8 addrspace(1)*, i8 addrspace(1)** %var550
  store i8 addrspace(1)* %9, i8 addrspace(1)** %if.value1
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %10 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value1
  store i8 addrspace(1)* %10, i8 addrspace(1)** %if.value
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %11 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value
  br i1 false, label %if.then6, label %if.else7

if.then6:                                         ; preds = %if.end4
  store i1 false, i1* %newVar-compiler
  %12 = load i1, i1* %newVar-compiler
  %13 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIbE$Some1.init"(i64 0, i1 %12)
  store i8 addrspace(1)* %13, i8 addrspace(1)** %if.value5
  br label %if.end8

if.else7:                                         ; preds = %if.end4
  %14 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIbE.init"(i64 1)
  store i8 addrspace(1)* %14, i8 addrspace(1)** %if.value5
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %15 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value5
  %16 = load i8 addrspace(1)*, i8 addrspace(1)** @_ZN7default6var126IuE
  ret i8 addrspace(1)* %16

unreachable:                                      ; No predecessors!
  ret i8 addrspace(1)* null
}

define void @_ZN7default7Class767func407E6Option10Aggregate8t6Option10Aggregate8(%record._ZN7default10Aggregate8E* noalias sret, i8 addrspace(1)* %this, i8 addrspace(1)* %namedParam408, i16 %namedParam409, i8 addrspace(1)* %namedParam410) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %callRet4 = alloca %Tuple2_t10Aggregate8E
  %if.value2 = alloca %Tuple2_t10Aggregate8E
  %if.value = alloca %Tuple2_t10Aggregate8E
  %var418 = alloca %Tuple2_t10Aggregate8E
  %callRet1 = alloca %Tuple2_t10Aggregate8E
  %callRet = alloca %record._ZN7default10Aggregate8E
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  call void @_ZN7default10Aggregate84initEv(%record._ZN7default10Aggregate8E* sret %callRet, i8 addrspace(1)* null)
  call void @Tuple2_t10Aggregate8E(%Tuple2_t10Aggregate8E* sret %callRet1, i16 151, %record._ZN7default10Aggregate8E* %callRet)
  %1 = bitcast %Tuple2_t10Aggregate8E* %var418 to i8*
  %2 = bitcast %Tuple2_t10Aggregate8E* %callRet1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %1, i8* align 2 %2, i64 4, i1 false)
  %3 = load i1, i1* @_ZN7default6var399E
  br i1 %3, label %if.then, label %if.else

if.then:                                          ; preds = %chirblock.body
  %4 = bitcast %Tuple2_t10Aggregate8E* %if.value to i8*
  %5 = bitcast %Tuple2_t10Aggregate8E* %var418 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %4, i8* align 2 %5, i64 4, i1 false)
  br label %if.end6

if.else:                                          ; preds = %chirblock.body
  %6 = load i1, i1* @_ZN7default12Aggregate423IGT1EGT2E6var428E
  br i1 %6, label %if.then3, label %if.else5

if.then3:                                         ; preds = %if.else
  call void @Tuple2_t10Aggregate8E(%Tuple2_t10Aggregate8E* sret %callRet4, i16 %namedParam409, %record._ZN7default10Aggregate8E* @_ZN7default6var354E)
  %7 = bitcast %Tuple2_t10Aggregate8E* %if.value2 to i8*
  %8 = bitcast %Tuple2_t10Aggregate8E* %callRet4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %7, i8* align 2 %8, i64 4, i1 false)
  br label %if.end

if.else5:                                         ; preds = %if.else
  %9 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default7Class76E addrspace(1)*
  %10 = getelementptr %ObjLayout._ZN7default7Class76E, %ObjLayout._ZN7default7Class76E addrspace(1)* %9, i32 0, i32 4
  %11 = bitcast %Tuple2_t10Aggregate8E* %if.value2 to i8*
  %12 = bitcast %Tuple2_t10Aggregate8E* %var418 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %11, i8* align 2 %12, i64 4, i1 false)
  br label %if.end

if.end:                                           ; preds = %if.else5, %if.then3
  %13 = bitcast %Tuple2_t10Aggregate8E* %if.value to i8*
  %14 = bitcast %Tuple2_t10Aggregate8E* %if.value2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %13, i8* align 2 %14, i64 4, i1 false)
  br label %if.end6

if.end6:                                          ; preds = %if.end, %if.then
  %15 = getelementptr inbounds %Tuple2_t10Aggregate8E, %Tuple2_t10Aggregate8E* %if.value, i32 0, i32 1
  %16 = bitcast %record._ZN7default10Aggregate8E* %0 to i8*
  %17 = bitcast %record._ZN7default10Aggregate8E* %15 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %16, i8* align 1 %17, i64 1, i1 false)
  ret void

unreachable:                                      ; No predecessors!
  ret void
}

define void @_ZN7default8CrcCheck12getCrcOutputEv(%Unit.Type* noalias sret, i8 addrspace(1)* %this) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %1 = alloca %Unit.Type
  %callRet = alloca %"record._ZN12core$FS$core6StringE"
  %hex_value = alloca i64
  %i = alloca i64
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  store i64 0, i64* %i
  br label %chirblock.start2

chirblock.start2:                                 ; preds = %if.end, %chirblock.body
  br label %chirblock.body3

chirblock.body3:                                  ; preds = %chirblock.start2
  %2 = load i64, i64* %i
  %3 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %4 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %3, i32 0, i32 6
  %5 = load i64, i64 addrspace(1)* %4
  %icmpslt = icmp slt i64 %2, %5
  br i1 %icmpslt, label %if.then, label %if.else

if.then:                                          ; preds = %chirblock.body3
  %6 = call double @pow(double 2.000000e+00, double 2.000000e+00)
  %7 = fptosi double %6 to i128
  %8 = trunc i128 %7 to i64
  %9 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %10 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %9, i32 0, i32 3
  %11 = load i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)* %10
  %12 = load i64, i64* %i
  %13 = call i64 @"_ZN12core$FS$core12core$FS$core0A1_l2[]El"(i8 addrspace(1)* null, i8 addrspace(1)* %11, i64 %12)
  %14 = call i64 @"_ZN12core$FS$core0l11throwingMulEl"(i8 addrspace(1)* null, i64 %8, i64 %13)
  %15 = call double @pow(double 2.000000e+00, double 1.000000e+00)
  %16 = fptosi double %15 to i128
  %17 = trunc i128 %16 to i64
  %18 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %19 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %18, i32 0, i32 3
  %20 = load i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)* %19
  %21 = load i64, i64* %i
  %22 = call i64 @"_ZN12core$FS$core0l11throwingAddEl"(i8 addrspace(1)* null, i64 %21, i64 1)
  %23 = call i64 @"_ZN12core$FS$core12core$FS$core0A1_l2[]El"(i8 addrspace(1)* null, i8 addrspace(1)* %20, i64 %22)
  %24 = call i64 @"_ZN12core$FS$core0l11throwingMulEl"(i8 addrspace(1)* null, i64 %17, i64 %23)
  %25 = call i64 @"_ZN12core$FS$core0l11throwingAddEl"(i8 addrspace(1)* null, i64 %14, i64 %24)
  %26 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %27 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %26, i32 0, i32 3
  %28 = load i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)* %27
  %29 = load i64, i64* %i
  %30 = call i64 @"_ZN12core$FS$core0l11throwingAddEl"(i8 addrspace(1)* null, i64 %29, i64 2)
  %31 = call i64 @"_ZN12core$FS$core12core$FS$core0A1_l2[]El"(i8 addrspace(1)* null, i8 addrspace(1)* %28, i64 %30)
  %32 = call i64 @"_ZN12core$FS$core0l11throwingMulEl"(i8 addrspace(1)* null, i64 1, i64 %31)
  %33 = call i64 @"_ZN12core$FS$core0l11throwingAddEl"(i8 addrspace(1)* null, i64 %25, i64 %32)
  store i64 %33, i64* %hex_value
  %34 = load i64, i64* %hex_value
  call void @"_ZN12core$FS$core0l8toStringEv"(%"record._ZN12core$FS$core6StringE"* sret %callRet, i8 addrspace(1)* null, i64 %34)
  call void @"_ZN12core$FS$core5printE6String"(%Unit.Type* sret %1, i8 addrspace(1)* null, %"record._ZN12core$FS$core6StringE"* %callRet)
  %35 = load i64, i64* %i
  %add = add i64 %35, 3
  store i64 %add, i64* %i
  br label %if.end

if.else:                                          ; preds = %chirblock.body3
  %36 = bitcast %Unit.Type* %1 to i8*
  %37 = bitcast %Unit.Type* @Unit.Val to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %36, i8* align 1 %37, i64 1, i1 false)
  br i1 true, label %chirblock.end, label %unreachable

unreachable:                                      ; preds = %if.else
  br label %if.end

if.end:                                           ; preds = %unreachable, %if.then
  br label %chirblock.start2

chirblock.end:                                    ; preds = %if.else
  ret void

unreachable5:                                     ; No predecessors!
  ret void
}

define void @_ZN7default8CrcCheck8crcCheckEv(%Unit.Type* noalias sret, i8 addrspace(1)* %this) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %1 = alloca %Unit.Type
  %byte_add = alloca i64
  %check_code = alloca i8 addrspace(1)*
  %j = alloca i64
  %i = alloca i64
  %crc_buffer = alloca i8 addrspace(1)*
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %2 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %3 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %2, i32 0, i32 5
  %4 = load i64, i64 addrspace(1)* %3
  %5 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %6 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %5, i32 0, i32 4
  %7 = load i64, i64 addrspace(1)* %6
  %add = add i64 %4, %7
  %sub = sub i64 %add, 1
  %8 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %9 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %8, i32 0, i32 6
  store i64 %sub, i64 addrspace(1)* %9
  %10 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %11 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %10, i32 0, i32 6
  %12 = load i64, i64 addrspace(1)* %11
  %arr.alloc.size.valid = icmp sgt i64 %12, 0
  br i1 %arr.alloc.size.valid, label %arr.alloc.body, label %arr.alloc.empty

arr.alloc.empty:                                  ; preds = %chirblock.body
  br label %arr.alloc.body

arr.alloc.body:                                   ; preds = %arr.alloc.empty, %chirblock.body
  %arr.size = phi i64 [ %12, %chirblock.body ], [ 0, %arr.alloc.empty ]
  %13 = trunc i64 %arr.size to i32
  %14 = call i8 addrspace(1)* @gc.malloc.array(i32 %13, %KlassInfo* @Int64.arrayKlass)
  %15 = bitcast i8 addrspace(1)* %14 to %ArrayLayout.Int64 addrspace(1)*
  store i8 addrspace(1)* %14, i8 addrspace(1)** %crc_buffer
  store i64 0, i64* %i
  br label %chirblock.start2

chirblock.start2:                                 ; preds = %if.end, %arr.alloc.body
  br label %chirblock.body3

chirblock.body3:                                  ; preds = %chirblock.start2
  %16 = load i64, i64* %i
  %17 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %18 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %17, i32 0, i32 5
  %19 = load i64, i64 addrspace(1)* %18
  %icmpslt = icmp slt i64 %16, %19
  br i1 %icmpslt, label %if.then, label %if.else

if.then:                                          ; preds = %chirblock.body3
  %20 = load i8 addrspace(1)*, i8 addrspace(1)** %crc_buffer
  %21 = load i64, i64* %i
  %22 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %23 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %22, i32 0, i32 1
  %24 = load i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)* %23
  %25 = load i64, i64* %i
  %26 = call i64 @"_ZN12core$FS$core12core$FS$core0A1_l2[]El"(i8 addrspace(1)* null, i8 addrspace(1)* %24, i64 %25)
  call void @"_ZN12core$FS$core12core$FS$core0A1_l2[]Ell"(%Unit.Type* sret %1, i8 addrspace(1)* null, i8 addrspace(1)* %20, i64 %21, i64 %26)
  %27 = load i64, i64* %i
  %28 = call i64 @"_ZN12core$FS$core0l11throwingIncEv"(i8 addrspace(1)* null, i64 %27)
  store i64 %28, i64* %i
  br label %if.end

if.else:                                          ; preds = %chirblock.body3
  %29 = bitcast %Unit.Type* %1 to i8*
  %30 = bitcast %Unit.Type* @Unit.Val to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %29, i8* align 1 %30, i64 1, i1 false)
  br i1 true, label %chirblock.end, label %unreachable

unreachable:                                      ; preds = %if.else
  br label %if.end

if.end:                                           ; preds = %unreachable, %if.then
  br label %chirblock.start2

chirblock.end:                                    ; preds = %if.else
  store i64 0, i64* %i
  br label %chirblock.start5

chirblock.start5:                                 ; preds = %if.end29, %chirblock.end
  br label %chirblock.body6

chirblock.body6:                                  ; preds = %chirblock.start5
  %31 = load i64, i64* %i
  %32 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %33 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %32, i32 0, i32 5
  %34 = load i64, i64 addrspace(1)* %33
  %icmpslt8 = icmp slt i64 %31, %34
  br i1 %icmpslt8, label %if.then9, label %if.else27

if.then9:                                         ; preds = %chirblock.body6
  %35 = load i8 addrspace(1)*, i8 addrspace(1)** %crc_buffer
  %36 = load i64, i64* %i
  %37 = call i64 @"_ZN12core$FS$core12core$FS$core0A1_l2[]El"(i8 addrspace(1)* null, i8 addrspace(1)* %35, i64 %36)
  %icmpeq = icmp eq i64 %37, 1
  br i1 %icmpeq, label %if.then11, label %if.else25

if.then11:                                        ; preds = %if.then9
  store i64 0, i64* %j
  br label %chirblock.start13

chirblock.start13:                                ; preds = %if.end23, %if.then11
  br label %chirblock.body14

chirblock.body14:                                 ; preds = %chirblock.start13
  %38 = load i64, i64* %j
  %39 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %40 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %39, i32 0, i32 4
  %41 = load i64, i64 addrspace(1)* %40
  %icmpslt16 = icmp slt i64 %38, %41
  br i1 %icmpslt16, label %if.then17, label %if.else21

if.then17:                                        ; preds = %chirblock.body14
  %42 = load i8 addrspace(1)*, i8 addrspace(1)** %crc_buffer
  %43 = load i64, i64* %j
  %44 = load i64, i64* %i
  %add18 = add i64 %43, %44
  %45 = load i8 addrspace(1)*, i8 addrspace(1)** %crc_buffer
  %46 = load i64, i64* %j
  %47 = load i64, i64* %i
  %add19 = add i64 %46, %47
  %48 = call i64 @"_ZN12core$FS$core12core$FS$core0A1_l2[]El"(i8 addrspace(1)* null, i8 addrspace(1)* %45, i64 %add19)
  %49 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %50 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %49, i32 0, i32 2
  %51 = load i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)* %50
  %52 = load i64, i64* %j
  %53 = call i64 @"_ZN12core$FS$core12core$FS$core0A1_l2[]El"(i8 addrspace(1)* null, i8 addrspace(1)* %51, i64 %52)
  %xor = xor i64 %48, %53
  call void @"_ZN12core$FS$core12core$FS$core0A1_l2[]Ell"(%Unit.Type* sret %1, i8 addrspace(1)* null, i8 addrspace(1)* %42, i64 %add18, i64 %xor)
  %54 = load i64, i64* %j
  %55 = call i64 @"_ZN12core$FS$core0l11throwingIncEv"(i8 addrspace(1)* null, i64 %54)
  store i64 %55, i64* %j
  br label %if.end23

if.else21:                                        ; preds = %chirblock.body14
  %56 = bitcast %Unit.Type* %1 to i8*
  %57 = bitcast %Unit.Type* @Unit.Val to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %56, i8* align 1 %57, i64 1, i1 false)
  br i1 true, label %chirblock.end24, label %unreachable22

unreachable22:                                    ; preds = %if.else21
  br label %if.end23

if.end23:                                         ; preds = %unreachable22, %if.then17
  br label %chirblock.start13

chirblock.end24:                                  ; preds = %if.else21
  br label %if.end26

if.else25:                                        ; preds = %if.then9
  br label %if.end26

if.end26:                                         ; preds = %if.else25, %chirblock.end24
  %58 = load i64, i64* %i
  %59 = call i64 @"_ZN12core$FS$core0l11throwingIncEv"(i8 addrspace(1)* null, i64 %58)
  store i64 %59, i64* %i
  br label %if.end29

if.else27:                                        ; preds = %chirblock.body6
  %60 = bitcast %Unit.Type* %1 to i8*
  %61 = bitcast %Unit.Type* @Unit.Val to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %60, i8* align 1 %61, i64 1, i1 false)
  br i1 true, label %chirblock.end30, label %unreachable28

unreachable28:                                    ; preds = %if.else27
  br label %if.end29

if.end29:                                         ; preds = %unreachable28, %if.end26
  br label %chirblock.start5

chirblock.end30:                                  ; preds = %if.else27
  %62 = load i8 addrspace(1)*, i8 addrspace(1)** %crc_buffer
  %63 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %64 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %63, i32 0, i32 5
  %65 = load i64, i64 addrspace(1)* %64
  %66 = call i8 addrspace(1)* @"_ZN12core$FS$core12core$FS$core5RangeIl4initElllbbb"(i64 %65, i64 9223372036854775807, i64 1, i1 true, i1 false, i1 false)
  %67 = call i8 addrspace(1)* @"_ZN12core$FS$core12core$FS$core0A1_l2[]E5Rangel"(i8 addrspace(1)* null, i8 addrspace(1)* %62, i8 addrspace(1)* %66)
  store i8 addrspace(1)* %67, i8 addrspace(1)** %check_code
  %68 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %69 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %68, i32 0, i32 6
  %70 = load i64, i64 addrspace(1)* %69
  %mod = srem i64 %70, 3
  %71 = call i64 @"_ZN12core$FS$core0l11throwingSubEl"(i8 addrspace(1)* null, i64 3, i64 %mod)
  store i64 %71, i64* %byte_add
  %72 = load i64, i64* %byte_add
  %73 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %74 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %73, i32 0, i32 6
  %75 = load i64, i64 addrspace(1)* %74
  %add31 = add i64 %72, %75
  %76 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %77 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %76, i32 0, i32 6
  store i64 %add31, i64 addrspace(1)* %77
  %78 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %79 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %78, i32 0, i32 6
  %80 = load i64, i64 addrspace(1)* %79
  %arr.alloc.size.valid34 = icmp sgt i64 %80, 0
  br i1 %arr.alloc.size.valid34, label %arr.alloc.body33, label %arr.alloc.empty32

arr.alloc.empty32:                                ; preds = %chirblock.end30
  br label %arr.alloc.body33

arr.alloc.body33:                                 ; preds = %arr.alloc.empty32, %chirblock.end30
  %arr.size35 = phi i64 [ %80, %chirblock.end30 ], [ 0, %arr.alloc.empty32 ]
  %81 = trunc i64 %arr.size35 to i32
  %82 = call i8 addrspace(1)* @gc.malloc.array(i32 %81, %KlassInfo* @Int64.arrayKlass)
  %83 = bitcast i8 addrspace(1)* %82 to %ArrayLayout.Int64 addrspace(1)*
  %84 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %85 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %84, i32 0, i32 3
  call void @llvm.gcwrite.cj(i8 addrspace(1)* %82, i8 addrspace(1)* %this, i8 addrspace(1)* addrspace(1)* %85)
  store i64 0, i64* %i
  br label %chirblock.start37

chirblock.start37:                                ; preds = %if.end55, %arr.alloc.body33
  br label %chirblock.body38

chirblock.body38:                                 ; preds = %chirblock.start37
  %86 = load i64, i64* %i
  %87 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %88 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %87, i32 0, i32 6
  %89 = load i64, i64 addrspace(1)* %88
  %90 = load i64, i64* %byte_add
  %sub40 = sub i64 %89, %90
  %icmpslt41 = icmp slt i64 %86, %sub40
  br i1 %icmpslt41, label %if.then42, label %if.else53

if.then42:                                        ; preds = %chirblock.body38
  %91 = load i64, i64* %i
  %92 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %93 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %92, i32 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93
  %icmpslt44 = icmp slt i64 %91, %94
  br i1 %icmpslt44, label %if.then45, label %if.else48

if.then45:                                        ; preds = %if.then42
  %95 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %96 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %95, i32 0, i32 3
  %97 = load i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)* %96
  %98 = load i64, i64* %i
  %99 = load i64, i64* %byte_add
  %add46 = add i64 %98, %99
  %100 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %101 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %100, i32 0, i32 1
  %102 = load i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)* %101
  %103 = load i64, i64* %i
  %104 = call i64 @"_ZN12core$FS$core12core$FS$core0A1_l2[]El"(i8 addrspace(1)* null, i8 addrspace(1)* %102, i64 %103)
  call void @"_ZN12core$FS$core12core$FS$core0A1_l2[]Ell"(%Unit.Type* sret %1, i8 addrspace(1)* null, i8 addrspace(1)* %97, i64 %add46, i64 %104)
  br label %if.end52

if.else48:                                        ; preds = %if.then42
  %105 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %106 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %105, i32 0, i32 3
  %107 = load i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)* %106
  %108 = load i64, i64* %i
  %109 = load i64, i64* %byte_add
  %add49 = add i64 %108, %109
  %110 = load i8 addrspace(1)*, i8 addrspace(1)** %check_code
  %111 = load i64, i64* %i
  %112 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %113 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %112, i32 0, i32 5
  %114 = load i64, i64 addrspace(1)* %113
  %sub50 = sub i64 %111, %114
  %115 = call i64 @"_ZN12core$FS$core12core$FS$core0A1_l2[]El"(i8 addrspace(1)* null, i8 addrspace(1)* %110, i64 %sub50)
  call void @"_ZN12core$FS$core12core$FS$core0A1_l2[]Ell"(%Unit.Type* sret %1, i8 addrspace(1)* null, i8 addrspace(1)* %107, i64 %add49, i64 %115)
  br label %if.end52

if.end52:                                         ; preds = %if.else48, %if.then45
  %116 = load i64, i64* %i
  %117 = call i64 @"_ZN12core$FS$core0l11throwingIncEv"(i8 addrspace(1)* null, i64 %116)
  store i64 %117, i64* %i
  br label %if.end55

if.else53:                                        ; preds = %chirblock.body38
  %118 = bitcast %Unit.Type* %1 to i8*
  %119 = bitcast %Unit.Type* @Unit.Val to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %118, i8* align 1 %119, i64 1, i1 false)
  br i1 true, label %chirblock.end56, label %unreachable54

unreachable54:                                    ; preds = %if.else53
  br label %if.end55

if.end55:                                         ; preds = %unreachable54, %if.end52
  br label %chirblock.start37

chirblock.end56:                                  ; preds = %if.else53
  ret void

unreachable57:                                    ; No predecessors!
  ret void
}

define void @_ZN7default8CrcCheck12updateBufferEml(%Unit.Type* noalias sret, i8 addrspace(1)* %this, i64 %input, i64 %byte_n) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %1 = alloca %Unit.Type
  %i = alloca i64
  %byte_index = alloca i64
  %byte_c = alloca i64
  %byteArray = alloca i8 addrspace(1)*
  %value = alloca i64
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  store i64 %input, i64* %value
  %icmpeq = icmp eq i64 %byte_n, 64
  br i1 %icmpeq, label %if.then, label %if.else

if.then:                                          ; preds = %chirblock.body
  %2 = load i64, i64* %value
  store i64 %2, i64* %value
  br label %if.end12

if.else:                                          ; preds = %chirblock.body
  %icmpeq2 = icmp eq i64 %byte_n, 32
  br i1 %icmpeq2, label %if.then3, label %if.else4

if.then3:                                         ; preds = %if.else
  %3 = load i64, i64* %value
  %and = and i64 %3, 4294967295
  store i64 %and, i64* %value
  br label %if.end11

if.else4:                                         ; preds = %if.else
  %icmpeq6 = icmp eq i64 %byte_n, 16
  br i1 %icmpeq6, label %if.then7, label %if.else9

if.then7:                                         ; preds = %if.else4
  %4 = load i64, i64* %value
  %and8 = and i64 %4, 65535
  store i64 %and8, i64* %value
  br label %if.end

if.else9:                                         ; preds = %if.else4
  %5 = load i64, i64* %value
  %and10 = and i64 %5, 255
  store i64 %and10, i64* %value
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then7
  br label %if.end11

if.end11:                                         ; preds = %if.end, %if.then3
  br label %if.end12

if.end12:                                         ; preds = %if.end11, %if.then
  %arr.alloc.size.valid = icmp sgt i64 %byte_n, 0
  br i1 %arr.alloc.size.valid, label %arr.alloc.body, label %arr.alloc.empty

arr.alloc.empty:                                  ; preds = %if.end12
  br label %arr.alloc.body

arr.alloc.body:                                   ; preds = %arr.alloc.empty, %if.end12
  %arr.size = phi i64 [ %byte_n, %if.end12 ], [ 0, %arr.alloc.empty ]
  %6 = trunc i64 %arr.size to i32
  %7 = call i8 addrspace(1)* @gc.malloc.array(i32 %6, %KlassInfo* @Int64.arrayKlass)
  %8 = bitcast i8 addrspace(1)* %7 to %ArrayLayout.Int64 addrspace(1)*
  store i8 addrspace(1)* %7, i8 addrspace(1)** %byteArray
  store i64 1, i64* %byte_c
  store i64 0, i64* %byte_index
  br label %chirblock.start14

chirblock.start14:                                ; preds = %if.end24, %arr.alloc.body
  br label %chirblock.body15

chirblock.body15:                                 ; preds = %chirblock.start14
  %9 = load i64, i64* %value
  %icmpne = icmp ne i64 %9, 0
  br i1 %icmpne, label %if.then17, label %if.else23

if.then17:                                        ; preds = %chirblock.body15
  %10 = load i64, i64* %value
  %mod = urem i64 %10, 2
  %icmpeq19 = icmp eq i64 %mod, 1
  br i1 %icmpeq19, label %if.then20, label %if.else21

if.then20:                                        ; preds = %if.then17
  %11 = load i64, i64* %byte_c
  %sub = sub i64 %byte_n, %11
  store i64 %sub, i64* %byte_index
  %12 = load i8 addrspace(1)*, i8 addrspace(1)** %byteArray
  %13 = load i64, i64* %byte_index
  call void @"_ZN12core$FS$core12core$FS$core0A1_l2[]Ell"(%Unit.Type* sret %1, i8 addrspace(1)* null, i8 addrspace(1)* %12, i64 %13, i64 1)
  br label %if.end22

if.else21:                                        ; preds = %if.then17
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %if.then20
  %14 = load i64, i64* %byte_c
  %15 = call i64 @"_ZN12core$FS$core0l11throwingIncEv"(i8 addrspace(1)* null, i64 %14)
  store i64 %15, i64* %byte_c
  %16 = load i64, i64* %value
  %lshr = lshr i64 %16, 1
  store i64 %lshr, i64* %value
  br label %if.end24

if.else23:                                        ; preds = %chirblock.body15
  %17 = bitcast %Unit.Type* %1 to i8*
  %18 = bitcast %Unit.Type* @Unit.Val to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %17, i8* align 1 %18, i64 1, i1 false)
  br i1 true, label %chirblock.end, label %unreachable

unreachable:                                      ; preds = %if.else23
  br label %if.end24

if.end24:                                         ; preds = %unreachable, %if.end22
  br label %chirblock.start14

chirblock.end:                                    ; preds = %if.else23
  store i64 0, i64* %i
  br label %chirblock.start26

chirblock.start26:                                ; preds = %if.end35, %chirblock.end
  br label %chirblock.body27

chirblock.body27:                                 ; preds = %chirblock.start26
  %19 = load i64, i64* %i
  %20 = load i64, i64* %byte_index
  %add = add i64 %19, %20
  %icmpslt = icmp slt i64 %add, %byte_n
  br i1 %icmpslt, label %if.then29, label %if.else33

if.then29:                                        ; preds = %chirblock.body27
  %21 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %22 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %21, i32 0, i32 1
  %23 = load i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)* %22
  %24 = load i64, i64* %i
  %25 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %26 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %25, i32 0, i32 5
  %27 = load i64, i64 addrspace(1)* %26
  %add30 = add i64 %24, %27
  %28 = load i8 addrspace(1)*, i8 addrspace(1)** %byteArray
  %29 = load i64, i64* %i
  %30 = load i64, i64* %byte_index
  %add31 = add i64 %29, %30
  %31 = call i64 @"_ZN12core$FS$core12core$FS$core0A1_l2[]El"(i8 addrspace(1)* null, i8 addrspace(1)* %28, i64 %add31)
  call void @"_ZN12core$FS$core12core$FS$core0A1_l2[]Ell"(%Unit.Type* sret %1, i8 addrspace(1)* null, i8 addrspace(1)* %23, i64 %add30, i64 %31)
  %32 = load i64, i64* %i
  %33 = call i64 @"_ZN12core$FS$core0l11throwingIncEv"(i8 addrspace(1)* null, i64 %32)
  store i64 %33, i64* %i
  br label %if.end35

if.else33:                                        ; preds = %chirblock.body27
  %34 = bitcast %Unit.Type* %1 to i8*
  %35 = bitcast %Unit.Type* @Unit.Val to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %34, i8* align 1 %35, i64 1, i1 false)
  br i1 true, label %chirblock.end36, label %unreachable34

unreachable34:                                    ; preds = %if.else33
  br label %if.end35

if.end35:                                         ; preds = %unreachable34, %if.then29
  br label %chirblock.start26

chirblock.end36:                                  ; preds = %if.else33
  %36 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %37 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %36, i32 0, i32 5
  %38 = load i64, i64 addrspace(1)* %37
  %39 = load i64, i64* %i
  %add37 = add i64 %38, %39
  %40 = bitcast i8 addrspace(1)* %this to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %41 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %40, i32 0, i32 5
  store i64 %add37, i64 addrspace(1)* %41
  ret void

unreachable38:                                    ; No predecessors!
  ret void
}

declare i64 @"_ZN12core$FS$core0l11throwingAddEl"(i8 addrspace(1)*, i64, i64) gc "cangjie"

declare i64 @"_ZN12core$FS$core0l11throwingSubEl"(i8 addrspace(1)*, i64, i64) gc "cangjie"

declare i64 @"_ZN12core$FS$core0l11throwingMulEl"(i8 addrspace(1)*, i64, i64) gc "cangjie"

declare i64 @"_ZN12core$FS$core0l11throwingIncEv"(i8 addrspace(1)*, i64) gc "cangjie"

declare void @"_ZN12core$FS$core0l8toStringEv"(%"record._ZN12core$FS$core6StringE"* noalias sret, i8 addrspace(1)*, i64) gc "cangjie"

declare i8 addrspace(1)* @"_ZN12core$FS$core18NoneValueException4initEv"() gc "cangjie"

declare void @"_ZN12core$FS$core5printE6String"(%Unit.Type* noalias sret, i8 addrspace(1)*, %"record._ZN12core$FS$core6StringE"*) gc "cangjie"

declare i64 @"_ZN12core$FS$core12core$FS$core0A1_l2[]El"(i8 addrspace(1)*, i8 addrspace(1)*, i64) gc "cangjie"

declare void @"_ZN12core$FS$core12core$FS$core0A1_l2[]Ell"(%Unit.Type* noalias sret, i8 addrspace(1)*, i8 addrspace(1)*, i64, i64) gc "cangjie"

declare i8 addrspace(1)* @"_ZN12core$FS$core12core$FS$core0A1_l2[]E5Rangel"(i8 addrspace(1)*, i8 addrspace(1)*, i8 addrspace(1)*) gc "cangjie"

declare i8 addrspace(1)* @"_ZN12core$FS$core12core$FS$core6OptionIlE.init"(i64)

declare i8 addrspace(1)* @"_ZN12core$FS$core12core$FS$core5RangeIl4initElllbbb"(i64, i64, i64, i1, i1, i1) gc "cangjie"

define weak_odr i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionITuple2_bjEE.init"(i64 %fld0) comdat gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN7default12core$FS$core6OptionITuple2_bjEE.objKlass")
  %1 = bitcast i8 addrspace(1)* %0 to %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE" addrspace(1)*
  %2 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE", %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE" addrspace(1)* %1, i32 0, i32 1
  store i64 %fld0, i64 addrspace(1)* %2
  ret i8 addrspace(1)* %0
}

declare i8 addrspace(1)* @gc.malloc.class(%KlassInfo*)

define weak_odr i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionITuple2_bjEE$Some1.init"(i64 %fld0, %Tuple2_bjE* %fld1) comdat gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN7default12core$FS$core6OptionITuple2_bjEE$Some1.objKlass")
  %1 = bitcast i8 addrspace(1)* %0 to %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE$Some1" addrspace(1)*
  %2 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE$Some1" addrspace(1)* %1, i32 0, i32 0, i32 1
  store i64 %fld0, i64 addrspace(1)* %2
  %3 = bitcast i8 addrspace(1)* %0 to %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE$Some1" addrspace(1)*
  %4 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE$Some1" addrspace(1)* %3, i32 0, i32 1
  %5 = bitcast %Tuple2_bjE addrspace(1)* %4 to i8 addrspace(1)*
  %6 = bitcast %Tuple2_bjE* %fld1 to i8*
  call void @llvm.memcpy.p1i8.p0i8.i64(i8 addrspace(1)* align 4 %5, i8* align 4 %6, i64 8, i1 false)
  ret i8 addrspace(1)* %0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p1i8.p0i8.i64(i8 addrspace(1)* nocapture writeonly, i8* nocapture readonly, i64, i1) #4

define weak_odr i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIdE.init"(i64 %fld0) comdat gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN7default12core$FS$core6OptionIdE.objKlass")
  %1 = bitcast i8 addrspace(1)* %0 to %"ObjLayout._ZN7default12core$FS$core6OptionIdE" addrspace(1)*
  %2 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIdE", %"ObjLayout._ZN7default12core$FS$core6OptionIdE" addrspace(1)* %1, i32 0, i32 1
  store i64 %fld0, i64 addrspace(1)* %2
  ret i8 addrspace(1)* %0
}

define weak_odr i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIdE$Some1.init"(i64 %fld0, double %fld1) comdat gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN7default12core$FS$core6OptionIdE$Some1.objKlass")
  %1 = bitcast i8 addrspace(1)* %0 to %"ObjLayout._ZN7default12core$FS$core6OptionIdE$Some1" addrspace(1)*
  %2 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIdE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionIdE$Some1" addrspace(1)* %1, i32 0, i32 0, i32 1
  store i64 %fld0, i64 addrspace(1)* %2
  %3 = bitcast i8 addrspace(1)* %0 to %"ObjLayout._ZN7default12core$FS$core6OptionIdE$Some1" addrspace(1)*
  %4 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIdE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionIdE$Some1" addrspace(1)* %3, i32 0, i32 1
  store double %fld1, double addrspace(1)* %4
  ret i8 addrspace(1)* %0
}

define weak_odr i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI7Class76E.init"(i64 %fld0) comdat gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN7default12core$FS$core6OptionI7Class76E.objKlass")
  %1 = bitcast i8 addrspace(1)* %0 to %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E" addrspace(1)*
  %2 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E", %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E" addrspace(1)* %1, i32 0, i32 1
  store i64 %fld0, i64 addrspace(1)* %2
  ret i8 addrspace(1)* %0
}

define weak_odr i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI7Class76E$Some1.init"(i64 %fld0, i8 addrspace(1)* %fld1) comdat gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN7default12core$FS$core6OptionI7Class76E$Some1.objKlass")
  %1 = bitcast i8 addrspace(1)* %0 to %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E$Some1" addrspace(1)*
  %2 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E$Some1" addrspace(1)* %1, i32 0, i32 0, i32 1
  store i64 %fld0, i64 addrspace(1)* %2
  %3 = bitcast i8 addrspace(1)* %0 to %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E$Some1" addrspace(1)*
  %4 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E$Some1" addrspace(1)* %3, i32 0, i32 1
  call void @llvm.gcwrite.cj(i8 addrspace(1)* %fld1, i8 addrspace(1)* %0, i8 addrspace(1)* addrspace(1)* %4)
  ret i8 addrspace(1)* %0
}

declare void @llvm.gcwrite.cj(i8 addrspace(1)*, i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)*) #5

define weak_odr i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIfE.init"(i64 %fld0) comdat gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN7default12core$FS$core6OptionIfE.objKlass")
  %1 = bitcast i8 addrspace(1)* %0 to %"ObjLayout._ZN7default12core$FS$core6OptionIfE" addrspace(1)*
  %2 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIfE", %"ObjLayout._ZN7default12core$FS$core6OptionIfE" addrspace(1)* %1, i32 0, i32 1
  store i64 %fld0, i64 addrspace(1)* %2
  ret i8 addrspace(1)* %0
}

define weak_odr i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIfE$Some1.init"(i64 %fld0, float %fld1) comdat gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN7default12core$FS$core6OptionIfE$Some1.objKlass")
  %1 = bitcast i8 addrspace(1)* %0 to %"ObjLayout._ZN7default12core$FS$core6OptionIfE$Some1" addrspace(1)*
  %2 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIfE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionIfE$Some1" addrspace(1)* %1, i32 0, i32 0, i32 1
  store i64 %fld0, i64 addrspace(1)* %2
  %3 = bitcast i8 addrspace(1)* %0 to %"ObjLayout._ZN7default12core$FS$core6OptionIfE$Some1" addrspace(1)*
  %4 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIfE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionIfE$Some1" addrspace(1)* %3, i32 0, i32 1
  store float %fld1, float addrspace(1)* %4
  ret i8 addrspace(1)* %0
}

define weak_odr i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI6OptionuE.init"(i64 %fld0) comdat gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN7default12core$FS$core6OptionI6OptionuE.objKlass")
  %1 = bitcast i8 addrspace(1)* %0 to %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE" addrspace(1)*
  %2 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE", %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE" addrspace(1)* %1, i32 0, i32 1
  store i64 %fld0, i64 addrspace(1)* %2
  ret i8 addrspace(1)* %0
}

define weak_odr i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI6OptionuE$Some1.init"(i64 %fld0, i8 addrspace(1)* %fld1) comdat gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN7default12core$FS$core6OptionI6OptionuE$Some1.objKlass")
  %1 = bitcast i8 addrspace(1)* %0 to %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE$Some1" addrspace(1)*
  %2 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE$Some1" addrspace(1)* %1, i32 0, i32 0, i32 1
  store i64 %fld0, i64 addrspace(1)* %2
  %3 = bitcast i8 addrspace(1)* %0 to %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE$Some1" addrspace(1)*
  %4 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE$Some1" addrspace(1)* %3, i32 0, i32 1
  call void @llvm.gcwrite.cj(i8 addrspace(1)* %fld1, i8 addrspace(1)* %0, i8 addrspace(1)* addrspace(1)* %4)
  ret i8 addrspace(1)* %0
}

define weak_odr i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E.init"(i64 %fld0) comdat gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN7default12core$FS$core6OptionI10Aggregate8E.objKlass")
  %1 = bitcast i8 addrspace(1)* %0 to %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E" addrspace(1)*
  %2 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E", %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E" addrspace(1)* %1, i32 0, i32 1
  store i64 %fld0, i64 addrspace(1)* %2
  ret i8 addrspace(1)* %0
}

define weak_odr i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E$Some1.init"(i64 %fld0, %record._ZN7default10Aggregate8E* %fld1) comdat gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN7default12core$FS$core6OptionI10Aggregate8E$Some1.objKlass")
  %1 = bitcast i8 addrspace(1)* %0 to %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E$Some1" addrspace(1)*
  %2 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E$Some1" addrspace(1)* %1, i32 0, i32 0, i32 1
  store i64 %fld0, i64 addrspace(1)* %2
  %3 = bitcast i8 addrspace(1)* %0 to %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E$Some1" addrspace(1)*
  %4 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E$Some1" addrspace(1)* %3, i32 0, i32 1
  %5 = bitcast %record._ZN7default10Aggregate8E addrspace(1)* %4 to i8 addrspace(1)*
  %6 = bitcast %record._ZN7default10Aggregate8E* %fld1 to i8*
  call void @llvm.memcpy.p1i8.p0i8.i64(i8 addrspace(1)* align 1 %5, i8* align 1 %6, i64 1, i1 false)
  ret i8 addrspace(1)* %0
}

define weak_odr i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIbE.init"(i64 %fld0) comdat gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN7default12core$FS$core6OptionIbE.objKlass")
  %1 = bitcast i8 addrspace(1)* %0 to %"ObjLayout._ZN7default12core$FS$core6OptionIbE" addrspace(1)*
  %2 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIbE", %"ObjLayout._ZN7default12core$FS$core6OptionIbE" addrspace(1)* %1, i32 0, i32 1
  store i64 %fld0, i64 addrspace(1)* %2
  ret i8 addrspace(1)* %0
}

define weak_odr i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIbE$Some1.init"(i64 %fld0, i1 %fld1) comdat gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN7default12core$FS$core6OptionIbE$Some1.objKlass")
  %1 = bitcast i8 addrspace(1)* %0 to %"ObjLayout._ZN7default12core$FS$core6OptionIbE$Some1" addrspace(1)*
  %2 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIbE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionIbE$Some1" addrspace(1)* %1, i32 0, i32 0, i32 1
  store i64 %fld0, i64 addrspace(1)* %2
  %3 = bitcast i8 addrspace(1)* %0 to %"ObjLayout._ZN7default12core$FS$core6OptionIbE$Some1" addrspace(1)*
  %4 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIbE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionIbE$Some1" addrspace(1)* %3, i32 0, i32 1
  store i1 %fld1, i1 addrspace(1)* %4
  ret i8 addrspace(1)* %0
}

define weak_odr i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE.init"(i64 %fld0) comdat gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN7default12core$FS$core6OptionIuE.objKlass")
  %1 = bitcast i8 addrspace(1)* %0 to %"ObjLayout._ZN7default12core$FS$core6OptionIuE" addrspace(1)*
  %2 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIuE", %"ObjLayout._ZN7default12core$FS$core6OptionIuE" addrspace(1)* %1, i32 0, i32 1
  store i64 %fld0, i64 addrspace(1)* %2
  ret i8 addrspace(1)* %0
}

define weak_odr i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE$Some1.init"(i64 %fld0, %Unit.Type* %fld1) comdat gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN7default12core$FS$core6OptionIuE$Some1.objKlass")
  %1 = bitcast i8 addrspace(1)* %0 to %"ObjLayout._ZN7default12core$FS$core6OptionIuE$Some1" addrspace(1)*
  %2 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIuE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionIuE$Some1" addrspace(1)* %1, i32 0, i32 0, i32 1
  store i64 %fld0, i64 addrspace(1)* %2
  %3 = bitcast i8 addrspace(1)* %0 to %"ObjLayout._ZN7default12core$FS$core6OptionIuE$Some1" addrspace(1)*
  %4 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIuE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionIuE$Some1" addrspace(1)* %3, i32 0, i32 1
  %5 = bitcast %Unit.Type addrspace(1)* %4 to i8 addrspace(1)*
  %6 = bitcast %Unit.Type* %fld1 to i8*
  call void @llvm.memcpy.p1i8.p0i8.i64(i8 addrspace(1)* align 1 %5, i8* align 1 %6, i64 1, i1 false)
  ret i8 addrspace(1)* %0
}

define weak_odr i8 addrspace(1)* @"_ZN026$Lambda__ZN7default4mainEv.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN026$Lambda__ZN7default4mainEv.objKlass")
  ret i8 addrspace(1)* %0
}

define i64 @_ZN7default4mainEv(i8 addrspace(1)* %context) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %callret5 = alloca %Unit.Type
  %crccheck = alloca i8 addrspace(1)*
  %callRet = alloca %record._ZN7default10Aggregate8E
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  call void @_ZN7default6func12Ev(%record._ZN7default10Aggregate8E* sret %callRet, i8 addrspace(1)* null)
  %0 = call i64 @_ZN7default10Aggregate87func853Ev(i8 addrspace(1)* null, %record._ZN7default10Aggregate8E* %callRet)
  %1 = call i8 addrspace(1)* @_ZN7default8CrcCheck4initEll(i64 5000, i64 32)
  store i8 addrspace(1)* %1, i8 addrspace(1)** %crccheck
  %2 = load i8 addrspace(1)*, i8 addrspace(1)** %crccheck
  %3 = load i16, i16* @_ZN7default6var221E
  %4 = zext i16 %3 to i64
  %5 = bitcast i8 addrspace(1)* %2 to %ObjLayout.Object addrspace(1)*
  %6 = getelementptr inbounds %ObjLayout.Object, %ObjLayout.Object addrspace(1)* %5, i32 0, i32 0
  %7 = load %KlassInfo*, %KlassInfo* addrspace(1)* %6
  %8 = getelementptr inbounds %KlassInfo, %KlassInfo* %7, i32 0, i32 4
  %9 = load i8**, i8*** %8
  %10 = getelementptr i8*, i8** %9, i64 1
  %11 = load i8*, i8** %10
  %12 = bitcast i8* %11 to void (%Unit.Type*, i8 addrspace(1)*, i64, i64)*
  call void %12(%Unit.Type* sret %callret5, i8 addrspace(1)* %2, i64 %4, i64 64)
  %13 = load i8 addrspace(1)*, i8 addrspace(1)** %crccheck
  %14 = load i8, i8* @_ZN7default6var404E
  %15 = zext i8 %14 to i64
  %16 = bitcast i8 addrspace(1)* %13 to %ObjLayout.Object addrspace(1)*
  %17 = getelementptr inbounds %ObjLayout.Object, %ObjLayout.Object addrspace(1)* %16, i32 0, i32 0
  %18 = load %KlassInfo*, %KlassInfo* addrspace(1)* %17
  %19 = getelementptr inbounds %KlassInfo, %KlassInfo* %18, i32 0, i32 4
  %20 = load i8**, i8*** %19
  %21 = getelementptr i8*, i8** %20, i64 1
  %22 = load i8*, i8** %21
  %23 = bitcast i8* %22 to void (%Unit.Type*, i8 addrspace(1)*, i64, i64)*
  call void %23(%Unit.Type* sret %callret5, i8 addrspace(1)* %13, i64 %15, i64 64)
  %24 = load i8 addrspace(1)*, i8 addrspace(1)** %crccheck
  %25 = load i8, i8* @_ZN7default6var555E
  %26 = zext i8 %25 to i64
  %27 = bitcast i8 addrspace(1)* %24 to %ObjLayout.Object addrspace(1)*
  %28 = getelementptr inbounds %ObjLayout.Object, %ObjLayout.Object addrspace(1)* %27, i32 0, i32 0
  %29 = load %KlassInfo*, %KlassInfo* addrspace(1)* %28
  %30 = getelementptr inbounds %KlassInfo, %KlassInfo* %29, i32 0, i32 4
  %31 = load i8**, i8*** %30
  %32 = getelementptr i8*, i8** %31, i64 1
  %33 = load i8*, i8** %32
  %34 = bitcast i8* %33 to void (%Unit.Type*, i8 addrspace(1)*, i64, i64)*
  call void %34(%Unit.Type* sret %callret5, i8 addrspace(1)* %24, i64 %26, i64 64)
  %35 = load i8 addrspace(1)*, i8 addrspace(1)** %crccheck
  %36 = load i64, i64* @_ZN7default7var1050E
  %37 = bitcast i8 addrspace(1)* %35 to %ObjLayout.Object addrspace(1)*
  %38 = getelementptr inbounds %ObjLayout.Object, %ObjLayout.Object addrspace(1)* %37, i32 0, i32 0
  %39 = load %KlassInfo*, %KlassInfo* addrspace(1)* %38
  %40 = getelementptr inbounds %KlassInfo, %KlassInfo* %39, i32 0, i32 4
  %41 = load i8**, i8*** %40
  %42 = getelementptr i8*, i8** %41, i64 1
  %43 = load i8*, i8** %42
  %44 = bitcast i8* %43 to void (%Unit.Type*, i8 addrspace(1)*, i64, i64)*
  call void %44(%Unit.Type* sret %callret5, i8 addrspace(1)* %35, i64 %36, i64 64)
  %45 = load i8 addrspace(1)*, i8 addrspace(1)** %crccheck
  %46 = bitcast i8 addrspace(1)* %45 to %ObjLayout.Object addrspace(1)*
  %47 = getelementptr inbounds %ObjLayout.Object, %ObjLayout.Object addrspace(1)* %46, i32 0, i32 0
  %48 = load %KlassInfo*, %KlassInfo* addrspace(1)* %47
  %49 = getelementptr inbounds %KlassInfo, %KlassInfo* %48, i32 0, i32 4
  %50 = load i8**, i8*** %49
  %51 = getelementptr i8*, i8** %50, i64 2
  %52 = load i8*, i8** %51
  %53 = bitcast i8* %52 to void (%Unit.Type*, i8 addrspace(1)*)*
  call void %53(%Unit.Type* sret %callret5, i8 addrspace(1)* %45)
  %54 = load i8 addrspace(1)*, i8 addrspace(1)** %crccheck
  %55 = bitcast i8 addrspace(1)* %54 to %ObjLayout.Object addrspace(1)*
  %56 = getelementptr inbounds %ObjLayout.Object, %ObjLayout.Object addrspace(1)* %55, i32 0, i32 0
  %57 = load %KlassInfo*, %KlassInfo* addrspace(1)* %56
  %58 = getelementptr inbounds %KlassInfo, %KlassInfo* %57, i32 0, i32 4
  %59 = load i8**, i8*** %58
  %60 = getelementptr i8*, i8** %59, i64 3
  %61 = load i8*, i8** %60
  %62 = bitcast i8* %61 to void (%Unit.Type*, i8 addrspace(1)*)*
  call void %62(%Unit.Type* sret %callret5, i8 addrspace(1)* %54)
  ret i64 0

unreachable:                                      ; No predecessors!
  ret i64 0
}

define weak_odr i8 addrspace(1)* @"_ZN041$Lambda__ZN7default10Aggregate87func853Ev.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN041$Lambda__ZN7default10Aggregate87func853Ev.objKlass")
  ret i8 addrspace(1)* %0
}

define i64 @_ZN7default10Aggregate87func853Ev(i8 addrspace(1)* %context, %record._ZN7default10Aggregate8E* %this) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %if.value91 = alloca i64
  %if.value88 = alloca i64
  %x84 = alloca i64
  %if.value78 = alloca i64
  %callRet74 = alloca %Tuple3_u6Option10Aggregate8jE
  %if.value71 = alloca %Tuple3_u6Option10Aggregate8jE
  %var1014 = alloca %Tuple3_u6Option10Aggregate8jE
  %callRet69 = alloca %Tuple3_u6Option10Aggregate8jE
  %newVar-compiler66 = alloca %record._ZN7default10Aggregate8E
  %if.value64 = alloca i8 addrspace(1)*
  %newVar-compiler61 = alloca %record._ZN7default10Aggregate8E
  %if.value59 = alloca i8 addrspace(1)*
  %newVar-compiler = alloca %record._ZN7default10Aggregate8E
  %if.value55 = alloca i8 addrspace(1)*
  %caseVar1011 = alloca i8 addrspace(1)*
  %if.value53 = alloca %Tuple3_u6Option10Aggregate8jE
  %if.value45 = alloca i1
  %caseVar993 = alloca i8 addrspace(1)*
  %if.value42 = alloca i1
  %var987 = alloca i8 addrspace(1)*
  %if.value39 = alloca i1
  %if.value36 = alloca i1
  %caseVar969 = alloca i8
  %if.value29 = alloca i8 addrspace(1)*
  %if.value26 = alloca i8 addrspace(1)*
  %if.value23 = alloca i8 addrspace(1)*
  %if.value20 = alloca i8 addrspace(1)*
  %if.value19 = alloca i64
  %var1069 = alloca i8 addrspace(1)*
  %callRet16 = alloca %Tuple2_bjE
  %callRet14 = alloca %Tuple2_bjE
  %caseVar889 = alloca i8 addrspace(1)*
  %if.value12 = alloca %Tuple2_bjE
  %callRet = alloca %Tuple2_bjE
  %caseVar880 = alloca i8 addrspace(1)*
  %if.value9 = alloca %Tuple2_bjE
  %x = alloca i8 addrspace(1)*
  %if.value5 = alloca i8 addrspace(1)*
  %if.value1 = alloca i8 addrspace(1)*
  %if.value = alloca i8 addrspace(1)*
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %0 = load i1, i1* @_ZN7default6var104E
  br i1 %0, label %if.then, label %if.else

if.then:                                          ; preds = %chirblock.body
  %1 = load i8 addrspace(1)*, i8 addrspace(1)** @_ZN7default6var862I6OptionuE
  store i8 addrspace(1)* %1, i8 addrspace(1)** %if.value
  br label %if.end4

if.else:                                          ; preds = %chirblock.body
  %2 = load i1, i1* @_ZN7default6var185E
  br i1 %2, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.else
  %3 = load i8 addrspace(1)*, i8 addrspace(1)** @_ZN7default6var661IuE
  %4 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI6OptionuE$Some1.init"(i64 0, i8 addrspace(1)* %3)
  store i8 addrspace(1)* %4, i8 addrspace(1)** %if.value1
  br label %if.end

if.else3:                                         ; preds = %if.else
  %5 = load i8 addrspace(1)*, i8 addrspace(1)** @_ZN7default6var661IuE
  %6 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI6OptionuE.init"(i64 1)
  store i8 addrspace(1)* %6, i8 addrspace(1)** %if.value1
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %7 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value1
  store i8 addrspace(1)* %7, i8 addrspace(1)** %if.value
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %8 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value
  %9 = bitcast i8 addrspace(1)* %8 to %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE" addrspace(1)*
  %10 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE", %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE" addrspace(1)* %9, i32 0, i32 1
  %11 = load i64, i64 addrspace(1)* %10
  %icmpeq = icmp eq i64 %11, 0
  br i1 %icmpeq, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end4
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end4
  %conv = phi i1 [ false, %if.end4 ], [ true, %land.rhs ]
  br i1 %conv, label %if.then6, label %if.else7

if.then6:                                         ; preds = %land.end
  %12 = bitcast i8 addrspace(1)* %8 to %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE$Some1" addrspace(1)*
  %13 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE$Some1" addrspace(1)* %12, i32 0, i32 1
  %14 = load i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)* %13
  store i8 addrspace(1)* %14, i8 addrspace(1)** %x
  %15 = load i8 addrspace(1)*, i8 addrspace(1)** %x
  store i8 addrspace(1)* %15, i8 addrspace(1)** %if.value5
  br label %if.end8

if.else7:                                         ; preds = %land.end
  %16 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE.init"(i64 1)
  store i8 addrspace(1)* %16, i8 addrspace(1)** %if.value5
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %17 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value5
  br i1 true, label %if.then10, label %if.else11

if.then10:                                        ; preds = %if.end8
  store i8 addrspace(1)* %17, i8 addrspace(1)** %caseVar880
  %18 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E$Some1.init"(i64 0, %record._ZN7default10Aggregate8E* @_ZN7default6var354E)
  %19 = load i1, i1* @_ZN7default6var185E
  %20 = load i32, i32* @_ZN7default6var383E
  call void @Tuple2_bjE(%Tuple2_bjE* sret %callRet, i1 %19, i32 %20)
  %21 = bitcast %Tuple2_bjE* %if.value9 to i8*
  %22 = bitcast %Tuple2_bjE* %callRet to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %21, i8* align 4 %22, i64 8, i1 false)
  br label %if.end18

if.else11:                                        ; preds = %if.end8
  br i1 false, label %if.then13, label %if.else15

if.then13:                                        ; preds = %if.else11
  store i8 addrspace(1)* %17, i8 addrspace(1)** %caseVar889
  call void @Tuple2_bjE(%Tuple2_bjE* sret %callRet14, i1 false, i32 91)
  %23 = bitcast %Tuple2_bjE* %if.value12 to i8*
  %24 = bitcast %Tuple2_bjE* %callRet14 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %23, i8* align 4 %24, i64 8, i1 false)
  br label %if.end17

if.else15:                                        ; preds = %if.else11
  %25 = load i32, i32* @_ZN7default6var383E
  call void @Tuple2_bjE(%Tuple2_bjE* sret %callRet16, i1 true, i32 %25)
  %26 = bitcast %Tuple2_bjE* %if.value12 to i8*
  %27 = bitcast %Tuple2_bjE* %callRet16 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %26, i8* align 4 %27, i64 8, i1 false)
  br label %if.end17

if.end17:                                         ; preds = %if.else15, %if.then13
  %28 = bitcast %Tuple2_bjE* %if.value9 to i8*
  %29 = bitcast %Tuple2_bjE* %if.value12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %28, i8* align 4 %29, i64 8, i1 false)
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %if.then10
  %30 = call i8 addrspace(1)* @"_ZN12core$FS$core12core$FS$core6OptionIlE.init"(i64 1)
  store i8 addrspace(1)* %30, i8 addrspace(1)** %var1069
  br i1 false, label %if.then21, label %if.else22

if.then21:                                        ; preds = %if.end18
  %31 = call i8 addrspace(1)* @"_ZN7default7Class764initE$optionalParam911___0u"(i8 addrspace(1)* null, %Unit.Type* @Unit.Val)
  %32 = call i8 addrspace(1)* @_ZN7default7Class764initEu6Optiond(%Unit.Type* @Unit.Val, i8 addrspace(1)* %31)
  store i8 addrspace(1)* %32, i8 addrspace(1)** %if.value20
  br label %if.end35

if.else22:                                        ; preds = %if.end18
  br i1 false, label %if.then24, label %if.else25

if.then24:                                        ; preds = %if.else22
  %33 = call i8 addrspace(1)* @_ZN7default7Class764initEv()
  store i8 addrspace(1)* %33, i8 addrspace(1)** %if.value23
  br label %if.end34

if.else25:                                        ; preds = %if.else22
  br i1 false, label %if.then27, label %if.else28

if.then27:                                        ; preds = %if.else25
  %34 = load double, double* @_ZN7default6var594E
  %35 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIdE$Some1.init"(i64 0, double %34)
  %36 = call i8 addrspace(1)* @_ZN7default7Class764initEu6Optiond(%Unit.Type* @Unit.Val, i8 addrspace(1)* %35)
  store i8 addrspace(1)* %36, i8 addrspace(1)** %if.value26
  br label %if.end33

if.else28:                                        ; preds = %if.else25
  br i1 true, label %if.then30, label %if.else31

if.then30:                                        ; preds = %if.else28
  store i8 100, i8* %caseVar969
  %37 = load i8 addrspace(1)*, i8 addrspace(1)** @_ZN7default6var268E
  store i8 addrspace(1)* %37, i8 addrspace(1)** %if.value29
  br label %if.end32

if.else31:                                        ; preds = %if.else28
  %38 = load i8 addrspace(1)*, i8 addrspace(1)** @_ZN7default6var268E
  store i8 addrspace(1)* %38, i8 addrspace(1)** %if.value29
  br label %if.end32

if.end32:                                         ; preds = %if.else31, %if.then30
  %39 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value29
  store i8 addrspace(1)* %39, i8 addrspace(1)** %if.value26
  br label %if.end33

if.end33:                                         ; preds = %if.end32, %if.then27
  %40 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value26
  store i8 addrspace(1)* %40, i8 addrspace(1)** %if.value23
  br label %if.end34

if.end34:                                         ; preds = %if.end33, %if.then24
  %41 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value23
  store i8 addrspace(1)* %41, i8 addrspace(1)** %if.value20
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %if.then21
  %42 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value20
  br i1 true, label %if.then37, label %if.else38

if.then37:                                        ; preds = %if.end35
  %43 = load i1, i1* @_ZN7default6var399E
  store i1 %43, i1* %if.value36
  br label %if.end51

if.else38:                                        ; preds = %if.end35
  br i1 true, label %if.then40, label %if.else41

if.then40:                                        ; preds = %if.else38
  %44 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E.init"(i64 1)
  store i8 addrspace(1)* %44, i8 addrspace(1)** %var987
  %45 = load i8 addrspace(1)*, i8 addrspace(1)** %var987
  store i1 true, i1* %if.value39
  br label %if.end50

if.else41:                                        ; preds = %if.else38
  br i1 true, label %if.then43, label %if.else44

if.then43:                                        ; preds = %if.else41
  store i8 addrspace(1)* %42, i8 addrspace(1)** %caseVar993
  %46 = load i1, i1* @_ZN7default6var104E
  store i1 %46, i1* %if.value42
  br label %if.end49

if.else44:                                        ; preds = %if.else41
  br i1 false, label %if.then46, label %if.else47

if.then46:                                        ; preds = %if.else44
  %47 = load i1, i1* @_ZN7default6var686E
  store i1 %47, i1* %if.value45
  br label %if.end48

if.else47:                                        ; preds = %if.else44
  %48 = load i1, i1* @_ZN7default5var99E
  store i1 %48, i1* %if.value45
  br label %if.end48

if.end48:                                         ; preds = %if.else47, %if.then46
  %49 = load i1, i1* %if.value45
  store i1 %49, i1* %if.value42
  br label %if.end49

if.end49:                                         ; preds = %if.end48, %if.then43
  %50 = load i1, i1* %if.value42
  store i1 %50, i1* %if.value39
  br label %if.end50

if.end50:                                         ; preds = %if.end49, %if.then40
  %51 = load i1, i1* %if.value39
  store i1 %51, i1* %if.value36
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.then37
  %52 = load i1, i1* %if.value36
  br i1 %52, label %if.then52, label %if.else87

if.then52:                                        ; preds = %if.end51
  %53 = load i8, i8* @_ZN7default6var838E
  br i1 false, label %if.then54, label %if.else70

if.then54:                                        ; preds = %if.then52
  store i8 addrspace(1)* null, i8 addrspace(1)** %caseVar1011
  %54 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E$Some1.init"(i64 0, %record._ZN7default10Aggregate8E* @_ZN7default6var354E)
  br i1 false, label %if.then56, label %if.else57

if.then56:                                        ; preds = %if.then54
  store %record._ZN7default10Aggregate8E zeroinitializer, %record._ZN7default10Aggregate8E* %newVar-compiler
  %55 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E$Some1.init"(i64 0, %record._ZN7default10Aggregate8E* %newVar-compiler)
  store i8 addrspace(1)* %55, i8 addrspace(1)** %if.value55
  br label %if.end58

if.else57:                                        ; preds = %if.then54
  %56 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E.init"(i64 1)
  store i8 addrspace(1)* %56, i8 addrspace(1)** %if.value55
  br label %if.end58

if.end58:                                         ; preds = %if.else57, %if.then56
  %57 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value55
  br i1 false, label %if.then60, label %if.else62

if.then60:                                        ; preds = %if.end58
  store %record._ZN7default10Aggregate8E zeroinitializer, %record._ZN7default10Aggregate8E* %newVar-compiler61
  %58 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E$Some1.init"(i64 0, %record._ZN7default10Aggregate8E* %newVar-compiler61)
  store i8 addrspace(1)* %58, i8 addrspace(1)** %if.value59
  br label %if.end63

if.else62:                                        ; preds = %if.end58
  %59 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E.init"(i64 1)
  store i8 addrspace(1)* %59, i8 addrspace(1)** %if.value59
  br label %if.end63

if.end63:                                         ; preds = %if.else62, %if.then60
  %60 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value59
  br i1 false, label %if.then65, label %if.else67

if.then65:                                        ; preds = %if.end63
  store %record._ZN7default10Aggregate8E zeroinitializer, %record._ZN7default10Aggregate8E* %newVar-compiler66
  %61 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E$Some1.init"(i64 0, %record._ZN7default10Aggregate8E* %newVar-compiler66)
  store i8 addrspace(1)* %61, i8 addrspace(1)** %if.value64
  br label %if.end68

if.else67:                                        ; preds = %if.end63
  %62 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E.init"(i64 1)
  store i8 addrspace(1)* %62, i8 addrspace(1)** %if.value64
  br label %if.end68

if.end68:                                         ; preds = %if.else67, %if.then65
  %63 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value64
  call void @Tuple3_u6Option10Aggregate8jE(%Tuple3_u6Option10Aggregate8jE* sret %callRet69, %Unit.Type* @Unit.Val, i8 addrspace(1)* %63, i32 248)
  %64 = bitcast %Tuple3_u6Option10Aggregate8jE* %var1014 to i8*
  %65 = bitcast %Tuple3_u6Option10Aggregate8jE* %callRet69 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %64, i8* align 8 %65, i64 24, i1 false)
  %66 = bitcast %Tuple3_u6Option10Aggregate8jE* %if.value53 to i8*
  %67 = bitcast %Tuple3_u6Option10Aggregate8jE* %var1014 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %66, i8* align 8 %67, i64 24, i1 false)
  br label %if.end77

if.else70:                                        ; preds = %if.then52
  %icmpeq72 = icmp eq i8 %53, 105
  br i1 %icmpeq72, label %if.then73, label %if.else75

if.then73:                                        ; preds = %if.else70
  %68 = load i8 addrspace(1)*, i8 addrspace(1)** @_ZN7default10Aggregate87var1028IbE
  %69 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E$Some1.init"(i64 0, %record._ZN7default10Aggregate8E* @_ZN7default6var354E)
  %70 = load i32, i32* @_ZN7default6var383E
  call void @Tuple3_u6Option10Aggregate8jE(%Tuple3_u6Option10Aggregate8jE* sret %callRet74, %Unit.Type* @Unit.Val, i8 addrspace(1)* %69, i32 %70)
  %71 = bitcast %Tuple3_u6Option10Aggregate8jE* %if.value71 to i8*
  %72 = bitcast %Tuple3_u6Option10Aggregate8jE* %callRet74 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %71, i8* align 8 %72, i64 24, i1 false)
  br label %if.end76

if.else75:                                        ; preds = %if.else70
  %73 = bitcast %Tuple3_u6Option10Aggregate8jE* %if.value71 to i8*
  %74 = bitcast %Tuple3_u6Option10Aggregate8jE* @_ZN7default7var1038Iu6Option10Aggregate8jE to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %73, i8* align 8 %74, i64 24, i1 false)
  br label %if.end76

if.end76:                                         ; preds = %if.else75, %if.then73
  %75 = bitcast %Tuple3_u6Option10Aggregate8jE* %if.value53 to i8*
  %76 = bitcast %Tuple3_u6Option10Aggregate8jE* %if.value71 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %75, i8* align 8 %76, i64 24, i1 false)
  br label %if.end77

if.end77:                                         ; preds = %if.end76, %if.end68
  %77 = call i8 addrspace(1)* @"_ZN12core$FS$core12core$FS$core6OptionIlE.init"(i64 1)
  %78 = bitcast i8 addrspace(1)* %77 to %"ObjLayout._ZN12core$FS$core12core$FS$core6OptionIlE" addrspace(1)*
  %79 = getelementptr %"ObjLayout._ZN12core$FS$core12core$FS$core6OptionIlE", %"ObjLayout._ZN12core$FS$core12core$FS$core6OptionIlE" addrspace(1)* %78, i32 0, i32 1
  %80 = load i64, i64 addrspace(1)* %79
  %icmpeq79 = icmp eq i64 %80, 0
  br i1 %icmpeq79, label %land.rhs80, label %land.end81

land.rhs80:                                       ; preds = %if.end77
  br label %land.end81

land.end81:                                       ; preds = %land.rhs80, %if.end77
  %conv82 = phi i1 [ false, %if.end77 ], [ true, %land.rhs80 ]
  br i1 %conv82, label %if.then83, label %if.else85

if.then83:                                        ; preds = %land.end81
  %81 = bitcast i8 addrspace(1)* %77 to %"ObjLayout._ZN12core$FS$core12core$FS$core6OptionIlE$Some1" addrspace(1)*
  %82 = getelementptr %"ObjLayout._ZN12core$FS$core12core$FS$core6OptionIlE$Some1", %"ObjLayout._ZN12core$FS$core12core$FS$core6OptionIlE$Some1" addrspace(1)* %81, i32 0, i32 1
  %83 = load i64, i64 addrspace(1)* %82
  store i64 %83, i64* %x84
  %84 = load i64, i64* %x84
  store i64 %84, i64* %if.value78
  br label %if.end86

if.else85:                                        ; preds = %land.end81
  store i64 -49, i64* %if.value78
  br label %if.end86

if.end86:                                         ; preds = %if.else85, %if.then83
  %85 = load i64, i64* %if.value78
  store i64 %85, i64* %if.value19
  br label %if.end96

if.else87:                                        ; preds = %if.end51
  %86 = load i1, i1* @_ZN7default6var568E
  br i1 %86, label %if.then89, label %if.else90

if.then89:                                        ; preds = %if.else87
  store i64 -45, i64* %if.value88
  br label %if.end95

if.else90:                                        ; preds = %if.else87
  %87 = load i1, i1* @_ZN7default6var568E
  br i1 %87, label %if.then92, label %if.else93

if.then92:                                        ; preds = %if.else90
  store i64 -2, i64* %if.value91
  br label %if.end94

if.else93:                                        ; preds = %if.else90
  %88 = load i8 addrspace(1)*, i8 addrspace(1)** %var1069
  store i64 -14, i64* %if.value91
  br label %if.end94

if.end94:                                         ; preds = %if.else93, %if.then92
  %89 = load i64, i64* %if.value91
  store i64 %89, i64* %if.value88
  br label %if.end95

if.end95:                                         ; preds = %if.end94, %if.then89
  %90 = load i64, i64* %if.value88
  store i64 %90, i64* %if.value19
  br label %if.end96

if.end96:                                         ; preds = %if.end95, %if.end86
  %91 = load i64, i64* %if.value19
  ret i64 %91

unreachable:                                      ; No predecessors!
  ret i64 0
}

define weak_odr i8 addrspace(1)* @"_ZN028$Lambda__ZN7default6func12Ev.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN028$Lambda__ZN7default6func12Ev.objKlass")
  ret i8 addrspace(1)* %0
}

define void @_ZN7default6func12Ev(%record._ZN7default10Aggregate8E* noalias sret, i8 addrspace(1)* %context) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %callRet33 = alloca %record._ZN7default10Aggregate8E
  %if.value27 = alloca %Unit.Type
  %callRet25 = alloca %Tuple3_sdhE
  %callRet23 = alloca %Tuple3_sdhE
  %if.value21 = alloca %Tuple3_sdhE
  %callRet19 = alloca %Tuple2_bjE
  %if.value13 = alloca %Tuple2_bjE
  %if.value10 = alloca %Tuple2_bjE
  %var843 = alloca double
  %var30 = alloca i1
  %var22 = alloca %Tuple2_bjE
  %callRet = alloca %Tuple2_bjE
  %if.value5 = alloca i1
  %if.value1 = alloca i1
  %if.value = alloca i1
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  br i1 false, label %if.then, label %if.else

if.then:                                          ; preds = %chirblock.body
  store i1 true, i1* %if.value
  br label %if.end

if.else:                                          ; preds = %chirblock.body
  store i1 false, i1* %if.value
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i1, i1* %if.value
  br i1 false, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.end
  store i1 true, i1* %if.value1
  br label %if.end4

if.else3:                                         ; preds = %if.end
  store i1 false, i1* %if.value1
  br label %if.end4

if.end4:                                          ; preds = %if.else3, %if.then2
  %2 = load i1, i1* %if.value1
  br i1 false, label %if.then6, label %if.else7

if.then6:                                         ; preds = %if.end4
  store i1 true, i1* %if.value5
  br label %if.end8

if.else7:                                         ; preds = %if.end4
  store i1 false, i1* %if.value5
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %3 = load i1, i1* %if.value5
  call void @Tuple2_bjE(%Tuple2_bjE* sret %callRet, i1 %3, i32 151)
  %4 = bitcast %Tuple2_bjE* %var22 to i8*
  %5 = bitcast %Tuple2_bjE* %callRet to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 4 %5, i64 8, i1 false)
  store i1 true, i1* %var30
  %6 = bitcast %Unit.Type* %if.value27 to i8*
  %7 = bitcast %Unit.Type* @Unit.Val to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 %7, i64 1, i1 false)
  store double -5.500000e+01, double* %var843
  br i1 false, label %if.then11, label %if.else12

if.then11:                                        ; preds = %if.end8
  %8 = bitcast %Tuple2_bjE* %if.value10 to i8*
  %9 = bitcast %Tuple2_bjE* %var22 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 4 %9, i64 8, i1 false)
  br label %if.end17

if.else12:                                        ; preds = %if.end8
  %10 = load i1, i1* %var30
  br i1 %10, label %if.then14, label %if.else15

if.then14:                                        ; preds = %if.else12
  %11 = bitcast %Tuple2_bjE* %if.value13 to i8*
  %12 = bitcast %Tuple2_bjE* %var22 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 4 %12, i64 8, i1 false)
  br label %if.end16

if.else15:                                        ; preds = %if.else12
  %13 = bitcast %Tuple2_bjE* %if.value13 to i8*
  %14 = bitcast %Tuple2_bjE* %var22 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %13, i8* align 4 %14, i64 8, i1 false)
  br label %if.end16

if.end16:                                         ; preds = %if.else15, %if.then14
  %15 = bitcast %Tuple2_bjE* %if.value10 to i8*
  %16 = bitcast %Tuple2_bjE* %if.value13 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %15, i8* align 4 %16, i64 8, i1 false)
  br label %if.end17

if.end17:                                         ; preds = %if.end16, %if.then11
  %17 = getelementptr inbounds %Tuple2_bjE, %Tuple2_bjE* %if.value10, i32 0, i32 0
  %18 = load i1, i1* %17
  br i1 %18, label %if.then18, label %if.else31

if.then18:                                        ; preds = %if.end17
  %19 = call i1 @"_ZN7default6func46E$optionalParam47___0v"(i8 addrspace(1)* null)
  %20 = load i16, i16* @_ZN7default6var469E
  %21 = load i32, i32* @_ZN7default6var581E
  %22 = load i16, i16* @_ZN7default6var469E
  %23 = load i32, i32* @_ZN7default6var581E
  call void @"_ZN7default6func46E$optionalParam54___0btc"(%Tuple2_bjE* sret %callRet19, i8 addrspace(1)* null, i1 %19, i16 %22, i32 %23)
  call void @_ZN7default6func46EbtcTuple2_bjE(%Unit.Type* sret %if.value27, i8 addrspace(1)* null, i1 %19, i16 %20, i32 %21, %Tuple2_bjE* %callRet19)
  br i1 false, label %if.then22, label %if.else24

if.then22:                                        ; preds = %if.then18
  %24 = load i16, i16* @_ZN7default6var221E
  %25 = load i8, i8* @_ZN7default6var838E
  call void @Tuple3_sdhE(%Tuple3_sdhE* sret %callRet23, i16 %24, double -5.200000e+01, i8 %25)
  %26 = bitcast %Tuple3_sdhE* %if.value21 to i8*
  %27 = bitcast %Tuple3_sdhE* %callRet23 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %26, i8* align 8 %27, i64 24, i1 false)
  br label %if.end26

if.else24:                                        ; preds = %if.then18
  %28 = load double, double* %var843
  %29 = load i8, i8* @_ZN7default6var555E
  call void @Tuple3_sdhE(%Tuple3_sdhE* sret %callRet25, i16 11, double %28, i8 %29)
  %30 = bitcast %Tuple3_sdhE* %if.value21 to i8*
  %31 = bitcast %Tuple3_sdhE* %callRet25 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %30, i8* align 8 %31, i64 24, i1 false)
  br label %if.end26

if.end26:                                         ; preds = %if.else24, %if.then22
  %32 = load i1, i1* @_ZN7default6var399E
  br i1 %32, label %if.then28, label %if.else29

if.then28:                                        ; preds = %if.end26
  br label %if.end30

if.else29:                                        ; preds = %if.end26
  br label %if.end30

if.end30:                                         ; preds = %if.else29, %if.then28
  br label %if.end32

if.else31:                                        ; preds = %if.end17
  br label %if.end32

if.end32:                                         ; preds = %if.else31, %if.end30
  call void @_ZN7default10Aggregate84initEv(%record._ZN7default10Aggregate8E* sret %callRet33, i8 addrspace(1)* null)
  %33 = bitcast %record._ZN7default10Aggregate8E* %0 to i8*
  %34 = bitcast %record._ZN7default10Aggregate8E* %callRet33 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %33, i8* align 1 %34, i64 1, i1 false)
  ret void

unreachable:                                      ; No predecessors!
  ret void
}

define weak_odr i8 addrspace(1)* @"_ZN040$Lambda__ZN7default6func46EbtcTuple2_bjE.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN040$Lambda__ZN7default6func46EbtcTuple2_bjE.objKlass")
  ret i8 addrspace(1)* %0
}

define void @_ZN7default6func46EbtcTuple2_bjE(%Unit.Type* noalias sret, i8 addrspace(1)* %context, i1 %optionalParam47, i16 %namedParam52, i32 %namedParam53, %Tuple2_bjE* %optionalParam54) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %1 = alloca %Unit.Type
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  br i1 false, label %if.then, label %if.else7

if.then:                                          ; preds = %chirblock.body
  br i1 true, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.then
  br label %if.end6

if.else:                                          ; preds = %if.then
  br i1 %optionalParam47, label %if.then4, label %if.else5

if.then4:                                         ; preds = %if.else
  br label %if.end

if.else5:                                         ; preds = %if.else
  br label %if.end

if.end:                                           ; preds = %if.else5, %if.then4
  br label %if.end6

if.end6:                                          ; preds = %if.end, %if.then2
  call void @_ZN7default6func73Ev(%Unit.Type* sret %1, i8 addrspace(1)* null)
  br label %if.end8

if.else7:                                         ; preds = %chirblock.body
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.end6
  ret void

unreachable:                                      ; No predecessors!
  ret void
}

define weak_odr i8 addrspace(1)* @"_ZN028$Lambda__ZN7default6func73Ev.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN028$Lambda__ZN7default6func73Ev.objKlass")
  ret i8 addrspace(1)* %0
}

define void @_ZN7default6func73Ev(%Unit.Type* noalias sret, i8 addrspace(1)* %context) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %1 = alloca %Unit.Type
  %if.value35 = alloca i1
  %if.value31 = alloca i1
  %if.value25 = alloca i1
  %callRet22 = alloca %Tuple2_t10Aggregate8E
  %callRet21 = alloca %record._ZN7default10Aggregate8E
  %callRet19 = alloca %Tuple2_t10Aggregate8E
  %callRet18 = alloca %record._ZN7default10Aggregate8E
  %if.value16 = alloca %Tuple2_t10Aggregate8E
  %callRet14 = alloca %Tuple2_t10Aggregate8E
  %callRet13 = alloca %record._ZN7default10Aggregate8E
  %if.value11 = alloca %Tuple2_t10Aggregate8E
  %var813 = alloca %Tuple2_t10Aggregate8E
  %callRet9 = alloca %Tuple2_t10Aggregate8E
  %callRet8 = alloca %record._ZN7default10Aggregate8E
  %var806 = alloca %Tuple2_t10Aggregate8E
  %callRet6 = alloca %Tuple2_t10Aggregate8E
  %callRet5 = alloca %record._ZN7default10Aggregate8E
  %if.value3 = alloca %Tuple2_t10Aggregate8E
  %callRet2 = alloca %Tuple2_t10Aggregate8E
  %callRet1 = alloca %record._ZN7default10Aggregate8E
  %if.value = alloca %Tuple2_t10Aggregate8E
  %callRet = alloca %record._ZN7default10Aggregate8E
  %var89 = alloca i8 addrspace(1)*
  %2 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @_ZN7default21__Auto__Environment_6.objKlass)
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %3 = call i8 addrspace(1)* @_ZN7default7Class764initEv()
  store i8 addrspace(1)* %3, i8 addrspace(1)** %var89
  %4 = load i8 addrspace(1)*, i8 addrspace(1)** %var89
  %5 = bitcast i8 addrspace(1)* %2 to %ObjLayout._ZN7default21__Auto__Environment_6 addrspace(1)*
  %6 = getelementptr %ObjLayout._ZN7default21__Auto__Environment_6, %ObjLayout._ZN7default21__Auto__Environment_6 addrspace(1)* %5, i32 0, i32 1
  call void @llvm.gcwrite.cj(i8 addrspace(1)* %4, i8 addrspace(1)* %2, i8 addrspace(1)* addrspace(1)* %6)
  %7 = load float, float* @_ZN7default6var278E
  %8 = load i16, i16* @_ZN7default6var469E
  %9 = load i1, i1* @_ZN7default6var185E
  %10 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIbE$Some1.init"(i64 0, i1 %9)
  %11 = load i32, i32* @_ZN7default6var474E
  call void @_ZN7default7func281Et6Optionbi(%record._ZN7default10Aggregate8E* sret %callRet, i8 addrspace(1)* null, i16 %8, i8 addrspace(1)* %10, i32 %11)
  %12 = load i8, i8* getelementptr inbounds (%Tuple3_sdhE, %Tuple3_sdhE* @_ZN7default6var479IsdhE, i32 0, i32 2)
  %13 = call i8 addrspace(1)* @_ZN7default6func736func80Ef10Aggregate8h(i8 addrspace(1)* %2, float %7, %record._ZN7default10Aggregate8E* %callRet, i8 %12)
  %14 = bitcast i8 addrspace(1)* %13 to %ObjLayout._ZN7default7Class76E addrspace(1)*
  %15 = getelementptr %ObjLayout._ZN7default7Class76E, %ObjLayout._ZN7default7Class76E addrspace(1)* %14, i32 0, i32 5
  %16 = load i8, i8 addrspace(1)* %15
  %17 = load i1, i1* @_ZN7default5var99E
  br i1 %17, label %if.then, label %if.else

if.then:                                          ; preds = %chirblock.body
  %18 = load i16, i16* @_ZN7default6var469E
  call void @_ZN7default10Aggregate84initEv(%record._ZN7default10Aggregate8E* sret %callRet1, i8 addrspace(1)* null)
  call void @Tuple2_t10Aggregate8E(%Tuple2_t10Aggregate8E* sret %callRet2, i16 %18, %record._ZN7default10Aggregate8E* %callRet1)
  %19 = bitcast %Tuple2_t10Aggregate8E* %if.value to i8*
  %20 = bitcast %Tuple2_t10Aggregate8E* %callRet2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %19, i8* align 2 %20, i64 4, i1 false)
  br label %if.end10

if.else:                                          ; preds = %chirblock.body
  br i1 true, label %if.then4, label %if.else7

if.then4:                                         ; preds = %if.else
  call void @_ZN7default10Aggregate84initEv(%record._ZN7default10Aggregate8E* sret %callRet5, i8 addrspace(1)* null)
  call void @Tuple2_t10Aggregate8E(%Tuple2_t10Aggregate8E* sret %callRet6, i16 12, %record._ZN7default10Aggregate8E* %callRet5)
  %21 = bitcast %Tuple2_t10Aggregate8E* %var806 to i8*
  %22 = bitcast %Tuple2_t10Aggregate8E* %callRet6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %21, i8* align 2 %22, i64 4, i1 false)
  %23 = bitcast %Tuple2_t10Aggregate8E* %if.value3 to i8*
  %24 = bitcast %Tuple2_t10Aggregate8E* %var806 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %23, i8* align 2 %24, i64 4, i1 false)
  br label %if.end

if.else7:                                         ; preds = %if.else
  call void @_ZN7default10Aggregate84initEv(%record._ZN7default10Aggregate8E* sret %callRet8, i8 addrspace(1)* null)
  call void @Tuple2_t10Aggregate8E(%Tuple2_t10Aggregate8E* sret %callRet9, i16 12, %record._ZN7default10Aggregate8E* %callRet8)
  %25 = bitcast %Tuple2_t10Aggregate8E* %var813 to i8*
  %26 = bitcast %Tuple2_t10Aggregate8E* %callRet9 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %25, i8* align 2 %26, i64 4, i1 false)
  %27 = bitcast %Tuple2_t10Aggregate8E* %if.value3 to i8*
  %28 = bitcast %Tuple2_t10Aggregate8E* %var813 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %27, i8* align 2 %28, i64 4, i1 false)
  br label %if.end

if.end:                                           ; preds = %if.else7, %if.then4
  %29 = bitcast %Tuple2_t10Aggregate8E* %if.value to i8*
  %30 = bitcast %Tuple2_t10Aggregate8E* %if.value3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %29, i8* align 2 %30, i64 4, i1 false)
  br label %if.end10

if.end10:                                         ; preds = %if.end, %if.then
  %31 = load i1, i1* @_ZN7default5var99E
  br i1 %31, label %if.then12, label %if.else15

if.then12:                                        ; preds = %if.end10
  %32 = load i16, i16* @_ZN7default6var469E
  call void @_ZN7default10Aggregate84initEv(%record._ZN7default10Aggregate8E* sret %callRet13, i8 addrspace(1)* null)
  call void @Tuple2_t10Aggregate8E(%Tuple2_t10Aggregate8E* sret %callRet14, i16 %32, %record._ZN7default10Aggregate8E* %callRet13)
  %33 = bitcast %Tuple2_t10Aggregate8E* %if.value11 to i8*
  %34 = bitcast %Tuple2_t10Aggregate8E* %callRet14 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %33, i8* align 2 %34, i64 4, i1 false)
  br label %if.end24

if.else15:                                        ; preds = %if.end10
  br i1 true, label %if.then17, label %if.else20

if.then17:                                        ; preds = %if.else15
  call void @_ZN7default10Aggregate84initEv(%record._ZN7default10Aggregate8E* sret %callRet18, i8 addrspace(1)* null)
  call void @Tuple2_t10Aggregate8E(%Tuple2_t10Aggregate8E* sret %callRet19, i16 12, %record._ZN7default10Aggregate8E* %callRet18)
  %35 = bitcast %Tuple2_t10Aggregate8E* %var806 to i8*
  %36 = bitcast %Tuple2_t10Aggregate8E* %callRet19 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %35, i8* align 2 %36, i64 4, i1 false)
  %37 = bitcast %Tuple2_t10Aggregate8E* %if.value16 to i8*
  %38 = bitcast %Tuple2_t10Aggregate8E* %var806 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %37, i8* align 2 %38, i64 4, i1 false)
  br label %if.end23

if.else20:                                        ; preds = %if.else15
  call void @_ZN7default10Aggregate84initEv(%record._ZN7default10Aggregate8E* sret %callRet21, i8 addrspace(1)* null)
  call void @Tuple2_t10Aggregate8E(%Tuple2_t10Aggregate8E* sret %callRet22, i16 12, %record._ZN7default10Aggregate8E* %callRet21)
  %39 = bitcast %Tuple2_t10Aggregate8E* %var813 to i8*
  %40 = bitcast %Tuple2_t10Aggregate8E* %callRet22 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %39, i8* align 2 %40, i64 4, i1 false)
  %41 = bitcast %Tuple2_t10Aggregate8E* %if.value16 to i8*
  %42 = bitcast %Tuple2_t10Aggregate8E* %var813 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %41, i8* align 2 %42, i64 4, i1 false)
  br label %if.end23

if.end23:                                         ; preds = %if.else20, %if.then17
  %43 = bitcast %Tuple2_t10Aggregate8E* %if.value11 to i8*
  %44 = bitcast %Tuple2_t10Aggregate8E* %if.value16 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %43, i8* align 2 %44, i64 4, i1 false)
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %if.then12
  %45 = call i32 @"_ZN7default7Class767func491E$optionalParam493___0Tuple2_t10Aggregate8E"(i8 addrspace(1)* null, %Tuple2_t10Aggregate8E* %if.value11)
  %46 = load i1, i1* @_ZN7default6var104E
  br i1 %46, label %if.then26, label %if.else27

if.then26:                                        ; preds = %if.end24
  %47 = load i1, i1* @_ZN7default6var185E
  store i1 %47, i1* %if.value25
  br label %if.end28

if.else27:                                        ; preds = %if.end24
  %48 = load i1, i1* @_ZN7default6var185E
  store i1 %48, i1* %if.value25
  br label %if.end28

if.end28:                                         ; preds = %if.else27, %if.then26
  %49 = load i1, i1* %if.value25
  call void @_ZN7default7Class767func491ETuple2_t10Aggregate8Ejb(%Unit.Type* sret %1, i8 addrspace(1)* null, %Tuple2_t10Aggregate8E* %if.value, i32 %45, i1 %49)
  br i1 true, label %if.then32, label %if.else33

if.then32:                                        ; preds = %if.end28
  %50 = load i1, i1* @_ZN7default6var568E
  store i1 %50, i1* %if.value31
  br label %if.end34

if.else33:                                        ; preds = %if.end28
  store i1 false, i1* %if.value31
  br label %if.end34

if.end34:                                         ; preds = %if.else33, %if.then32
  %51 = load i1, i1* %if.value31
  br i1 false, label %if.then36, label %if.else37

if.then36:                                        ; preds = %if.end34
  store i1 true, i1* %if.value35
  br label %if.end38

if.else37:                                        ; preds = %if.end34
  store i1 false, i1* %if.value35
  br label %if.end38

if.end38:                                         ; preds = %if.else37, %if.then36
  %52 = load i1, i1* %if.value35
  br i1 %52, label %if.then39, label %if.else40

if.then39:                                        ; preds = %if.end38
  br label %if.end41

if.else40:                                        ; preds = %if.end38
  br label %if.end41

if.end41:                                         ; preds = %if.else40, %if.then39
  ret void

unreachable:                                      ; No predecessors!
  ret void
}

define weak_odr i8 addrspace(1)* @"_ZN038$Lambda__ZN7default7func281Et6Optionbi.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN038$Lambda__ZN7default7func281Et6Optionbi.objKlass")
  ret i8 addrspace(1)* %0
}

define void @_ZN7default7func281Et6Optionbi(%record._ZN7default10Aggregate8E* noalias sret, i8 addrspace(1)* %context, i16 %optionalParam282, i8 addrspace(1)* %namedParam284, i32 %namedParam285) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %callRet40 = alloca %record._ZN7default10Aggregate8E
  %callRet38 = alloca %record._ZN7default10Aggregate8E
  %if.value36 = alloca %record._ZN7default10Aggregate8E
  %callRet34 = alloca %record._ZN7default10Aggregate8E
  %x = alloca %Unit.Type
  %if.value14 = alloca i1
  %if.value13 = alloca i1
  %if.value10 = alloca i1
  %if.value9 = alloca %record._ZN7default10Aggregate8E
  %var372 = alloca %Tuple3_u6Option10Aggregate8jE
  %callRet8 = alloca %Tuple3_u6Option10Aggregate8jE
  %var300 = alloca %Tuple4_iulmE
  %callRet = alloca %Tuple4_iulmE
  %loopTimeVar296 = alloca i64
  %var293 = alloca i32
  %1 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @_ZN7default21__Auto__Environment_8.objKlass)
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  store i32 114, i32* %var293
  store i64 0, i64* %loopTimeVar296
  call void @Tuple4_iulmE(%Tuple4_iulmE* sret %callRet, i32 -61, %Unit.Type* @Unit.Val, i64 -106, i64 253)
  %2 = bitcast %Tuple4_iulmE* %var300 to i8*
  %3 = bitcast %Tuple4_iulmE* %callRet to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 8 %3, i64 24, i1 false)
  br i1 true, label %if.then, label %if.else6

if.then:                                          ; preds = %chirblock.body
  br label %chirblock.start2

chirblock.start2:                                 ; preds = %if.end, %if.then
  br label %chirblock.body3

chirblock.body3:                                  ; preds = %chirblock.start2
  br i1 true, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %chirblock.body3
  %4 = load i64, i64* %loopTimeVar296
  %icmpslt = icmp slt i64 %4, 100
  br label %land.end

land.end:                                         ; preds = %land.rhs, %chirblock.body3
  %conv = phi i1 [ false, %chirblock.body3 ], [ %icmpslt, %land.rhs ]
  br i1 %conv, label %if.then5, label %if.else

if.then5:                                         ; preds = %land.end
  %5 = load i64, i64* %loopTimeVar296
  %6 = call i64 @"_ZN12core$FS$core0l11throwingIncEv"(i8 addrspace(1)* null, i64 %5)
  store i64 %6, i64* %loopTimeVar296
  %7 = load i32, i32* %var293
  br label %if.end

if.else:                                          ; preds = %land.end
  %8 = bitcast %Unit.Type* %x to i8*
  %9 = bitcast %Unit.Type* @Unit.Val to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %8, i8* align 1 %9, i64 1, i1 false)
  br i1 true, label %chirblock.end, label %unreachable

unreachable:                                      ; preds = %if.else
  br label %if.end

if.end:                                           ; preds = %unreachable, %if.then5
  br label %chirblock.start2

chirblock.end:                                    ; preds = %if.else
  br label %if.end7

if.else6:                                         ; preds = %chirblock.body
  %10 = getelementptr inbounds %Tuple4_iulmE, %Tuple4_iulmE* %var300, i32 0, i32 1
  br label %if.end7

if.end7:                                          ; preds = %if.else6, %chirblock.end
  %11 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E$Some1.init"(i64 0, %record._ZN7default10Aggregate8E* @_ZN7default6var354E)
  call void @Tuple3_u6Option10Aggregate8jE(%Tuple3_u6Option10Aggregate8jE* sret %callRet8, %Unit.Type* @Unit.Val, i8 addrspace(1)* %11, i32 163)
  %12 = bitcast %Tuple3_u6Option10Aggregate8jE* %var372 to i8*
  %13 = bitcast %Tuple3_u6Option10Aggregate8jE* %callRet8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %12, i8* align 8 %13, i64 24, i1 false)
  %14 = load i8 addrspace(1)*, i8 addrspace(1)** @_ZN7default6var268E
  %15 = bitcast i8 addrspace(1)* %14 to %ObjLayout._ZN7default7Class76E addrspace(1)*
  %16 = getelementptr %ObjLayout._ZN7default7Class76E, %ObjLayout._ZN7default7Class76E addrspace(1)* %15, i32 0, i32 3
  %17 = load i1, i1 addrspace(1)* %16
  br i1 %17, label %if.then11, label %if.else12

if.then11:                                        ; preds = %if.end7
  %18 = load i1, i1* @_ZN7default6var104E
  store i1 %18, i1* %if.value10
  br label %if.end21

if.else12:                                        ; preds = %if.end7
  br i1 false, label %if.then15, label %if.else16

if.then15:                                        ; preds = %if.else12
  store i1 false, i1* %if.value14
  br label %if.end17

if.else16:                                        ; preds = %if.else12
  store i1 true, i1* %if.value14
  br label %if.end17

if.end17:                                         ; preds = %if.else16, %if.then15
  %19 = load i1, i1* %if.value14
  br i1 %19, label %if.then18, label %if.else19

if.then18:                                        ; preds = %if.end17
  store i1 false, i1* %if.value13
  br label %if.end20

if.else19:                                        ; preds = %if.end17
  store i1 false, i1* %if.value13
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %if.then18
  %20 = load i1, i1* %if.value13
  store i1 %20, i1* %if.value10
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.then11
  %21 = load i1, i1* %if.value10
  %22 = bitcast i8 addrspace(1)* %1 to %ObjLayout._ZN7default21__Auto__Environment_8 addrspace(1)*
  %23 = getelementptr %ObjLayout._ZN7default21__Auto__Environment_8, %ObjLayout._ZN7default21__Auto__Environment_8 addrspace(1)* %22, i32 0, i32 1
  %24 = bitcast %Tuple3_u6Option10Aggregate8jE addrspace(1)* %23 to i8 addrspace(1)*
  %25 = addrspacecast %Tuple3_u6Option10Aggregate8jE* %var372 to i8 addrspace(1)*
  call void @llvm.gcwrite.agg.cj(i8 addrspace(1)* %1, i8 addrspace(1)* %24, i8 addrspace(1)* %25, i64 24)
  br i1 %21, label %if.then22, label %if.else35

if.then22:                                        ; preds = %if.end21
  %26 = load i1, i1* @_ZN7default6var104E
  br i1 %26, label %if.then24, label %if.else25

if.then24:                                        ; preds = %if.then22
  br label %if.end26

if.else25:                                        ; preds = %if.then22
  br label %if.end26

if.end26:                                         ; preds = %if.else25, %if.then24
  %27 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE.init"(i64 1)
  %28 = bitcast i8 addrspace(1)* %27 to %"ObjLayout._ZN7default12core$FS$core6OptionIuE" addrspace(1)*
  %29 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIuE", %"ObjLayout._ZN7default12core$FS$core6OptionIuE" addrspace(1)* %28, i32 0, i32 1
  %30 = load i64, i64 addrspace(1)* %29
  %icmpeq = icmp eq i64 %30, 0
  br i1 %icmpeq, label %land.rhs28, label %land.end29

land.rhs28:                                       ; preds = %if.end26
  br label %land.end29

land.end29:                                       ; preds = %land.rhs28, %if.end26
  %conv30 = phi i1 [ false, %if.end26 ], [ true, %land.rhs28 ]
  br i1 %conv30, label %if.then31, label %if.else32

if.then31:                                        ; preds = %land.end29
  %31 = bitcast i8 addrspace(1)* %27 to %"ObjLayout._ZN7default12core$FS$core6OptionIuE$Some1" addrspace(1)*
  %32 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIuE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionIuE$Some1" addrspace(1)* %31, i32 0, i32 1
  %33 = bitcast %Unit.Type* %x to i8*
  %34 = bitcast %Unit.Type addrspace(1)* %32 to i8 addrspace(1)*
  call void @llvm.memcpy.p0i8.p1i8.i64(i8* align 1 %33, i8 addrspace(1)* align 1 %34, i64 1, i1 false)
  br label %if.end33

if.else32:                                        ; preds = %land.end29
  br label %if.end33

if.end33:                                         ; preds = %if.else32, %if.then31
  %35 = load float, float* @_ZN7default6var278E
  %36 = load i32, i32* @_ZN7default6var229E
  %37 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE$Some1.init"(i64 0, %Unit.Type* @_ZN7default5var39E)
  call void @_ZN7default7func2817func341Efi6Optionuc(%record._ZN7default10Aggregate8E* sret %callRet34, i8 addrspace(1)* %1, float %35, i32 %36, i8 addrspace(1)* %37, i32 86)
  %38 = bitcast %record._ZN7default10Aggregate8E* %if.value9 to i8*
  %39 = bitcast %record._ZN7default10Aggregate8E* %callRet34 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %38, i8* align 1 %39, i64 1, i1 false)
  br label %if.end42

if.else35:                                        ; preds = %if.end21
  %40 = load i8 addrspace(1)*, i8 addrspace(1)** @_ZN7default12Aggregate453IGT1EGT2E6var458IuE
  br i1 false, label %if.then37, label %if.else39

if.then37:                                        ; preds = %if.else35
  call void @_ZN7default10Aggregate84initEv(%record._ZN7default10Aggregate8E* sret %callRet38, i8 addrspace(1)* null)
  %41 = bitcast %record._ZN7default10Aggregate8E* %if.value36 to i8*
  %42 = bitcast %record._ZN7default10Aggregate8E* %callRet38 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %41, i8* align 1 %42, i64 1, i1 false)
  br label %if.end41

if.else39:                                        ; preds = %if.else35
  call void @_ZN7default10Aggregate84initEv(%record._ZN7default10Aggregate8E* sret %callRet40, i8 addrspace(1)* null)
  %43 = bitcast %record._ZN7default10Aggregate8E* %if.value36 to i8*
  %44 = bitcast %record._ZN7default10Aggregate8E* %callRet40 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %43, i8* align 1 %44, i64 1, i1 false)
  br label %if.end41

if.end41:                                         ; preds = %if.else39, %if.then37
  %45 = bitcast %record._ZN7default10Aggregate8E* %if.value9 to i8*
  %46 = bitcast %record._ZN7default10Aggregate8E* %if.value36 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %45, i8* align 1 %46, i64 1, i1 false)
  br label %if.end42

if.end42:                                         ; preds = %if.end41, %if.end33
  %47 = bitcast %record._ZN7default10Aggregate8E* %0 to i8*
  %48 = bitcast %record._ZN7default10Aggregate8E* %if.value9 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %47, i8* align 1 %48, i64 1, i1 false)
  ret void

unreachable43:                                    ; No predecessors!
  ret void
}

define weak_odr i8 addrspace(1)* @"_ZN059$Lambda__ZN7default7Class767func491ETuple2_t10Aggregate8Ejb.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN059$Lambda__ZN7default7Class767func491ETuple2_t10Aggregate8Ejb.objKlass")
  ret i8 addrspace(1)* %0
}

define void @_ZN7default7Class767func491ETuple2_t10Aggregate8Ejb(%Unit.Type* noalias sret, i8 addrspace(1)* %context, %Tuple2_t10Aggregate8E* %param492, i32 %optionalParam493, i1 %optionalParam495) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %1 = alloca %Unit.Type
  %var511 = alloca i1
  %if.value = alloca i1
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %2 = load i32, i32* @_ZN7default6var229E
  br i1 false, label %if.then, label %if.else

if.then:                                          ; preds = %chirblock.body
  store i1 true, i1* %if.value
  br label %if.end

if.else:                                          ; preds = %chirblock.body
  store i1 false, i1* %if.value
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i1, i1* %if.value
  store i1 %3, i1* %var511
  %4 = load i1, i1* @_ZN7default7Class766var506E
  br i1 %4, label %if.then2, label %if.else15

if.then2:                                         ; preds = %if.end
  %5 = load i1, i1* %var511
  br i1 %5, label %if.then4, label %if.else9

if.then4:                                         ; preds = %if.then2
  br i1 %optionalParam495, label %if.then6, label %if.else7

if.then6:                                         ; preds = %if.then4
  br label %if.end8

if.else7:                                         ; preds = %if.then4
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  br label %if.end14

if.else9:                                         ; preds = %if.then2
  br i1 %optionalParam495, label %if.then11, label %if.else12

if.then11:                                        ; preds = %if.else9
  br label %if.end13

if.else12:                                        ; preds = %if.else9
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  br label %if.end14

if.end14:                                         ; preds = %if.end13, %if.end8
  br label %if.end16

if.else15:                                        ; preds = %if.end
  %6 = load i16, i16* @_ZN7default7Class766var791E
  call void @_ZN7default7Class767func525Et(%Unit.Type* sret %1, i8 addrspace(1)* null, i16 %6)
  br label %if.end16

if.end16:                                         ; preds = %if.else15, %if.end14
  ret void

unreachable:                                      ; No predecessors!
  ret void
}

define weak_odr i8 addrspace(1)* @"_ZN039$Lambda__ZN7default7Class767func641Emmf.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN039$Lambda__ZN7default7Class767func641Emmf.objKlass")
  ret i8 addrspace(1)* %0
}

define double @_ZN7default7Class767func641Emmf(i8 addrspace(1)* %context, i64 %param642, i64 %optionalParam643, float %optionalParam645) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %if.value115 = alloca double
  %caseVar748 = alloca i32
  %if.value104 = alloca double
  %if.value90 = alloca double
  %callRet88 = alloca %Tuple2_bjE
  %x86 = alloca %Tuple2_bjE
  %if.value80 = alloca %Tuple2_bjE
  %if.value78 = alloca double
  %if.value66 = alloca %Unit.Type
  %callRet = alloca %Tuple3_u6Option10Aggregate8jE
  %var701 = alloca i8 addrspace(1)*
  %if.value32 = alloca i1
  %if.value29 = alloca i1
  %if.value22 = alloca i1
  %if.value17 = alloca i1
  %if.value15 = alloca i1
  %loopTimeVar720 = alloca i64
  %loopTimeVar704 = alloca i64
  %if.value1 = alloca i8 addrspace(1)*
  %x = alloca i8 addrspace(1)*
  %if.value = alloca i8 addrspace(1)*
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %0 = load i8 addrspace(1)*, i8 addrspace(1)** @_ZN7default6var661IuE
  %1 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI6OptionuE$Some1.init"(i64 0, i8 addrspace(1)* %0)
  %2 = bitcast i8 addrspace(1)* %1 to %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE" addrspace(1)*
  %3 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE", %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE" addrspace(1)* %2, i32 0, i32 1
  %4 = load i64, i64 addrspace(1)* %3
  %icmpeq = icmp eq i64 %4, 0
  br i1 %icmpeq, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %chirblock.body
  br label %land.end

land.end:                                         ; preds = %land.rhs, %chirblock.body
  %conv = phi i1 [ false, %chirblock.body ], [ true, %land.rhs ]
  br i1 %conv, label %if.then, label %if.else

if.then:                                          ; preds = %land.end
  %5 = bitcast i8 addrspace(1)* %1 to %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE$Some1" addrspace(1)*
  %6 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE$Some1" addrspace(1)* %5, i32 0, i32 1
  %7 = load i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)* %6
  store i8 addrspace(1)* %7, i8 addrspace(1)** %x
  %8 = load i8 addrspace(1)*, i8 addrspace(1)** %x
  store i8 addrspace(1)* %8, i8 addrspace(1)** %if.value
  br label %if.end

if.else:                                          ; preds = %land.end
  %9 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE$Some1.init"(i64 0, %Unit.Type* @_ZN7default5var39E)
  store i8 addrspace(1)* %9, i8 addrspace(1)** %if.value
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %10 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value
  br i1 false, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.end
  store %Unit.Type zeroinitializer, %Unit.Type* %if.value66
  %11 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE$Some1.init"(i64 0, %Unit.Type* %if.value66)
  store i8 addrspace(1)* %11, i8 addrspace(1)** %if.value1
  br label %if.end4

if.else3:                                         ; preds = %if.end
  %12 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE.init"(i64 1)
  store i8 addrspace(1)* %12, i8 addrspace(1)** %if.value1
  br label %if.end4

if.end4:                                          ; preds = %if.else3, %if.then2
  %13 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value1
  %14 = bitcast i8 addrspace(1)* %13 to %"ObjLayout._ZN7default12core$FS$core6OptionIuE" addrspace(1)*
  %15 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIuE", %"ObjLayout._ZN7default12core$FS$core6OptionIuE" addrspace(1)* %14, i32 0, i32 1
  %16 = load i64, i64 addrspace(1)* %15
  %icmpeq6 = icmp eq i64 %16, 0
  br i1 %icmpeq6, label %land.rhs7, label %land.end8

land.rhs7:                                        ; preds = %if.end4
  br label %land.end8

land.end8:                                        ; preds = %land.rhs7, %if.end4
  %conv9 = phi i1 [ false, %if.end4 ], [ true, %land.rhs7 ]
  br i1 %conv9, label %if.then10, label %if.else12

if.then10:                                        ; preds = %land.end8
  %17 = bitcast i8 addrspace(1)* %13 to %"ObjLayout._ZN7default12core$FS$core6OptionIuE$Some1" addrspace(1)*
  %18 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIuE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionIuE$Some1" addrspace(1)* %17, i32 0, i32 1
  %19 = bitcast %Unit.Type* %if.value66 to i8*
  %20 = bitcast %Unit.Type addrspace(1)* %18 to i8 addrspace(1)*
  call void @llvm.memcpy.p0i8.p1i8.i64(i8* align 1 %19, i8 addrspace(1)* align 1 %20, i64 1, i1 false)
  br label %if.end13

if.else12:                                        ; preds = %land.end8
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  store i64 0, i64* %loopTimeVar704
  store i64 0, i64* %loopTimeVar720
  br i1 false, label %if.then16, label %if.else21

if.then16:                                        ; preds = %if.end13
  %21 = load i1, i1* @_ZN7default7Class766var506E
  br i1 false, label %if.then18, label %if.else19

if.then18:                                        ; preds = %if.then16
  store i1 true, i1* %if.value17
  br label %if.end20

if.else19:                                        ; preds = %if.then16
  store i1 false, i1* %if.value17
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %if.then18
  %22 = load i1, i1* %if.value17
  store i1 %22, i1* %if.value15
  br label %if.end26

if.else21:                                        ; preds = %if.end13
  %23 = load i1, i1* @_ZN7default7Class766var506E
  br i1 false, label %if.then23, label %if.else24

if.then23:                                        ; preds = %if.else21
  store i1 true, i1* %if.value22
  br label %if.end25

if.else24:                                        ; preds = %if.else21
  store i1 false, i1* %if.value22
  br label %if.end25

if.end25:                                         ; preds = %if.else24, %if.then23
  %24 = load i1, i1* %if.value22
  store i1 %24, i1* %if.value15
  br label %if.end26

if.end26:                                         ; preds = %if.end25, %if.end20
  %25 = load i1, i1* %if.value15
  br i1 %25, label %if.then27, label %if.else54

if.then27:                                        ; preds = %if.end26
  br i1 true, label %if.then30, label %if.else31

if.then30:                                        ; preds = %if.then27
  %26 = load i16, i16* @_ZN7default6var221E
  %27 = load i1, i1* @_ZN7default5var99E
  store i1 %27, i1* %if.value29
  br label %if.end36

if.else31:                                        ; preds = %if.then27
  %28 = load i1, i1* @_ZN7default6var686E
  br i1 %28, label %if.then33, label %if.else34

if.then33:                                        ; preds = %if.else31
  %29 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI6OptionuE.init"(i64 1)
  %30 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E.init"(i64 1)
  %31 = load i1, i1* @_ZN7default7Class766var506E
  store i1 %31, i1* %if.value32
  br label %if.end35

if.else34:                                        ; preds = %if.else31
  store i1 false, i1* %if.value32
  br label %if.end35

if.end35:                                         ; preds = %if.else34, %if.then33
  %32 = load i1, i1* %if.value32
  store i1 %32, i1* %if.value29
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %if.then30
  %33 = load i1, i1* %if.value29
  br i1 %33, label %if.then37, label %if.else48

if.then37:                                        ; preds = %if.end36
  br label %chirblock.start39

chirblock.start39:                                ; preds = %if.end47, %if.then37
  br label %chirblock.body40

chirblock.body40:                                 ; preds = %chirblock.start39
  %34 = load i1, i1* @_ZN7default6var104E
  br i1 %34, label %land.rhs42, label %land.end43

land.rhs42:                                       ; preds = %chirblock.body40
  %35 = load i64, i64* %loopTimeVar704
  %icmpslt = icmp slt i64 %35, 100
  br label %land.end43

land.end43:                                       ; preds = %land.rhs42, %chirblock.body40
  %conv44 = phi i1 [ false, %chirblock.body40 ], [ %icmpslt, %land.rhs42 ]
  br i1 %conv44, label %if.then45, label %if.else46

if.then45:                                        ; preds = %land.end43
  %36 = load i64, i64* %loopTimeVar704
  %37 = call i64 @"_ZN12core$FS$core0l11throwingIncEv"(i8 addrspace(1)* null, i64 %36)
  store i64 %37, i64* %loopTimeVar704
  %38 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E.init"(i64 1)
  store i8 addrspace(1)* %38, i8 addrspace(1)** %var701
  %39 = load i8 addrspace(1)*, i8 addrspace(1)** %var701
  br label %if.end47

if.else46:                                        ; preds = %land.end43
  %40 = bitcast %Unit.Type* %if.value66 to i8*
  %41 = bitcast %Unit.Type* @Unit.Val to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %40, i8* align 1 %41, i64 1, i1 false)
  br i1 true, label %chirblock.end, label %unreachable

unreachable:                                      ; preds = %if.else46
  br label %if.end47

if.end47:                                         ; preds = %unreachable, %if.then45
  br label %chirblock.start39

chirblock.end:                                    ; preds = %if.else46
  br label %if.end53

if.else48:                                        ; preds = %if.end36
  %42 = load i1, i1* @_ZN7default5var99E
  br i1 %42, label %if.then50, label %if.else51

if.then50:                                        ; preds = %if.else48
  br label %if.end52

if.else51:                                        ; preds = %if.else48
  br label %if.end52

if.end52:                                         ; preds = %if.else51, %if.then50
  br label %if.end53

if.end53:                                         ; preds = %if.end52, %chirblock.end
  br label %if.end77

if.else54:                                        ; preds = %if.end26
  %43 = load i8 addrspace(1)*, i8 addrspace(1)** @_ZN7default6var126IuE
  %44 = bitcast i8 addrspace(1)* %43 to %"ObjLayout._ZN7default12core$FS$core6OptionIuE" addrspace(1)*
  %45 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIuE", %"ObjLayout._ZN7default12core$FS$core6OptionIuE" addrspace(1)* %44, i32 0, i32 1
  %46 = load i64, i64 addrspace(1)* %45
  %icmpeq56 = icmp eq i64 %46, 0
  br i1 %icmpeq56, label %land.rhs57, label %land.end58

land.rhs57:                                       ; preds = %if.else54
  br label %land.end58

land.end58:                                       ; preds = %land.rhs57, %if.else54
  %conv59 = phi i1 [ false, %if.else54 ], [ true, %land.rhs57 ]
  br i1 %conv59, label %if.then60, label %if.else62

if.then60:                                        ; preds = %land.end58
  %47 = bitcast i8 addrspace(1)* %43 to %"ObjLayout._ZN7default12core$FS$core6OptionIuE$Some1" addrspace(1)*
  %48 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIuE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionIuE$Some1" addrspace(1)* %47, i32 0, i32 1
  %49 = bitcast %Unit.Type* %if.value66 to i8*
  %50 = bitcast %Unit.Type addrspace(1)* %48 to i8 addrspace(1)*
  call void @llvm.memcpy.p0i8.p1i8.i64(i8* align 1 %49, i8 addrspace(1)* align 1 %50, i64 1, i1 false)
  br label %if.end76

if.else62:                                        ; preds = %land.end58
  br label %chirblock.start64

chirblock.start64:                                ; preds = %if.end74, %if.else62
  br label %chirblock.body65

chirblock.body65:                                 ; preds = %chirblock.start64
  %51 = load i64, i64* %loopTimeVar720
  %add = add i64 %51, 1
  store i64 %add, i64* %loopTimeVar720
  %52 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E.init"(i64 1)
  call void @Tuple3_u6Option10Aggregate8jE(%Tuple3_u6Option10Aggregate8jE* sret %callRet, %Unit.Type* @Unit.Val, i8 addrspace(1)* %52, i32 223)
  br i1 true, label %land.rhs67, label %land.end69

land.rhs67:                                       ; preds = %chirblock.body65
  %53 = load i64, i64* %loopTimeVar720
  %icmpslt68 = icmp slt i64 %53, 100
  br label %land.end69

land.end69:                                       ; preds = %land.rhs67, %chirblock.body65
  %conv70 = phi i1 [ false, %chirblock.body65 ], [ %icmpslt68, %land.rhs67 ]
  br i1 %conv70, label %if.then71, label %if.else72

if.then71:                                        ; preds = %land.end69
  br label %if.end74

if.else72:                                        ; preds = %land.end69
  %54 = bitcast %Unit.Type* %if.value66 to i8*
  %55 = bitcast %Unit.Type* @Unit.Val to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %54, i8* align 1 %55, i64 1, i1 false)
  br i1 true, label %chirblock.end75, label %unreachable73

unreachable73:                                    ; preds = %if.else72
  br label %if.end74

if.end74:                                         ; preds = %unreachable73, %if.then71
  br label %chirblock.start64

chirblock.end75:                                  ; preds = %if.else72
  br label %if.end76

if.end76:                                         ; preds = %chirblock.end75, %if.then60
  br label %if.end77

if.end77:                                         ; preds = %if.end76, %if.end53
  %56 = load i1, i1* @_ZN7default7Class766var506E
  br i1 %56, label %if.then79, label %if.else121

if.then79:                                        ; preds = %if.end77
  %57 = load i8 addrspace(1)*, i8 addrspace(1)** @_ZN7default7Class766var735ITuple2_bjEE
  %58 = bitcast i8 addrspace(1)* %57 to %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE" addrspace(1)*
  %59 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE", %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE" addrspace(1)* %58, i32 0, i32 1
  %60 = load i64, i64 addrspace(1)* %59
  %icmpeq81 = icmp eq i64 %60, 0
  br i1 %icmpeq81, label %land.rhs82, label %land.end83

land.rhs82:                                       ; preds = %if.then79
  br label %land.end83

land.end83:                                       ; preds = %land.rhs82, %if.then79
  %conv84 = phi i1 [ false, %if.then79 ], [ true, %land.rhs82 ]
  br i1 %conv84, label %if.then85, label %if.else87

if.then85:                                        ; preds = %land.end83
  %61 = bitcast i8 addrspace(1)* %57 to %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE$Some1" addrspace(1)*
  %62 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE$Some1" addrspace(1)* %61, i32 0, i32 1
  %63 = bitcast %Tuple2_bjE* %x86 to i8*
  %64 = bitcast %Tuple2_bjE addrspace(1)* %62 to i8 addrspace(1)*
  call void @llvm.memcpy.p0i8.p1i8.i64(i8* align 4 %63, i8 addrspace(1)* align 4 %64, i64 8, i1 false)
  %65 = bitcast %Tuple2_bjE* %if.value80 to i8*
  %66 = bitcast %Tuple2_bjE* %x86 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %65, i8* align 4 %66, i64 8, i1 false)
  br label %if.end89

if.else87:                                        ; preds = %land.end83
  call void @Tuple2_bjE(%Tuple2_bjE* sret %callRet88, i1 false, i32 178)
  %67 = bitcast %Tuple2_bjE* %if.value80 to i8*
  %68 = bitcast %Tuple2_bjE* %callRet88 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %67, i8* align 4 %68, i64 8, i1 false)
  br label %if.end89

if.end89:                                         ; preds = %if.else87, %if.then85
  %69 = getelementptr inbounds %Tuple2_bjE, %Tuple2_bjE* %if.value80, i32 0, i32 0
  %70 = load i1, i1* %69
  %icmpeq91 = icmp eq i1 %70, false
  br i1 %icmpeq91, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.end89
  %71 = getelementptr inbounds %Tuple2_bjE, %Tuple2_bjE* %if.value80, i32 0, i32 0
  %72 = load i1, i1* %71
  %icmpeq92 = icmp eq i1 %72, false
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.end89
  %conv93 = phi i1 [ true, %if.end89 ], [ %icmpeq92, %lor.rhs ]
  br i1 %conv93, label %land.rhs94, label %land.end100

land.rhs94:                                       ; preds = %lor.end
  %73 = getelementptr inbounds %Tuple2_bjE, %Tuple2_bjE* %if.value80, i32 0, i32 1
  %74 = load i32, i32* %73
  %75 = load i32, i32* @_ZN7default6var383E
  %icmpeq95 = icmp eq i32 %74, %75
  br i1 %icmpeq95, label %lor.end98, label %lor.rhs96

lor.rhs96:                                        ; preds = %land.rhs94
  %76 = getelementptr inbounds %Tuple2_bjE, %Tuple2_bjE* %if.value80, i32 0, i32 1
  %77 = load i32, i32* %76
  %icmpeq97 = icmp eq i32 %77, 182
  br label %lor.end98

lor.end98:                                        ; preds = %lor.rhs96, %land.rhs94
  %conv99 = phi i1 [ true, %land.rhs94 ], [ %icmpeq97, %lor.rhs96 ]
  br label %land.end100

land.end100:                                      ; preds = %lor.end98, %lor.end
  %conv101 = phi i1 [ false, %lor.end ], [ %conv99, %lor.end98 ]
  br i1 %conv101, label %if.then102, label %if.else103

if.then102:                                       ; preds = %land.end100
  store double 7.100000e+01, double* %if.value90
  br label %if.end120

if.else103:                                       ; preds = %land.end100
  br i1 false, label %land.rhs105, label %land.end111

land.rhs105:                                      ; preds = %if.else103
  %78 = getelementptr inbounds %Tuple2_bjE, %Tuple2_bjE* %if.value80, i32 0, i32 1
  %79 = load i32, i32* %78
  %icmpeq106 = icmp eq i32 %79, <null operand!>
  br i1 %icmpeq106, label %lor.end109, label %lor.rhs107

lor.rhs107:                                       ; preds = %land.rhs105
  %80 = getelementptr inbounds %Tuple2_bjE, %Tuple2_bjE* %if.value80, i32 0, i32 1
  %81 = load i32, i32* %80
  %icmpeq108 = icmp eq i32 %81, 148
  br label %lor.end109

lor.end109:                                       ; preds = %lor.rhs107, %land.rhs105
  %conv110 = phi i1 [ true, %land.rhs105 ], [ %icmpeq108, %lor.rhs107 ]
  br label %land.end111

land.end111:                                      ; preds = %lor.end109, %if.else103
  %conv112 = phi i1 [ false, %if.else103 ], [ %conv110, %lor.end109 ]
  br i1 %conv112, label %if.then113, label %if.else114

if.then113:                                       ; preds = %land.end111
  %82 = getelementptr inbounds %Tuple2_bjE, %Tuple2_bjE* %if.value80, i32 0, i32 0
  %83 = load i1, i1* %82
  store i32 0, i32* %caseVar748
  %84 = load double, double* @_ZN7default6var594E
  store double %84, double* %if.value104
  br label %if.end119

if.else114:                                       ; preds = %land.end111
  br i1 true, label %if.then116, label %if.else117

if.then116:                                       ; preds = %if.else114
  store double -8.500000e+01, double* %if.value115
  br label %if.end118

if.else117:                                       ; preds = %if.else114
  store double 3.800000e+01, double* %if.value115
  br label %if.end118

if.end118:                                        ; preds = %if.else117, %if.then116
  %85 = load double, double* %if.value115
  store double %85, double* %if.value104
  br label %if.end119

if.end119:                                        ; preds = %if.end118, %if.then113
  %86 = load double, double* %if.value104
  store double %86, double* %if.value90
  br label %if.end120

if.end120:                                        ; preds = %if.end119, %if.then102
  %87 = load double, double* %if.value90
  store double %87, double* %if.value78
  br label %if.end122

if.else121:                                       ; preds = %if.end77
  store double 7.700000e+01, double* %if.value78
  br label %if.end122

if.end122:                                        ; preds = %if.else121, %if.end120
  %88 = load double, double* %if.value78
  ret double %88

unreachable123:                                   ; No predecessors!
  ret double 0.000000e+00
}

define weak_odr i8 addrspace(1)* @"_ZN040$Lambda__ZN7default7Class767func630Ehsjc.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN040$Lambda__ZN7default7Class767func630Ehsjc.objKlass")
  ret i8 addrspace(1)* %0
}

define double @_ZN7default7Class767func630Ehsjc(i8 addrspace(1)* %context, i8 %param631, i16 %namedParam632, i32 %optionalParam633, i32 %optionalParam635) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %if.value5 = alloca i64
  %if.value1 = alloca i64
  %if.value = alloca i64
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  br i1 false, label %if.then, label %if.else

if.then:                                          ; preds = %chirblock.body
  store i64 229, i64* %if.value
  br label %if.end

if.else:                                          ; preds = %chirblock.body
  store i64 225, i64* %if.value
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %0 = load i64, i64* %if.value
  br i1 false, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.end
  store i64 229, i64* %if.value1
  br label %if.end4

if.else3:                                         ; preds = %if.end
  store i64 225, i64* %if.value1
  br label %if.end4

if.end4:                                          ; preds = %if.else3, %if.then2
  %1 = load i64, i64* %if.value1
  %2 = call i64 @"_ZN7default7Class767func641E$optionalParam643___0m"(i8 addrspace(1)* null, i64 %1)
  br i1 false, label %if.then6, label %if.else7

if.then6:                                         ; preds = %if.end4
  store i64 229, i64* %if.value5
  br label %if.end8

if.else7:                                         ; preds = %if.end4
  store i64 225, i64* %if.value5
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %3 = load i64, i64* %if.value5
  %4 = call float @"_ZN7default7Class767func641E$optionalParam645___0mm"(i8 addrspace(1)* null, i64 %3, i64 %2)
  %5 = call double @_ZN7default7Class767func641Emmf(i8 addrspace(1)* null, i64 %0, i64 %2, float %4)
  ret double %5

unreachable:                                      ; No predecessors!
  ret double 0.000000e+00
}

define weak_odr i8 addrspace(1)* @"_ZN037$Lambda__ZN7default7Class767func525Et.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN037$Lambda__ZN7default7Class767func525Et.objKlass")
  ret i8 addrspace(1)* %0
}

define void @_ZN7default7Class767func525Et(%Unit.Type* noalias sret, i8 addrspace(1)* %context, i16 %namedParam526) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %1 = alloca %Unit.Type
  %x32 = alloca %record._ZN7default10Aggregate8E
  %if.value26 = alloca %record._ZN7default10Aggregate8E
  %loopTimeVar789 = alloca i64
  %x = alloca double
  %if.value14 = alloca double
  %caseVar618 = alloca %Tuple3_sdhE
  %if.value8 = alloca i8 addrspace(1)*
  %if.value5 = alloca i8 addrspace(1)*
  %callRet4 = alloca %Tuple3_sdhE
  %if.value1 = alloca i1
  %if.value = alloca i8 addrspace(1)*
  %var585 = alloca %record._ZN7default10Aggregate8E
  %callRet = alloca %record._ZN7default10Aggregate8E
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %2 = load i64, i64* @_ZN7default6var248E
  %3 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI7Class76E.init"(i64 1)
  %4 = load i32, i32* @_ZN7default6var581E
  call void @_ZN7default10Aggregate84initEv(%record._ZN7default10Aggregate8E* sret %callRet, i8 addrspace(1)* null)
  %5 = bitcast %record._ZN7default10Aggregate8E* %var585 to i8*
  %6 = bitcast %record._ZN7default10Aggregate8E* %callRet to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 1, i1 false)
  %7 = call i8 addrspace(1)* @_ZN7default7Class767func531Em10Aggregate8u(i8 addrspace(1)* null, i64 %2, %record._ZN7default10Aggregate8E* %var585, %Unit.Type* @_ZN7default5var39E)
  %8 = load i1, i1* @_ZN7default7Class766var506E
  br i1 %8, label %if.then, label %if.else

if.then:                                          ; preds = %chirblock.body
  store i1 false, i1* %if.value1
  br label %if.end

if.else:                                          ; preds = %chirblock.body
  store i1 true, i1* %if.value1
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %9 = load i1, i1* %if.value1
  br i1 %9, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.end
  %10 = load i8 addrspace(1)*, i8 addrspace(1)** @_ZN7default7Class766var602IdE
  store i8 addrspace(1)* %10, i8 addrspace(1)** %if.value
  br label %if.end13

if.else3:                                         ; preds = %if.end
  %11 = load double, double* @_ZN7default6var594E
  call void @Tuple3_sdhE(%Tuple3_sdhE* sret %callRet4, i16 -44, double %11, i8 54)
  br i1 true, label %if.then6, label %if.else7

if.then6:                                         ; preds = %if.else3
  %12 = load i8 addrspace(1)*, i8 addrspace(1)** @_ZN7default6var126IuE
  %13 = load double, double* @_ZN7default6var594E
  %14 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIdE$Some1.init"(i64 0, double %13)
  store i8 addrspace(1)* %14, i8 addrspace(1)** %if.value5
  br label %if.end12

if.else7:                                         ; preds = %if.else3
  br i1 true, label %if.then9, label %if.else10

if.then9:                                         ; preds = %if.else7
  %15 = bitcast %Tuple3_sdhE* %caseVar618 to i8*
  %16 = bitcast %Tuple3_sdhE* %callRet4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %15, i8* align 8 %16, i64 24, i1 false)
  %17 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIdE.init"(i64 1)
  store i8 addrspace(1)* %17, i8 addrspace(1)** %if.value8
  br label %if.end11

if.else10:                                        ; preds = %if.else7
  %18 = load i8 addrspace(1)*, i8 addrspace(1)** @_ZN7default7Class766var602IdE
  store i8 addrspace(1)* %18, i8 addrspace(1)** %if.value8
  br label %if.end11

if.end11:                                         ; preds = %if.else10, %if.then9
  %19 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value8
  store i8 addrspace(1)* %19, i8 addrspace(1)** %if.value5
  br label %if.end12

if.end12:                                         ; preds = %if.end11, %if.then6
  %20 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value5
  store i8 addrspace(1)* %20, i8 addrspace(1)** %if.value
  br label %if.end13

if.end13:                                         ; preds = %if.end12, %if.then2
  %21 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value
  %22 = bitcast i8 addrspace(1)* %21 to %"ObjLayout._ZN7default12core$FS$core6OptionIdE" addrspace(1)*
  %23 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIdE", %"ObjLayout._ZN7default12core$FS$core6OptionIdE" addrspace(1)* %22, i32 0, i32 1
  %24 = load i64, i64 addrspace(1)* %23
  %icmpeq = icmp eq i64 %24, 0
  br i1 %icmpeq, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end13
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end13
  %conv = phi i1 [ false, %if.end13 ], [ true, %land.rhs ]
  br i1 %conv, label %if.then15, label %if.else16

if.then15:                                        ; preds = %land.end
  %25 = bitcast i8 addrspace(1)* %21 to %"ObjLayout._ZN7default12core$FS$core6OptionIdE$Some1" addrspace(1)*
  %26 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIdE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionIdE$Some1" addrspace(1)* %25, i32 0, i32 1
  %27 = load double, double addrspace(1)* %26
  store double %27, double* %x
  %28 = load double, double* %x
  store double %28, double* %if.value14
  br label %if.end17

if.else16:                                        ; preds = %land.end
  %29 = call double @_ZN7default7Class767func630Ehsjc(i8 addrspace(1)* null, i8 77, i16 15, i32 5, i32 119)
  store double %29, double* %if.value14
  br label %if.end17

if.end17:                                         ; preds = %if.else16, %if.then15
  %30 = load double, double* %if.value14
  store i64 0, i64* %loopTimeVar789
  br label %chirblock.start19

chirblock.start19:                                ; preds = %if.end36, %if.end17
  br label %chirblock.body20

chirblock.body20:                                 ; preds = %chirblock.start19
  %31 = load i1, i1* @_ZN7default6var399E
  br i1 %31, label %land.rhs22, label %land.end23

land.rhs22:                                       ; preds = %chirblock.body20
  %32 = load i64, i64* %loopTimeVar789
  %icmpslt = icmp slt i64 %32, 100
  br label %land.end23

land.end23:                                       ; preds = %land.rhs22, %chirblock.body20
  %conv24 = phi i1 [ false, %chirblock.body20 ], [ %icmpslt, %land.rhs22 ]
  br i1 %conv24, label %if.then25, label %if.else35

if.then25:                                        ; preds = %land.end23
  %33 = load i64, i64* %loopTimeVar789
  %34 = call i64 @"_ZN12core$FS$core0l11throwingIncEv"(i8 addrspace(1)* null, i64 %33)
  store i64 %34, i64* %loopTimeVar789
  %35 = load i8 addrspace(1)*, i8 addrspace(1)** @_ZN7default6var781I10Aggregate8E
  %36 = bitcast i8 addrspace(1)* %35 to %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E" addrspace(1)*
  %37 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E", %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E" addrspace(1)* %36, i32 0, i32 1
  %38 = load i64, i64 addrspace(1)* %37
  %icmpeq27 = icmp eq i64 %38, 0
  br i1 %icmpeq27, label %land.rhs28, label %land.end29

land.rhs28:                                       ; preds = %if.then25
  br label %land.end29

land.end29:                                       ; preds = %land.rhs28, %if.then25
  %conv30 = phi i1 [ false, %if.then25 ], [ true, %land.rhs28 ]
  br i1 %conv30, label %if.then31, label %if.else33

if.then31:                                        ; preds = %land.end29
  %39 = load i8 addrspace(1)*, i8 addrspace(1)** @_ZN7default6var781I10Aggregate8E
  %40 = bitcast i8 addrspace(1)* %39 to %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E$Some1" addrspace(1)*
  %41 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E$Some1" addrspace(1)* %40, i32 0, i32 1
  %42 = bitcast %record._ZN7default10Aggregate8E* %x32 to i8*
  %43 = bitcast %record._ZN7default10Aggregate8E addrspace(1)* %41 to i8 addrspace(1)*
  call void @llvm.memcpy.p0i8.p1i8.i64(i8* align 1 %42, i8 addrspace(1)* align 1 %43, i64 1, i1 false)
  %44 = bitcast %record._ZN7default10Aggregate8E* %if.value26 to i8*
  %45 = bitcast %record._ZN7default10Aggregate8E* %x32 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %44, i8* align 1 %45, i64 1, i1 false)
  br label %if.end34

if.else33:                                        ; preds = %land.end29
  %46 = bitcast %record._ZN7default10Aggregate8E* %if.value26 to i8*
  %47 = bitcast %record._ZN7default10Aggregate8E* @_ZN7default6var354E to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %46, i8* align 1 %47, i64 1, i1 false)
  br label %if.end34

if.end34:                                         ; preds = %if.else33, %if.then31
  br label %if.end36

if.else35:                                        ; preds = %land.end23
  %48 = bitcast %Unit.Type* %1 to i8*
  %49 = bitcast %Unit.Type* @Unit.Val to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %48, i8* align 1 %49, i64 1, i1 false)
  br i1 true, label %chirblock.end, label %unreachable

unreachable:                                      ; preds = %if.else35
  br label %if.end36

if.end36:                                         ; preds = %unreachable, %if.end34
  br label %chirblock.start19

chirblock.end:                                    ; preds = %if.else35
  ret void

unreachable37:                                    ; No predecessors!
  ret void
}

define weak_odr i8 addrspace(1)* @"_ZN050$Lambda__ZN7default7Class767func531Em10Aggregate8u.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN050$Lambda__ZN7default7Class767func531Em10Aggregate8u.objKlass")
  ret i8 addrspace(1)* %0
}

define i8 addrspace(1)* @_ZN7default7Class767func531Em10Aggregate8u(i8 addrspace(1)* %context, i64 %namedParam532, %record._ZN7default10Aggregate8E* %optionalParam533, %Unit.Type* %namedParam535) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %newVar-compiler = alloca %Unit.Type
  %if.value1 = alloca i8 addrspace(1)*
  %if.value = alloca i1
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %0 = load i8 addrspace(1)*, i8 addrspace(1)** @_ZN7default6var268E
  %1 = load i1, i1* @_ZN7default6var568E
  br i1 %1, label %if.then, label %if.else

if.then:                                          ; preds = %chirblock.body
  store i1 true, i1* %if.value
  br label %if.end

if.else:                                          ; preds = %chirblock.body
  %2 = load i1, i1* @_ZN7default6var568E
  store i1 %2, i1* %if.value
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i1, i1* %if.value
  %4 = bitcast i8 addrspace(1)* %0 to %ObjLayout.Object addrspace(1)*
  %5 = getelementptr inbounds %ObjLayout.Object, %ObjLayout.Object addrspace(1)* %4, i32 0, i32 0
  %6 = load %KlassInfo*, %KlassInfo* addrspace(1)* %5
  %7 = getelementptr inbounds %KlassInfo, %KlassInfo* %6, i32 0, i32 4
  %8 = load i8**, i8*** %7
  %9 = getelementptr i8*, i8** %8, i64 2
  %10 = load i8*, i8** %9
  %11 = bitcast i8* %10 to i8 addrspace(1)* (i8 addrspace(1)*, i1)*
  %12 = call i8 addrspace(1)* %11(i8 addrspace(1)* %0, i1 %3)
  %13 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE.init"(i64 1)
  br i1 false, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.end
  store %Unit.Type zeroinitializer, %Unit.Type* %newVar-compiler
  %14 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE$Some1.init"(i64 0, %Unit.Type* %newVar-compiler)
  store i8 addrspace(1)* %14, i8 addrspace(1)** %if.value1
  br label %if.end4

if.else3:                                         ; preds = %if.end
  %15 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE.init"(i64 1)
  store i8 addrspace(1)* %15, i8 addrspace(1)** %if.value1
  br label %if.end4

if.end4:                                          ; preds = %if.else3, %if.then2
  %16 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value1
  ret i8 addrspace(1)* %16

unreachable:                                      ; No predecessors!
  ret i8 addrspace(1)* null
}

define weak_odr i8 addrspace(1)* @"_ZN031$Lambda__ZN7default7func158Etmc.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN031$Lambda__ZN7default7func158Etmc.objKlass")
  ret i8 addrspace(1)* %0
}

define i1 @_ZN7default7func158Etmc(i8 addrspace(1)* %context, i16 %optionalParam159, i64 %namedParam161, i32 %optionalParam162) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %var234 = alloca %Unit.Type
  %if.value32 = alloca i16
  %x = alloca i1
  %if.value24 = alloca i1
  %if.value18 = alloca i1
  %if.value11 = alloca i1
  %if.value8 = alloca i1
  %caseVar177 = alloca i8 addrspace(1)*
  %if.value5 = alloca i1
  %caseVar172 = alloca i8 addrspace(1)*
  %if.value2 = alloca i1
  %var208 = alloca i8 addrspace(1)*
  %newVar-compiler = alloca i1
  %if.value = alloca i8 addrspace(1)*
  %var193 = alloca float
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  store float -3.600000e+01, float* %var193
  %0 = load i1, i1* @_ZN7default6var185E
  %1 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIbE$Some1.init"(i64 0, i1 %0)
  br i1 false, label %if.then, label %if.else

if.then:                                          ; preds = %chirblock.body
  store i1 false, i1* %newVar-compiler
  %2 = load i1, i1* %newVar-compiler
  %3 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIbE$Some1.init"(i64 0, i1 %2)
  store i8 addrspace(1)* %3, i8 addrspace(1)** %if.value
  br label %if.end

if.else:                                          ; preds = %chirblock.body
  %4 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIbE.init"(i64 1)
  store i8 addrspace(1)* %4, i8 addrspace(1)** %if.value
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %5 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value
  store i8 addrspace(1)* %5, i8 addrspace(1)** %var208
  %6 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE$Some1.init"(i64 0, %Unit.Type* @_ZN7default5var39E)
  br i1 true, label %if.then3, label %if.else4

if.then3:                                         ; preds = %if.end
  store i8 addrspace(1)* %6, i8 addrspace(1)** %caseVar172
  %7 = load i1, i1* @_ZN7default6var104E
  store i1 %7, i1* %if.value2
  br label %if.end17

if.else4:                                         ; preds = %if.end
  br i1 true, label %if.then6, label %if.else7

if.then6:                                         ; preds = %if.else4
  store i8 addrspace(1)* %6, i8 addrspace(1)** %caseVar177
  %8 = load i1, i1* @_ZN7default5var99E
  store i1 %8, i1* %if.value5
  br label %if.end16

if.else7:                                         ; preds = %if.else4
  br i1 true, label %if.then9, label %if.else10

if.then9:                                         ; preds = %if.else7
  %9 = load i1, i1* @_ZN7default6var185E
  store i1 %9, i1* %if.value8
  br label %if.end15

if.else10:                                        ; preds = %if.else7
  br i1 true, label %if.then12, label %if.else13

if.then12:                                        ; preds = %if.else10
  %10 = load float, float* %var193
  %11 = load i1, i1* @_ZN7default5var99E
  %12 = load i1, i1* @_ZN7default5var99E
  store i1 %12, i1* %if.value11
  br label %if.end14

if.else13:                                        ; preds = %if.else10
  store i1 false, i1* %if.value11
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %if.then12
  %13 = load i1, i1* %if.value11
  store i1 %13, i1* %if.value8
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.then9
  %14 = load i1, i1* %if.value8
  store i1 %14, i1* %if.value5
  br label %if.end16

if.end16:                                         ; preds = %if.end15, %if.then6
  %15 = load i1, i1* %if.value5
  store i1 %15, i1* %if.value2
  br label %if.end17

if.end17:                                         ; preds = %if.end16, %if.then3
  %16 = load i1, i1* %if.value2
  br i1 false, label %if.then19, label %if.else20

if.then19:                                        ; preds = %if.end17
  store i1 true, i1* %if.value18
  br label %if.end21

if.else20:                                        ; preds = %if.end17
  store i1 false, i1* %if.value18
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %if.then19
  %17 = load i1, i1* %if.value18
  br i1 %17, label %if.then22, label %if.else31

if.then22:                                        ; preds = %if.end21
  %18 = load i8 addrspace(1)*, i8 addrspace(1)** %var208
  %19 = bitcast i8 addrspace(1)* %18 to %"ObjLayout._ZN7default12core$FS$core6OptionIbE" addrspace(1)*
  %20 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIbE", %"ObjLayout._ZN7default12core$FS$core6OptionIbE" addrspace(1)* %19, i32 0, i32 1
  %21 = load i64, i64 addrspace(1)* %20
  %icmpeq = icmp eq i64 %21, 0
  br i1 %icmpeq, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.then22
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then22
  %conv = phi i1 [ false, %if.then22 ], [ true, %land.rhs ]
  br i1 %conv, label %if.then25, label %if.else26

if.then25:                                        ; preds = %land.end
  %22 = bitcast i8 addrspace(1)* %18 to %"ObjLayout._ZN7default12core$FS$core6OptionIbE$Some1" addrspace(1)*
  %23 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIbE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionIbE$Some1" addrspace(1)* %22, i32 0, i32 1
  %24 = load i1, i1 addrspace(1)* %23
  store i1 %24, i1* %x
  %25 = load i1, i1* %x
  store i1 %25, i1* %if.value24
  br label %if.end27

if.else26:                                        ; preds = %land.end
  store i1 false, i1* %if.value24
  br label %if.end27

if.end27:                                         ; preds = %if.else26, %if.then25
  %26 = load i1, i1* %if.value24
  br i1 %26, label %if.then28, label %if.else29

if.then28:                                        ; preds = %if.end27
  br label %if.end30

if.else29:                                        ; preds = %if.end27
  br label %if.end30

if.end30:                                         ; preds = %if.else29, %if.then28
  br label %if.end51

if.else31:                                        ; preds = %if.end21
  %27 = load i1, i1* @_ZN7default6var104E
  br i1 %27, label %if.then33, label %if.else34

if.then33:                                        ; preds = %if.else31
  store i16 111, i16* %if.value32
  br label %if.end35

if.else34:                                        ; preds = %if.else31
  store i16 89, i16* %if.value32
  br label %if.end35

if.end35:                                         ; preds = %if.else34, %if.then33
  %28 = load i16, i16* %if.value32
  %icmpeq37 = icmp eq i16 %28, -50
  br i1 %icmpeq37, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.end35
  %icmpeq38 = icmp eq i16 %28, -49
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.end35
  %conv39 = phi i1 [ true, %if.end35 ], [ %icmpeq38, %lor.rhs ]
  br i1 %conv39, label %lor.end42, label %lor.rhs40

lor.rhs40:                                        ; preds = %lor.end
  %29 = load i16, i16* @_ZN7default6var221E
  %icmpeq41 = icmp eq i16 %28, %29
  br label %lor.end42

lor.end42:                                        ; preds = %lor.rhs40, %lor.end
  %conv43 = phi i1 [ true, %lor.end ], [ %icmpeq41, %lor.rhs40 ]
  br i1 %conv43, label %lor.end46, label %lor.rhs44

lor.rhs44:                                        ; preds = %lor.end42
  %icmpeq45 = icmp eq i16 %28, -53
  br label %lor.end46

lor.end46:                                        ; preds = %lor.rhs44, %lor.end42
  %conv47 = phi i1 [ true, %lor.end42 ], [ %icmpeq45, %lor.rhs44 ]
  br i1 %conv47, label %if.then48, label %if.else49

if.then48:                                        ; preds = %lor.end46
  br label %if.end50

if.else49:                                        ; preds = %lor.end46
  %30 = load i32, i32* @_ZN7default6var229E
  br label %if.end50

if.end50:                                         ; preds = %if.else49, %if.then48
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.end30
  %31 = bitcast %Unit.Type* %var234 to i8*
  %32 = bitcast %Unit.Type* @Unit.Val to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %31, i8* align 1 %32, i64 1, i1 false)
  %33 = load i1, i1* @_ZN7default6var185E
  ret i1 %33

unreachable:                                      ; No predecessors!
  ret i1 false
}

define weak_odr i8 addrspace(1)* @"_ZN076$Lambda__ZN7default12core$FS$core6OptionITuple2_bjE10getOrThrowITuple2_bjEEv.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN076$Lambda__ZN7default12core$FS$core6OptionITuple2_bjE10getOrThrowITuple2_bjEEv.objKlass")
  ret i8 addrspace(1)* %0
}

define void @"_ZN7default12core$FS$core6OptionITuple2_bjE10getOrThrowITuple2_bjEEv"(%Tuple2_bjE* noalias sret, i8 addrspace(1)* %context, i8 addrspace(1)* %this) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %v = alloca %Tuple2_bjE
  %if.value = alloca %Tuple2_bjE
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %1 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE" addrspace(1)*
  %2 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE", %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE" addrspace(1)* %1, i32 0, i32 1
  %3 = load i64, i64 addrspace(1)* %2
  %icmpeq = icmp eq i64 %3, 0
  br i1 %icmpeq, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %chirblock.body
  br label %land.end

land.end:                                         ; preds = %land.rhs, %chirblock.body
  %conv = phi i1 [ false, %chirblock.body ], [ true, %land.rhs ]
  br i1 %conv, label %if.then, label %if.else

if.then:                                          ; preds = %land.end
  %4 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE$Some1" addrspace(1)*
  %5 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE$Some1" addrspace(1)* %4, i32 0, i32 1
  %6 = bitcast %Tuple2_bjE* %v to i8*
  %7 = bitcast %Tuple2_bjE addrspace(1)* %5 to i8 addrspace(1)*
  call void @llvm.memcpy.p0i8.p1i8.i64(i8* align 4 %6, i8 addrspace(1)* align 4 %7, i64 8, i1 false)
  %8 = bitcast %Tuple2_bjE* %if.value to i8*
  %9 = bitcast %Tuple2_bjE* %v to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 4 %9, i64 8, i1 false)
  br label %if.end

if.else:                                          ; preds = %land.end
  %10 = call i8 addrspace(1)* @"_ZN12core$FS$core18NoneValueException4initEv"()
  call void @MCC_ThrowException(i8 addrspace(1)* %10)
  ret void

unreachable:                                      ; No predecessors!
  br label %if.end

if.end:                                           ; preds = %unreachable, %if.then
  %11 = bitcast %Tuple2_bjE* %0 to i8*
  %12 = bitcast %Tuple2_bjE* %if.value to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 4 %12, i64 8, i1 false)
  ret void

unreachable1:                                     ; No predecessors!
  ret void
}

define weak_odr i8 addrspace(1)* @"_ZN0106$Lambda__ZN7default12core$FS$core6OptionITuple2_bjE10getOrThrowITuple2_bjEE_ZN025$LambdaCommon_09Exception.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN0106$Lambda__ZN7default12core$FS$core6OptionITuple2_bjE10getOrThrowITuple2_bjEE_ZN025$LambdaCommon_09Exception.objKlass")
  ret i8 addrspace(1)* %0
}

define void @"_ZN7default12core$FS$core6OptionITuple2_bjE10getOrThrowITuple2_bjEE_ZN025$LambdaCommon_09Exception"(%Tuple2_bjE* noalias sret, i8 addrspace(1)* %context, i8 addrspace(1)* %this, i8 addrspace(1)* %exception) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %v = alloca %Tuple2_bjE
  %if.value = alloca %Tuple2_bjE
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %1 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE" addrspace(1)*
  %2 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE", %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE" addrspace(1)* %1, i32 0, i32 1
  %3 = load i64, i64 addrspace(1)* %2
  %icmpeq = icmp eq i64 %3, 0
  br i1 %icmpeq, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %chirblock.body
  br label %land.end

land.end:                                         ; preds = %land.rhs, %chirblock.body
  %conv = phi i1 [ false, %chirblock.body ], [ true, %land.rhs ]
  br i1 %conv, label %if.then, label %if.else

if.then:                                          ; preds = %land.end
  %4 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE$Some1" addrspace(1)*
  %5 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE$Some1" addrspace(1)* %4, i32 0, i32 1
  %6 = bitcast %Tuple2_bjE* %v to i8*
  %7 = bitcast %Tuple2_bjE addrspace(1)* %5 to i8 addrspace(1)*
  call void @llvm.memcpy.p0i8.p1i8.i64(i8* align 4 %6, i8 addrspace(1)* align 4 %7, i64 8, i1 false)
  %8 = bitcast %Tuple2_bjE* %if.value to i8*
  %9 = bitcast %Tuple2_bjE* %v to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 4 %9, i64 8, i1 false)
  br label %if.end

if.else:                                          ; preds = %land.end
  %10 = bitcast i8 addrspace(1)* %exception to %ObjLayout.Object addrspace(1)*
  %11 = getelementptr inbounds %ObjLayout.Object, %ObjLayout.Object addrspace(1)* %10, i32 0, i32 0
  %12 = load %KlassInfo*, %KlassInfo* addrspace(1)* %11
  %13 = getelementptr inbounds %KlassInfo, %KlassInfo* %12, i32 0, i32 5
  %14 = load i64*, i64** %13
  %15 = call i8* @MCC_GetFuncPtrFromItab(i64* %14, i32 22, i32 7266, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0))
  %16 = bitcast i8* %15 to i8 addrspace(1)* (i8 addrspace(1)*)*
  %17 = call i8 addrspace(1)* %16(i8 addrspace(1)* %exception)
  call void @MCC_ThrowException(i8 addrspace(1)* %17)
  ret void

unreachable:                                      ; No predecessors!
  br label %if.end

if.end:                                           ; preds = %unreachable, %if.then
  %18 = bitcast %Tuple2_bjE* %0 to i8*
  %19 = bitcast %Tuple2_bjE* %if.value to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %18, i8* align 4 %19, i64 8, i1 false)
  ret void

unreachable1:                                     ; No predecessors!
  ret void
}

define weak_odr i8 addrspace(1)* @"_ZN058$Lambda__ZN7default12core$FS$core6OptionId10getOrThrowIdEv.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN058$Lambda__ZN7default12core$FS$core6OptionId10getOrThrowIdEv.objKlass")
  ret i8 addrspace(1)* %0
}

define double @"_ZN7default12core$FS$core6OptionId10getOrThrowIdEv"(i8 addrspace(1)* %context, i8 addrspace(1)* %this) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %v = alloca double
  %if.value = alloca double
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %0 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionIdE" addrspace(1)*
  %1 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIdE", %"ObjLayout._ZN7default12core$FS$core6OptionIdE" addrspace(1)* %0, i32 0, i32 1
  %2 = load i64, i64 addrspace(1)* %1
  %icmpeq = icmp eq i64 %2, 0
  br i1 %icmpeq, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %chirblock.body
  br label %land.end

land.end:                                         ; preds = %land.rhs, %chirblock.body
  %conv = phi i1 [ false, %chirblock.body ], [ true, %land.rhs ]
  br i1 %conv, label %if.then, label %if.else

if.then:                                          ; preds = %land.end
  %3 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionIdE$Some1" addrspace(1)*
  %4 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIdE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionIdE$Some1" addrspace(1)* %3, i32 0, i32 1
  %5 = load double, double addrspace(1)* %4
  store double %5, double* %v
  %6 = load double, double* %v
  store double %6, double* %if.value
  br label %if.end

if.else:                                          ; preds = %land.end
  %7 = call i8 addrspace(1)* @"_ZN12core$FS$core18NoneValueException4initEv"()
  call void @MCC_ThrowException(i8 addrspace(1)* %7)
  ret double 0.000000e+00

unreachable:                                      ; No predecessors!
  br label %if.end

if.end:                                           ; preds = %unreachable, %if.then
  %8 = load double, double* %if.value
  ret double %8

unreachable1:                                     ; No predecessors!
  ret double 0.000000e+00
}

define weak_odr i8 addrspace(1)* @"_ZN088$Lambda__ZN7default12core$FS$core6OptionId10getOrThrowIdE_ZN025$LambdaCommon_09Exception.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN088$Lambda__ZN7default12core$FS$core6OptionId10getOrThrowIdE_ZN025$LambdaCommon_09Exception.objKlass")
  ret i8 addrspace(1)* %0
}

define double @"_ZN7default12core$FS$core6OptionId10getOrThrowIdE_ZN025$LambdaCommon_09Exception"(i8 addrspace(1)* %context, i8 addrspace(1)* %this, i8 addrspace(1)* %exception) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %v = alloca double
  %if.value = alloca double
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %0 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionIdE" addrspace(1)*
  %1 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIdE", %"ObjLayout._ZN7default12core$FS$core6OptionIdE" addrspace(1)* %0, i32 0, i32 1
  %2 = load i64, i64 addrspace(1)* %1
  %icmpeq = icmp eq i64 %2, 0
  br i1 %icmpeq, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %chirblock.body
  br label %land.end

land.end:                                         ; preds = %land.rhs, %chirblock.body
  %conv = phi i1 [ false, %chirblock.body ], [ true, %land.rhs ]
  br i1 %conv, label %if.then, label %if.else

if.then:                                          ; preds = %land.end
  %3 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionIdE$Some1" addrspace(1)*
  %4 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIdE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionIdE$Some1" addrspace(1)* %3, i32 0, i32 1
  %5 = load double, double addrspace(1)* %4
  store double %5, double* %v
  %6 = load double, double* %v
  store double %6, double* %if.value
  br label %if.end

if.else:                                          ; preds = %land.end
  %7 = bitcast i8 addrspace(1)* %exception to %ObjLayout.Object addrspace(1)*
  %8 = getelementptr inbounds %ObjLayout.Object, %ObjLayout.Object addrspace(1)* %7, i32 0, i32 0
  %9 = load %KlassInfo*, %KlassInfo* addrspace(1)* %8
  %10 = getelementptr inbounds %KlassInfo, %KlassInfo* %9, i32 0, i32 5
  %11 = load i64*, i64** %10
  %12 = call i8* @MCC_GetFuncPtrFromItab(i64* %11, i32 22, i32 7266, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0))
  %13 = bitcast i8* %12 to i8 addrspace(1)* (i8 addrspace(1)*)*
  %14 = call i8 addrspace(1)* %13(i8 addrspace(1)* %exception)
  call void @MCC_ThrowException(i8 addrspace(1)* %14)
  ret double 0.000000e+00

unreachable:                                      ; No predecessors!
  br label %if.end

if.end:                                           ; preds = %unreachable, %if.then
  %15 = load double, double* %if.value
  ret double %15

unreachable1:                                     ; No predecessors!
  ret double 0.000000e+00
}

define weak_odr i8 addrspace(1)* @"_ZN072$Lambda__ZN7default12core$FS$core6OptionI7Class7610getOrThrowI7Class76Ev.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN072$Lambda__ZN7default12core$FS$core6OptionI7Class7610getOrThrowI7Class76Ev.objKlass")
  ret i8 addrspace(1)* %0
}

define i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI7Class7610getOrThrowI7Class76Ev"(i8 addrspace(1)* %context, i8 addrspace(1)* %this) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %v = alloca i8 addrspace(1)*
  %if.value = alloca i8 addrspace(1)*
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %0 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E" addrspace(1)*
  %1 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E", %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E" addrspace(1)* %0, i32 0, i32 1
  %2 = load i64, i64 addrspace(1)* %1
  %icmpeq = icmp eq i64 %2, 0
  br i1 %icmpeq, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %chirblock.body
  br label %land.end

land.end:                                         ; preds = %land.rhs, %chirblock.body
  %conv = phi i1 [ false, %chirblock.body ], [ true, %land.rhs ]
  br i1 %conv, label %if.then, label %if.else

if.then:                                          ; preds = %land.end
  %3 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E$Some1" addrspace(1)*
  %4 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E$Some1" addrspace(1)* %3, i32 0, i32 1
  %5 = load i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)* %4
  store i8 addrspace(1)* %5, i8 addrspace(1)** %v
  %6 = load i8 addrspace(1)*, i8 addrspace(1)** %v
  store i8 addrspace(1)* %6, i8 addrspace(1)** %if.value
  br label %if.end

if.else:                                          ; preds = %land.end
  %7 = call i8 addrspace(1)* @"_ZN12core$FS$core18NoneValueException4initEv"()
  call void @MCC_ThrowException(i8 addrspace(1)* %7)
  ret i8 addrspace(1)* null

unreachable:                                      ; No predecessors!
  br label %if.end

if.end:                                           ; preds = %unreachable, %if.then
  %8 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value
  ret i8 addrspace(1)* %8

unreachable1:                                     ; No predecessors!
  ret i8 addrspace(1)* null
}

define weak_odr i8 addrspace(1)* @"_ZN0102$Lambda__ZN7default12core$FS$core6OptionI7Class7610getOrThrowI7Class76E_ZN025$LambdaCommon_09Exception.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN0102$Lambda__ZN7default12core$FS$core6OptionI7Class7610getOrThrowI7Class76E_ZN025$LambdaCommon_09Exception.objKlass")
  ret i8 addrspace(1)* %0
}

define i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI7Class7610getOrThrowI7Class76E_ZN025$LambdaCommon_09Exception"(i8 addrspace(1)* %context, i8 addrspace(1)* %this, i8 addrspace(1)* %exception) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %v = alloca i8 addrspace(1)*
  %if.value = alloca i8 addrspace(1)*
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %0 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E" addrspace(1)*
  %1 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E", %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E" addrspace(1)* %0, i32 0, i32 1
  %2 = load i64, i64 addrspace(1)* %1
  %icmpeq = icmp eq i64 %2, 0
  br i1 %icmpeq, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %chirblock.body
  br label %land.end

land.end:                                         ; preds = %land.rhs, %chirblock.body
  %conv = phi i1 [ false, %chirblock.body ], [ true, %land.rhs ]
  br i1 %conv, label %if.then, label %if.else

if.then:                                          ; preds = %land.end
  %3 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E$Some1" addrspace(1)*
  %4 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E$Some1" addrspace(1)* %3, i32 0, i32 1
  %5 = load i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)* %4
  store i8 addrspace(1)* %5, i8 addrspace(1)** %v
  %6 = load i8 addrspace(1)*, i8 addrspace(1)** %v
  store i8 addrspace(1)* %6, i8 addrspace(1)** %if.value
  br label %if.end

if.else:                                          ; preds = %land.end
  %7 = bitcast i8 addrspace(1)* %exception to %ObjLayout.Object addrspace(1)*
  %8 = getelementptr inbounds %ObjLayout.Object, %ObjLayout.Object addrspace(1)* %7, i32 0, i32 0
  %9 = load %KlassInfo*, %KlassInfo* addrspace(1)* %8
  %10 = getelementptr inbounds %KlassInfo, %KlassInfo* %9, i32 0, i32 5
  %11 = load i64*, i64** %10
  %12 = call i8* @MCC_GetFuncPtrFromItab(i64* %11, i32 22, i32 7266, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i32 0, i32 0))
  %13 = bitcast i8* %12 to i8 addrspace(1)* (i8 addrspace(1)*)*
  %14 = call i8 addrspace(1)* %13(i8 addrspace(1)* %exception)
  call void @MCC_ThrowException(i8 addrspace(1)* %14)
  ret i8 addrspace(1)* null

unreachable:                                      ; No predecessors!
  br label %if.end

if.end:                                           ; preds = %unreachable, %if.then
  %15 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value
  ret i8 addrspace(1)* %15

unreachable1:                                     ; No predecessors!
  ret i8 addrspace(1)* null
}

define weak_odr i8 addrspace(1)* @"_ZN058$Lambda__ZN7default12core$FS$core6OptionIf10getOrThrowIfEv.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN058$Lambda__ZN7default12core$FS$core6OptionIf10getOrThrowIfEv.objKlass")
  ret i8 addrspace(1)* %0
}

define float @"_ZN7default12core$FS$core6OptionIf10getOrThrowIfEv"(i8 addrspace(1)* %context, i8 addrspace(1)* %this) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %v = alloca float
  %if.value = alloca float
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %0 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionIfE" addrspace(1)*
  %1 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIfE", %"ObjLayout._ZN7default12core$FS$core6OptionIfE" addrspace(1)* %0, i32 0, i32 1
  %2 = load i64, i64 addrspace(1)* %1
  %icmpeq = icmp eq i64 %2, 0
  br i1 %icmpeq, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %chirblock.body
  br label %land.end

land.end:                                         ; preds = %land.rhs, %chirblock.body
  %conv = phi i1 [ false, %chirblock.body ], [ true, %land.rhs ]
  br i1 %conv, label %if.then, label %if.else

if.then:                                          ; preds = %land.end
  %3 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionIfE$Some1" addrspace(1)*
  %4 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIfE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionIfE$Some1" addrspace(1)* %3, i32 0, i32 1
  %5 = load float, float addrspace(1)* %4
  store float %5, float* %v
  %6 = load float, float* %v
  store float %6, float* %if.value
  br label %if.end

if.else:                                          ; preds = %land.end
  %7 = call i8 addrspace(1)* @"_ZN12core$FS$core18NoneValueException4initEv"()
  call void @MCC_ThrowException(i8 addrspace(1)* %7)
  ret float 0.000000e+00

unreachable:                                      ; No predecessors!
  br label %if.end

if.end:                                           ; preds = %unreachable, %if.then
  %8 = load float, float* %if.value
  ret float %8

unreachable1:                                     ; No predecessors!
  ret float 0.000000e+00
}

define weak_odr i8 addrspace(1)* @"_ZN088$Lambda__ZN7default12core$FS$core6OptionIf10getOrThrowIfE_ZN025$LambdaCommon_09Exception.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN088$Lambda__ZN7default12core$FS$core6OptionIf10getOrThrowIfE_ZN025$LambdaCommon_09Exception.objKlass")
  ret i8 addrspace(1)* %0
}

define float @"_ZN7default12core$FS$core6OptionIf10getOrThrowIfE_ZN025$LambdaCommon_09Exception"(i8 addrspace(1)* %context, i8 addrspace(1)* %this, i8 addrspace(1)* %exception) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %v = alloca float
  %if.value = alloca float
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %0 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionIfE" addrspace(1)*
  %1 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIfE", %"ObjLayout._ZN7default12core$FS$core6OptionIfE" addrspace(1)* %0, i32 0, i32 1
  %2 = load i64, i64 addrspace(1)* %1
  %icmpeq = icmp eq i64 %2, 0
  br i1 %icmpeq, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %chirblock.body
  br label %land.end

land.end:                                         ; preds = %land.rhs, %chirblock.body
  %conv = phi i1 [ false, %chirblock.body ], [ true, %land.rhs ]
  br i1 %conv, label %if.then, label %if.else

if.then:                                          ; preds = %land.end
  %3 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionIfE$Some1" addrspace(1)*
  %4 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIfE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionIfE$Some1" addrspace(1)* %3, i32 0, i32 1
  %5 = load float, float addrspace(1)* %4
  store float %5, float* %v
  %6 = load float, float* %v
  store float %6, float* %if.value
  br label %if.end

if.else:                                          ; preds = %land.end
  %7 = bitcast i8 addrspace(1)* %exception to %ObjLayout.Object addrspace(1)*
  %8 = getelementptr inbounds %ObjLayout.Object, %ObjLayout.Object addrspace(1)* %7, i32 0, i32 0
  %9 = load %KlassInfo*, %KlassInfo* addrspace(1)* %8
  %10 = getelementptr inbounds %KlassInfo, %KlassInfo* %9, i32 0, i32 5
  %11 = load i64*, i64** %10
  %12 = call i8* @MCC_GetFuncPtrFromItab(i64* %11, i32 22, i32 7266, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0))
  %13 = bitcast i8* %12 to i8 addrspace(1)* (i8 addrspace(1)*)*
  %14 = call i8 addrspace(1)* %13(i8 addrspace(1)* %exception)
  call void @MCC_ThrowException(i8 addrspace(1)* %14)
  ret float 0.000000e+00

unreachable:                                      ; No predecessors!
  br label %if.end

if.end:                                           ; preds = %unreachable, %if.then
  %15 = load float, float* %if.value
  ret float %15

unreachable1:                                     ; No predecessors!
  ret float 0.000000e+00
}

define weak_odr i8 addrspace(1)* @"_ZN072$Lambda__ZN7default12core$FS$core6OptionI6Optionu10getOrThrowI6OptionuEv.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN072$Lambda__ZN7default12core$FS$core6OptionI6Optionu10getOrThrowI6OptionuEv.objKlass")
  ret i8 addrspace(1)* %0
}

define i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI6Optionu10getOrThrowI6OptionuEv"(i8 addrspace(1)* %context, i8 addrspace(1)* %this) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %v = alloca i8 addrspace(1)*
  %if.value = alloca i8 addrspace(1)*
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %0 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE" addrspace(1)*
  %1 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE", %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE" addrspace(1)* %0, i32 0, i32 1
  %2 = load i64, i64 addrspace(1)* %1
  %icmpeq = icmp eq i64 %2, 0
  br i1 %icmpeq, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %chirblock.body
  br label %land.end

land.end:                                         ; preds = %land.rhs, %chirblock.body
  %conv = phi i1 [ false, %chirblock.body ], [ true, %land.rhs ]
  br i1 %conv, label %if.then, label %if.else

if.then:                                          ; preds = %land.end
  %3 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE$Some1" addrspace(1)*
  %4 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE$Some1" addrspace(1)* %3, i32 0, i32 1
  %5 = load i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)* %4
  store i8 addrspace(1)* %5, i8 addrspace(1)** %v
  %6 = load i8 addrspace(1)*, i8 addrspace(1)** %v
  store i8 addrspace(1)* %6, i8 addrspace(1)** %if.value
  br label %if.end

if.else:                                          ; preds = %land.end
  %7 = call i8 addrspace(1)* @"_ZN12core$FS$core18NoneValueException4initEv"()
  call void @MCC_ThrowException(i8 addrspace(1)* %7)
  ret i8 addrspace(1)* null

unreachable:                                      ; No predecessors!
  br label %if.end

if.end:                                           ; preds = %unreachable, %if.then
  %8 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value
  ret i8 addrspace(1)* %8

unreachable1:                                     ; No predecessors!
  ret i8 addrspace(1)* null
}

define weak_odr i8 addrspace(1)* @"_ZN0102$Lambda__ZN7default12core$FS$core6OptionI6Optionu10getOrThrowI6OptionuE_ZN025$LambdaCommon_09Exception.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN0102$Lambda__ZN7default12core$FS$core6OptionI6Optionu10getOrThrowI6OptionuE_ZN025$LambdaCommon_09Exception.objKlass")
  ret i8 addrspace(1)* %0
}

define i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI6Optionu10getOrThrowI6OptionuE_ZN025$LambdaCommon_09Exception"(i8 addrspace(1)* %context, i8 addrspace(1)* %this, i8 addrspace(1)* %exception) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %v = alloca i8 addrspace(1)*
  %if.value = alloca i8 addrspace(1)*
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %0 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE" addrspace(1)*
  %1 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE", %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE" addrspace(1)* %0, i32 0, i32 1
  %2 = load i64, i64 addrspace(1)* %1
  %icmpeq = icmp eq i64 %2, 0
  br i1 %icmpeq, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %chirblock.body
  br label %land.end

land.end:                                         ; preds = %land.rhs, %chirblock.body
  %conv = phi i1 [ false, %chirblock.body ], [ true, %land.rhs ]
  br i1 %conv, label %if.then, label %if.else

if.then:                                          ; preds = %land.end
  %3 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE$Some1" addrspace(1)*
  %4 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE$Some1" addrspace(1)* %3, i32 0, i32 1
  %5 = load i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)* %4
  store i8 addrspace(1)* %5, i8 addrspace(1)** %v
  %6 = load i8 addrspace(1)*, i8 addrspace(1)** %v
  store i8 addrspace(1)* %6, i8 addrspace(1)** %if.value
  br label %if.end

if.else:                                          ; preds = %land.end
  %7 = bitcast i8 addrspace(1)* %exception to %ObjLayout.Object addrspace(1)*
  %8 = getelementptr inbounds %ObjLayout.Object, %ObjLayout.Object addrspace(1)* %7, i32 0, i32 0
  %9 = load %KlassInfo*, %KlassInfo* addrspace(1)* %8
  %10 = getelementptr inbounds %KlassInfo, %KlassInfo* %9, i32 0, i32 5
  %11 = load i64*, i64** %10
  %12 = call i8* @MCC_GetFuncPtrFromItab(i64* %11, i32 22, i32 7266, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i32 0, i32 0))
  %13 = bitcast i8* %12 to i8 addrspace(1)* (i8 addrspace(1)*)*
  %14 = call i8 addrspace(1)* %13(i8 addrspace(1)* %exception)
  call void @MCC_ThrowException(i8 addrspace(1)* %14)
  ret i8 addrspace(1)* null

unreachable:                                      ; No predecessors!
  br label %if.end

if.end:                                           ; preds = %unreachable, %if.then
  %15 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value
  ret i8 addrspace(1)* %15

unreachable1:                                     ; No predecessors!
  ret i8 addrspace(1)* null
}

define weak_odr i8 addrspace(1)* @"_ZN080$Lambda__ZN7default12core$FS$core6OptionI10Aggregate810getOrThrowI10Aggregate8Ev.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN080$Lambda__ZN7default12core$FS$core6OptionI10Aggregate810getOrThrowI10Aggregate8Ev.objKlass")
  ret i8 addrspace(1)* %0
}

define void @"_ZN7default12core$FS$core6OptionI10Aggregate810getOrThrowI10Aggregate8Ev"(%record._ZN7default10Aggregate8E* noalias sret, i8 addrspace(1)* %context, i8 addrspace(1)* %this) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %v = alloca %record._ZN7default10Aggregate8E
  %if.value = alloca %record._ZN7default10Aggregate8E
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %1 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E" addrspace(1)*
  %2 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E", %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E" addrspace(1)* %1, i32 0, i32 1
  %3 = load i64, i64 addrspace(1)* %2
  %icmpeq = icmp eq i64 %3, 0
  br i1 %icmpeq, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %chirblock.body
  br label %land.end

land.end:                                         ; preds = %land.rhs, %chirblock.body
  %conv = phi i1 [ false, %chirblock.body ], [ true, %land.rhs ]
  br i1 %conv, label %if.then, label %if.else

if.then:                                          ; preds = %land.end
  %4 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E$Some1" addrspace(1)*
  %5 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E$Some1" addrspace(1)* %4, i32 0, i32 1
  %6 = bitcast %record._ZN7default10Aggregate8E* %v to i8*
  %7 = bitcast %record._ZN7default10Aggregate8E addrspace(1)* %5 to i8 addrspace(1)*
  call void @llvm.memcpy.p0i8.p1i8.i64(i8* align 1 %6, i8 addrspace(1)* align 1 %7, i64 1, i1 false)
  %8 = bitcast %record._ZN7default10Aggregate8E* %if.value to i8*
  %9 = bitcast %record._ZN7default10Aggregate8E* %v to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %8, i8* align 1 %9, i64 1, i1 false)
  br label %if.end

if.else:                                          ; preds = %land.end
  %10 = call i8 addrspace(1)* @"_ZN12core$FS$core18NoneValueException4initEv"()
  call void @MCC_ThrowException(i8 addrspace(1)* %10)
  ret void

unreachable:                                      ; No predecessors!
  br label %if.end

if.end:                                           ; preds = %unreachable, %if.then
  %11 = bitcast %record._ZN7default10Aggregate8E* %0 to i8*
  %12 = bitcast %record._ZN7default10Aggregate8E* %if.value to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %12, i64 1, i1 false)
  ret void

unreachable1:                                     ; No predecessors!
  ret void
}

define weak_odr i8 addrspace(1)* @"_ZN0110$Lambda__ZN7default12core$FS$core6OptionI10Aggregate810getOrThrowI10Aggregate8E_ZN025$LambdaCommon_09Exception.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN0110$Lambda__ZN7default12core$FS$core6OptionI10Aggregate810getOrThrowI10Aggregate8E_ZN025$LambdaCommon_09Exception.objKlass")
  ret i8 addrspace(1)* %0
}

define void @"_ZN7default12core$FS$core6OptionI10Aggregate810getOrThrowI10Aggregate8E_ZN025$LambdaCommon_09Exception"(%record._ZN7default10Aggregate8E* noalias sret, i8 addrspace(1)* %context, i8 addrspace(1)* %this, i8 addrspace(1)* %exception) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %v = alloca %record._ZN7default10Aggregate8E
  %if.value = alloca %record._ZN7default10Aggregate8E
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %1 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E" addrspace(1)*
  %2 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E", %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E" addrspace(1)* %1, i32 0, i32 1
  %3 = load i64, i64 addrspace(1)* %2
  %icmpeq = icmp eq i64 %3, 0
  br i1 %icmpeq, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %chirblock.body
  br label %land.end

land.end:                                         ; preds = %land.rhs, %chirblock.body
  %conv = phi i1 [ false, %chirblock.body ], [ true, %land.rhs ]
  br i1 %conv, label %if.then, label %if.else

if.then:                                          ; preds = %land.end
  %4 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E$Some1" addrspace(1)*
  %5 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E$Some1" addrspace(1)* %4, i32 0, i32 1
  %6 = bitcast %record._ZN7default10Aggregate8E* %v to i8*
  %7 = bitcast %record._ZN7default10Aggregate8E addrspace(1)* %5 to i8 addrspace(1)*
  call void @llvm.memcpy.p0i8.p1i8.i64(i8* align 1 %6, i8 addrspace(1)* align 1 %7, i64 1, i1 false)
  %8 = bitcast %record._ZN7default10Aggregate8E* %if.value to i8*
  %9 = bitcast %record._ZN7default10Aggregate8E* %v to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %8, i8* align 1 %9, i64 1, i1 false)
  br label %if.end

if.else:                                          ; preds = %land.end
  %10 = bitcast i8 addrspace(1)* %exception to %ObjLayout.Object addrspace(1)*
  %11 = getelementptr inbounds %ObjLayout.Object, %ObjLayout.Object addrspace(1)* %10, i32 0, i32 0
  %12 = load %KlassInfo*, %KlassInfo* addrspace(1)* %11
  %13 = getelementptr inbounds %KlassInfo, %KlassInfo* %12, i32 0, i32 5
  %14 = load i64*, i64** %13
  %15 = call i8* @MCC_GetFuncPtrFromItab(i64* %14, i32 22, i32 7266, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0))
  %16 = bitcast i8* %15 to i8 addrspace(1)* (i8 addrspace(1)*)*
  %17 = call i8 addrspace(1)* %16(i8 addrspace(1)* %exception)
  call void @MCC_ThrowException(i8 addrspace(1)* %17)
  ret void

unreachable:                                      ; No predecessors!
  br label %if.end

if.end:                                           ; preds = %unreachable, %if.then
  %18 = bitcast %record._ZN7default10Aggregate8E* %0 to i8*
  %19 = bitcast %record._ZN7default10Aggregate8E* %if.value to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %18, i8* align 1 %19, i64 1, i1 false)
  ret void

unreachable1:                                     ; No predecessors!
  ret void
}

define weak_odr i8 addrspace(1)* @"_ZN058$Lambda__ZN7default12core$FS$core6OptionIb10getOrThrowIbEv.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN058$Lambda__ZN7default12core$FS$core6OptionIb10getOrThrowIbEv.objKlass")
  ret i8 addrspace(1)* %0
}

define i1 @"_ZN7default12core$FS$core6OptionIb10getOrThrowIbEv"(i8 addrspace(1)* %context, i8 addrspace(1)* %this) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %v = alloca i1
  %if.value = alloca i1
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %0 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionIbE" addrspace(1)*
  %1 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIbE", %"ObjLayout._ZN7default12core$FS$core6OptionIbE" addrspace(1)* %0, i32 0, i32 1
  %2 = load i64, i64 addrspace(1)* %1
  %icmpeq = icmp eq i64 %2, 0
  br i1 %icmpeq, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %chirblock.body
  br label %land.end

land.end:                                         ; preds = %land.rhs, %chirblock.body
  %conv = phi i1 [ false, %chirblock.body ], [ true, %land.rhs ]
  br i1 %conv, label %if.then, label %if.else

if.then:                                          ; preds = %land.end
  %3 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionIbE$Some1" addrspace(1)*
  %4 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIbE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionIbE$Some1" addrspace(1)* %3, i32 0, i32 1
  %5 = load i1, i1 addrspace(1)* %4
  store i1 %5, i1* %v
  %6 = load i1, i1* %v
  store i1 %6, i1* %if.value
  br label %if.end

if.else:                                          ; preds = %land.end
  %7 = call i8 addrspace(1)* @"_ZN12core$FS$core18NoneValueException4initEv"()
  call void @MCC_ThrowException(i8 addrspace(1)* %7)
  ret i1 false

unreachable:                                      ; No predecessors!
  br label %if.end

if.end:                                           ; preds = %unreachable, %if.then
  %8 = load i1, i1* %if.value
  ret i1 %8

unreachable1:                                     ; No predecessors!
  ret i1 false
}

define weak_odr i8 addrspace(1)* @"_ZN088$Lambda__ZN7default12core$FS$core6OptionIb10getOrThrowIbE_ZN025$LambdaCommon_09Exception.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN088$Lambda__ZN7default12core$FS$core6OptionIb10getOrThrowIbE_ZN025$LambdaCommon_09Exception.objKlass")
  ret i8 addrspace(1)* %0
}

define i1 @"_ZN7default12core$FS$core6OptionIb10getOrThrowIbE_ZN025$LambdaCommon_09Exception"(i8 addrspace(1)* %context, i8 addrspace(1)* %this, i8 addrspace(1)* %exception) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %v = alloca i1
  %if.value = alloca i1
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %0 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionIbE" addrspace(1)*
  %1 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIbE", %"ObjLayout._ZN7default12core$FS$core6OptionIbE" addrspace(1)* %0, i32 0, i32 1
  %2 = load i64, i64 addrspace(1)* %1
  %icmpeq = icmp eq i64 %2, 0
  br i1 %icmpeq, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %chirblock.body
  br label %land.end

land.end:                                         ; preds = %land.rhs, %chirblock.body
  %conv = phi i1 [ false, %chirblock.body ], [ true, %land.rhs ]
  br i1 %conv, label %if.then, label %if.else

if.then:                                          ; preds = %land.end
  %3 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionIbE$Some1" addrspace(1)*
  %4 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIbE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionIbE$Some1" addrspace(1)* %3, i32 0, i32 1
  %5 = load i1, i1 addrspace(1)* %4
  store i1 %5, i1* %v
  %6 = load i1, i1* %v
  store i1 %6, i1* %if.value
  br label %if.end

if.else:                                          ; preds = %land.end
  %7 = bitcast i8 addrspace(1)* %exception to %ObjLayout.Object addrspace(1)*
  %8 = getelementptr inbounds %ObjLayout.Object, %ObjLayout.Object addrspace(1)* %7, i32 0, i32 0
  %9 = load %KlassInfo*, %KlassInfo* addrspace(1)* %8
  %10 = getelementptr inbounds %KlassInfo, %KlassInfo* %9, i32 0, i32 5
  %11 = load i64*, i64** %10
  %12 = call i8* @MCC_GetFuncPtrFromItab(i64* %11, i32 22, i32 7266, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0))
  %13 = bitcast i8* %12 to i8 addrspace(1)* (i8 addrspace(1)*)*
  %14 = call i8 addrspace(1)* %13(i8 addrspace(1)* %exception)
  call void @MCC_ThrowException(i8 addrspace(1)* %14)
  ret i1 false

unreachable:                                      ; No predecessors!
  br label %if.end

if.end:                                           ; preds = %unreachable, %if.then
  %15 = load i1, i1* %if.value
  ret i1 %15

unreachable1:                                     ; No predecessors!
  ret i1 false
}

define weak_odr i8 addrspace(1)* @"_ZN058$Lambda__ZN7default12core$FS$core6OptionIu10getOrThrowIuEv.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN058$Lambda__ZN7default12core$FS$core6OptionIu10getOrThrowIuEv.objKlass")
  ret i8 addrspace(1)* %0
}

define void @"_ZN7default12core$FS$core6OptionIu10getOrThrowIuEv"(%Unit.Type* noalias sret, i8 addrspace(1)* %context, i8 addrspace(1)* %this) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %1 = alloca %Unit.Type
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %2 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionIuE" addrspace(1)*
  %3 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIuE", %"ObjLayout._ZN7default12core$FS$core6OptionIuE" addrspace(1)* %2, i32 0, i32 1
  %4 = load i64, i64 addrspace(1)* %3
  %icmpeq = icmp eq i64 %4, 0
  br i1 %icmpeq, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %chirblock.body
  br label %land.end

land.end:                                         ; preds = %land.rhs, %chirblock.body
  %conv = phi i1 [ false, %chirblock.body ], [ true, %land.rhs ]
  br i1 %conv, label %if.then, label %if.else

if.then:                                          ; preds = %land.end
  %5 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionIuE$Some1" addrspace(1)*
  %6 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIuE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionIuE$Some1" addrspace(1)* %5, i32 0, i32 1
  %7 = bitcast %Unit.Type* %1 to i8*
  %8 = bitcast %Unit.Type addrspace(1)* %6 to i8 addrspace(1)*
  call void @llvm.memcpy.p0i8.p1i8.i64(i8* align 1 %7, i8 addrspace(1)* align 1 %8, i64 1, i1 false)
  br label %if.end

if.else:                                          ; preds = %land.end
  %9 = call i8 addrspace(1)* @"_ZN12core$FS$core18NoneValueException4initEv"()
  call void @MCC_ThrowException(i8 addrspace(1)* %9)
  ret void

unreachable:                                      ; No predecessors!
  br label %if.end

if.end:                                           ; preds = %unreachable, %if.then
  ret void

unreachable1:                                     ; No predecessors!
  ret void
}

define weak_odr i8 addrspace(1)* @"_ZN088$Lambda__ZN7default12core$FS$core6OptionIu10getOrThrowIuE_ZN025$LambdaCommon_09Exception.init"(i8 addrspace(1)* %env) gc "cangjie" {
entry:
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @"_ZN088$Lambda__ZN7default12core$FS$core6OptionIu10getOrThrowIuE_ZN025$LambdaCommon_09Exception.objKlass")
  ret i8 addrspace(1)* %0
}

define void @"_ZN7default12core$FS$core6OptionIu10getOrThrowIuE_ZN025$LambdaCommon_09Exception"(%Unit.Type* noalias sret, i8 addrspace(1)* %context, i8 addrspace(1)* %this, i8 addrspace(1)* %exception) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %1 = alloca %Unit.Type
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %2 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionIuE" addrspace(1)*
  %3 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIuE", %"ObjLayout._ZN7default12core$FS$core6OptionIuE" addrspace(1)* %2, i32 0, i32 1
  %4 = load i64, i64 addrspace(1)* %3
  %icmpeq = icmp eq i64 %4, 0
  br i1 %icmpeq, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %chirblock.body
  br label %land.end

land.end:                                         ; preds = %land.rhs, %chirblock.body
  %conv = phi i1 [ false, %chirblock.body ], [ true, %land.rhs ]
  br i1 %conv, label %if.then, label %if.else

if.then:                                          ; preds = %land.end
  %5 = bitcast i8 addrspace(1)* %this to %"ObjLayout._ZN7default12core$FS$core6OptionIuE$Some1" addrspace(1)*
  %6 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIuE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionIuE$Some1" addrspace(1)* %5, i32 0, i32 1
  %7 = bitcast %Unit.Type* %1 to i8*
  %8 = bitcast %Unit.Type addrspace(1)* %6 to i8 addrspace(1)*
  call void @llvm.memcpy.p0i8.p1i8.i64(i8* align 1 %7, i8 addrspace(1)* align 1 %8, i64 1, i1 false)
  br label %if.end

if.else:                                          ; preds = %land.end
  %9 = bitcast i8 addrspace(1)* %exception to %ObjLayout.Object addrspace(1)*
  %10 = getelementptr inbounds %ObjLayout.Object, %ObjLayout.Object addrspace(1)* %9, i32 0, i32 0
  %11 = load %KlassInfo*, %KlassInfo* addrspace(1)* %10
  %12 = getelementptr inbounds %KlassInfo, %KlassInfo* %11, i32 0, i32 5
  %13 = load i64*, i64** %12
  %14 = call i8* @MCC_GetFuncPtrFromItab(i64* %13, i32 22, i32 7266, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.7, i32 0, i32 0))
  %15 = bitcast i8* %14 to i8 addrspace(1)* (i8 addrspace(1)*)*
  %16 = call i8 addrspace(1)* %15(i8 addrspace(1)* %exception)
  call void @MCC_ThrowException(i8 addrspace(1)* %16)
  ret void

unreachable:                                      ; No predecessors!
  br label %if.end

if.end:                                           ; preds = %unreachable, %if.then
  ret void

unreachable1:                                     ; No predecessors!
  ret void
}

define i64 @user.main() gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %ret = alloca i64
  %a31 = alloca i8
  %if.value29 = alloca i64
  %a27 = alloca i16
  %if.value25 = alloca i64
  %a23 = alloca i32
  %if.value21 = alloca i64
  %a19 = alloca i64
  %if.value17 = alloca i64
  %a15 = alloca i8
  %if.value13 = alloca i64
  %a11 = alloca i16
  %if.value9 = alloca i64
  %a7 = alloca i32
  %if.value5 = alloca i64
  %a = alloca i64
  %if.value2 = alloca i64
  %retVal1 = alloca %Unit.Type
  %if.value = alloca i64
  %retVal = alloca i64
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %0 = call i64 @_ZN7default4mainEv(i8 addrspace(1)* null)
  store i64 %0, i64* %retVal
  br i1 false, label %if.then, label %if.else

if.then:                                          ; preds = %chirblock.body
  store %Unit.Type zeroinitializer, %Unit.Type* %retVal1
  store i64 0, i64* %if.value
  br label %if.end40

if.else:                                          ; preds = %chirblock.body
  br i1 true, label %if.then3, label %if.else4

if.then3:                                         ; preds = %if.else
  %1 = load i64, i64* %retVal
  store i64 %1, i64* %a
  %2 = load i64, i64* %a
  store i64 %2, i64* %if.value2
  br label %if.end39

if.else4:                                         ; preds = %if.else
  br i1 false, label %if.then6, label %if.else8

if.then6:                                         ; preds = %if.else4
  store i32 0, i32* %a7
  %3 = load i32, i32* %a7
  %4 = sext i32 %3 to i64
  store i64 %4, i64* %if.value5
  br label %if.end38

if.else8:                                         ; preds = %if.else4
  br i1 false, label %if.then10, label %if.else12

if.then10:                                        ; preds = %if.else8
  store i16 0, i16* %a11
  %5 = load i16, i16* %a11
  %6 = sext i16 %5 to i64
  store i64 %6, i64* %if.value9
  br label %if.end37

if.else12:                                        ; preds = %if.else8
  br i1 false, label %if.then14, label %if.else16

if.then14:                                        ; preds = %if.else12
  store i8 0, i8* %a15
  %7 = load i8, i8* %a15
  %8 = sext i8 %7 to i64
  store i64 %8, i64* %if.value13
  br label %if.end36

if.else16:                                        ; preds = %if.else12
  br i1 false, label %if.then18, label %if.else20

if.then18:                                        ; preds = %if.else16
  %9 = load i64, i64* %retVal
  store i64 %9, i64* %a19
  %10 = load i64, i64* %a19
  store i64 %10, i64* %if.value17
  br label %if.end35

if.else20:                                        ; preds = %if.else16
  br i1 false, label %if.then22, label %if.else24

if.then22:                                        ; preds = %if.else20
  store i32 0, i32* %a23
  %11 = load i32, i32* %a23
  %12 = zext i32 %11 to i64
  store i64 %12, i64* %if.value21
  br label %if.end34

if.else24:                                        ; preds = %if.else20
  br i1 false, label %if.then26, label %if.else28

if.then26:                                        ; preds = %if.else24
  store i16 0, i16* %a27
  %13 = load i16, i16* %a27
  %14 = zext i16 %13 to i64
  store i64 %14, i64* %if.value25
  br label %if.end33

if.else28:                                        ; preds = %if.else24
  br i1 false, label %if.then30, label %if.else32

if.then30:                                        ; preds = %if.else28
  store i8 0, i8* %a31
  %15 = load i8, i8* %a31
  %16 = zext i8 %15 to i64
  store i64 %16, i64* %if.value29
  br label %if.end

if.else32:                                        ; preds = %if.else28
  store i64 0, i64* %if.value29
  br label %if.end

if.end:                                           ; preds = %if.else32, %if.then30
  %17 = load i64, i64* %if.value29
  store i64 %17, i64* %if.value25
  br label %if.end33

if.end33:                                         ; preds = %if.end, %if.then26
  %18 = load i64, i64* %if.value25
  store i64 %18, i64* %if.value21
  br label %if.end34

if.end34:                                         ; preds = %if.end33, %if.then22
  %19 = load i64, i64* %if.value21
  store i64 %19, i64* %if.value17
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %if.then18
  %20 = load i64, i64* %if.value17
  store i64 %20, i64* %if.value13
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %if.then14
  %21 = load i64, i64* %if.value13
  store i64 %21, i64* %if.value9
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %if.then10
  %22 = load i64, i64* %if.value9
  store i64 %22, i64* %if.value5
  br label %if.end38

if.end38:                                         ; preds = %if.end37, %if.then6
  %23 = load i64, i64* %if.value5
  store i64 %23, i64* %if.value2
  br label %if.end39

if.end39:                                         ; preds = %if.end38, %if.then3
  %24 = load i64, i64* %if.value2
  store i64 %24, i64* %if.value
  br label %if.end40

if.end40:                                         ; preds = %if.end39, %if.then
  %25 = load i64, i64* %if.value
  store i64 %25, i64* %ret
  %26 = load i64, i64* %ret
  ret i64 %26

unreachable:                                      ; No predecessors!
  ret i64 0
}

define void @_ZN7default10Aggregate84initEv(%record._ZN7default10Aggregate8E* noalias sret, i8 addrspace(1)* %context) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %callRet1 = alloca %record._ZN7default10Aggregate8E
  %callRet = alloca %record._ZN7default10Aggregate8E
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  call void @_ZN7default10Aggregate8E(%record._ZN7default10Aggregate8E* sret %callRet, i8 0)
  %1 = bitcast %record._ZN7default10Aggregate8E* %0 to i8*
  %2 = bitcast %record._ZN7default10Aggregate8E* %callRet to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 %2, i64 1, i1 false)
  ret void

unreachable:                                      ; No predecessors!
  call void @_ZN7default10Aggregate8E(%record._ZN7default10Aggregate8E* sret %callRet1, i8 0)
  %3 = bitcast %record._ZN7default10Aggregate8E* %0 to i8*
  %4 = bitcast %record._ZN7default10Aggregate8E* %callRet1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 %4, i64 1, i1 false)
  ret void

unreachable2:                                     ; No predecessors!
  ret void
}

define void @_ZN7default7default12Aggregate453Ilb4initEv(%record._ZN7default7default12Aggregate453IlbE* noalias sret, i8 addrspace(1)* %context) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %callRet1 = alloca %record._ZN7default7default12Aggregate453IlbE
  %callRet = alloca %record._ZN7default7default12Aggregate453IlbE
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  call void @_ZN7default7default12Aggregate453IlbE(%record._ZN7default7default12Aggregate453IlbE* sret %callRet, i8 0)
  %1 = bitcast %record._ZN7default7default12Aggregate453IlbE* %0 to i8*
  %2 = bitcast %record._ZN7default7default12Aggregate453IlbE* %callRet to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 %2, i64 1, i1 false)
  ret void

unreachable:                                      ; No predecessors!
  call void @_ZN7default7default12Aggregate453IlbE(%record._ZN7default7default12Aggregate453IlbE* sret %callRet1, i8 0)
  %3 = bitcast %record._ZN7default7default12Aggregate453IlbE* %0 to i8*
  %4 = bitcast %record._ZN7default7default12Aggregate453IlbE* %callRet1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 %4, i64 1, i1 false)
  ret void

unreachable2:                                     ; No predecessors!
  ret void
}

define void @_ZN7default7default12Aggregate423I10Aggregate8c4initEv(%record._ZN7default7default12Aggregate423I10Aggregate8cE* noalias sret, i8 addrspace(1)* %context) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %callRet1 = alloca %record._ZN7default7default12Aggregate423I10Aggregate8cE
  %callRet = alloca %record._ZN7default7default12Aggregate423I10Aggregate8cE
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  call void @_ZN7default7default12Aggregate423I10Aggregate8cE(%record._ZN7default7default12Aggregate423I10Aggregate8cE* sret %callRet, i8 0)
  %1 = bitcast %record._ZN7default7default12Aggregate423I10Aggregate8cE* %0 to i8*
  %2 = bitcast %record._ZN7default7default12Aggregate423I10Aggregate8cE* %callRet to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 %2, i64 1, i1 false)
  ret void

unreachable:                                      ; No predecessors!
  call void @_ZN7default7default12Aggregate423I10Aggregate8cE(%record._ZN7default7default12Aggregate423I10Aggregate8cE* sret %callRet1, i8 0)
  %3 = bitcast %record._ZN7default7default12Aggregate423I10Aggregate8cE* %0 to i8*
  %4 = bitcast %record._ZN7default7default12Aggregate423I10Aggregate8cE* %callRet1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 %4, i64 1, i1 false)
  ret void

unreachable2:                                     ; No predecessors!
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #4

define i8 addrspace(1)* @_ZN7default7Class764initEv() gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %var486 = alloca i8
  %var438 = alloca %record._ZN7default7default12Aggregate423I10Aggregate8cE
  %callRet = alloca %record._ZN7default7default12Aggregate423I10Aggregate8cE
  %var313 = alloca i1
  %var145 = alloca i1
  %if.value13 = alloca i1
  %if.value9 = alloca i1
  %if.value5 = alloca i1
  %if.value1 = alloca i1
  %var92 = alloca i1
  %if.value = alloca i1
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @_ZN7default7Class76E.objKlass)
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  br i1 false, label %if.then, label %if.else

if.then:                                          ; preds = %chirblock.body
  store i1 true, i1* %if.value
  br label %if.end

if.else:                                          ; preds = %chirblock.body
  store i1 false, i1* %if.value
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i1, i1* %if.value
  store i1 %1, i1* %var92
  br i1 true, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.end
  store i1 true, i1* %if.value1
  br label %if.end4

if.else3:                                         ; preds = %if.end
  store i1 false, i1* %if.value1
  br label %if.end4

if.end4:                                          ; preds = %if.else3, %if.then2
  %2 = load i1, i1* %if.value1
  br i1 false, label %if.then6, label %if.else7

if.then6:                                         ; preds = %if.end4
  store i1 true, i1* %if.value5
  br label %if.end8

if.else7:                                         ; preds = %if.end4
  store i1 false, i1* %if.value5
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %3 = load i1, i1* %if.value5
  br i1 false, label %if.then10, label %if.else11

if.then10:                                        ; preds = %if.end8
  store i1 true, i1* %if.value9
  br label %if.end12

if.else11:                                        ; preds = %if.end8
  store i1 false, i1* %if.value9
  br label %if.end12

if.end12:                                         ; preds = %if.else11, %if.then10
  %4 = load i1, i1* %if.value9
  br i1 false, label %if.then14, label %if.else15

if.then14:                                        ; preds = %if.end12
  store i1 true, i1* %if.value13
  br label %if.end16

if.else15:                                        ; preds = %if.end12
  store i1 false, i1* %if.value13
  br label %if.end16

if.end16:                                         ; preds = %if.else15, %if.then14
  %5 = load i1, i1* %if.value13
  store i1 %5, i1* %var145
  store i1 false, i1* %var313
  call void @_ZN7default7default12Aggregate423I10Aggregate8c4initEv(%record._ZN7default7default12Aggregate423I10Aggregate8cE* sret %callRet, i8 addrspace(1)* null)
  %6 = bitcast %record._ZN7default7default12Aggregate423I10Aggregate8cE* %var438 to i8*
  %7 = bitcast %record._ZN7default7default12Aggregate423I10Aggregate8cE* %callRet to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 %7, i64 1, i1 false)
  store i8 109, i8* %var486
  %8 = load i1, i1* %var92
  %9 = bitcast i8 addrspace(1)* %0 to %ObjLayout._ZN7default7Class76E addrspace(1)*
  %10 = getelementptr %ObjLayout._ZN7default7Class76E, %ObjLayout._ZN7default7Class76E addrspace(1)* %9, i32 0, i32 1
  store i1 %8, i1 addrspace(1)* %10
  %11 = load i1, i1* %var145
  %12 = bitcast i8 addrspace(1)* %0 to %ObjLayout._ZN7default7Class76E addrspace(1)*
  %13 = getelementptr %ObjLayout._ZN7default7Class76E, %ObjLayout._ZN7default7Class76E addrspace(1)* %12, i32 0, i32 2
  store i1 %11, i1 addrspace(1)* %13
  %14 = load i1, i1* %var313
  %15 = bitcast i8 addrspace(1)* %0 to %ObjLayout._ZN7default7Class76E addrspace(1)*
  %16 = getelementptr %ObjLayout._ZN7default7Class76E, %ObjLayout._ZN7default7Class76E addrspace(1)* %15, i32 0, i32 3
  store i1 %14, i1 addrspace(1)* %16
  %17 = bitcast i8 addrspace(1)* %0 to %ObjLayout._ZN7default7Class76E addrspace(1)*
  %18 = getelementptr %ObjLayout._ZN7default7Class76E, %ObjLayout._ZN7default7Class76E addrspace(1)* %17, i32 0, i32 4
  %19 = bitcast %record._ZN7default7default12Aggregate423I10Aggregate8cE addrspace(1)* %18 to i8 addrspace(1)*
  %20 = bitcast %record._ZN7default7default12Aggregate423I10Aggregate8cE* %var438 to i8*
  call void @llvm.memcpy.p1i8.p0i8.i64(i8 addrspace(1)* align 1 %19, i8* align 1 %20, i64 1, i1 false)
  %21 = load i8, i8* %var486
  %22 = bitcast i8 addrspace(1)* %0 to %ObjLayout._ZN7default7Class76E addrspace(1)*
  %23 = getelementptr %ObjLayout._ZN7default7Class76E, %ObjLayout._ZN7default7Class76E addrspace(1)* %22, i32 0, i32 5
  store i8 %21, i8 addrspace(1)* %23
  ret i8 addrspace(1)* %0

unreachable:                                      ; No predecessors!
  ret i8 addrspace(1)* null
}

define weak_odr void @_ZN7default7default12Aggregate423I10Aggregate8cE(%record._ZN7default7default12Aggregate423I10Aggregate8cE* noalias sret, i8 %"0") comdat gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %"01" = getelementptr inbounds %record._ZN7default7default12Aggregate423I10Aggregate8cE, %record._ZN7default7default12Aggregate423I10Aggregate8cE* %0, i32 0, i32 0
  store i8 %"0", i8* %"01"
  ret void
}

define weak_odr void @_ZN7default10Aggregate8E(%record._ZN7default10Aggregate8E* noalias sret, i8 %"0") comdat gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %"01" = getelementptr inbounds %record._ZN7default10Aggregate8E, %record._ZN7default10Aggregate8E* %0, i32 0, i32 0
  store i8 %"0", i8* %"01"
  ret void
}

define weak_odr void @Tuple3_sdhE(%Tuple3_sdhE* noalias sret, i16 %"0", double %"1", i8 %"2") comdat gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %"01" = getelementptr inbounds %Tuple3_sdhE, %Tuple3_sdhE* %0, i32 0, i32 0
  store i16 %"0", i16* %"01"
  %"12" = getelementptr inbounds %Tuple3_sdhE, %Tuple3_sdhE* %0, i32 0, i32 1
  store double %"1", double* %"12"
  %"23" = getelementptr inbounds %Tuple3_sdhE, %Tuple3_sdhE* %0, i32 0, i32 2
  store i8 %"2", i8* %"23"
  ret void
}

define weak_odr void @Tuple2_bjE(%Tuple2_bjE* noalias sret, i1 %"0", i32 %"1") comdat gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %"01" = getelementptr inbounds %Tuple2_bjE, %Tuple2_bjE* %0, i32 0, i32 0
  store i1 %"0", i1* %"01"
  %"12" = getelementptr inbounds %Tuple2_bjE, %Tuple2_bjE* %0, i32 0, i32 1
  store i32 %"1", i32* %"12"
  ret void
}

define weak_odr void @Tuple3_u6Option10Aggregate8jE(%Tuple3_u6Option10Aggregate8jE* noalias sret, %Unit.Type* %"0", i8 addrspace(1)* %"1", i32 %"2") comdat gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %"01" = getelementptr inbounds %Tuple3_u6Option10Aggregate8jE, %Tuple3_u6Option10Aggregate8jE* %0, i32 0, i32 0
  %1 = bitcast %Unit.Type* %"01" to i8*
  %2 = bitcast %Unit.Type* %"0" to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 %2, i64 1, i1 false)
  %"12" = getelementptr inbounds %Tuple3_u6Option10Aggregate8jE, %Tuple3_u6Option10Aggregate8jE* %0, i32 0, i32 1
  store i8 addrspace(1)* %"1", i8 addrspace(1)** %"12"
  %"23" = getelementptr inbounds %Tuple3_u6Option10Aggregate8jE, %Tuple3_u6Option10Aggregate8jE* %0, i32 0, i32 2
  store i32 %"2", i32* %"23"
  ret void
}

define i1 @"_ZN7default6func46E$optionalParam47___0v"(i8 addrspace(1)* %context) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %if.value5 = alloca i1
  %if.value1 = alloca i1
  %if.value = alloca i1
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  br i1 false, label %if.then, label %if.else

if.then:                                          ; preds = %chirblock.body
  store i1 true, i1* %if.value
  br label %if.end

if.else:                                          ; preds = %chirblock.body
  store i1 false, i1* %if.value
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %0 = load i1, i1* %if.value
  br i1 false, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.end
  store i1 true, i1* %if.value1
  br label %if.end4

if.else3:                                         ; preds = %if.end
  store i1 false, i1* %if.value1
  br label %if.end4

if.end4:                                          ; preds = %if.else3, %if.then2
  %1 = load i1, i1* %if.value1
  br i1 false, label %if.then6, label %if.else7

if.then6:                                         ; preds = %if.end4
  store i1 true, i1* %if.value5
  br label %if.end8

if.else7:                                         ; preds = %if.end4
  store i1 false, i1* %if.value5
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %2 = load i1, i1* %if.value5
  ret i1 %2

unreachable:                                      ; No predecessors!
  ret i1 false
}

define void @"_ZN7default6func46E$optionalParam54___0btc"(%Tuple2_bjE* noalias sret, i8 addrspace(1)* %context, i1 %optionalParam47, i16 %namedParam52, i32 %namedParam53) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %callRet = alloca %Tuple2_bjE
  %if.value1 = alloca i1
  %if.value = alloca i1
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  br i1 false, label %if.then, label %if.else

if.then:                                          ; preds = %chirblock.body
  store i1 true, i1* %if.value
  br label %if.end

if.else:                                          ; preds = %chirblock.body
  store i1 false, i1* %if.value
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i1, i1* %if.value
  br i1 false, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.end
  store i1 true, i1* %if.value1
  br label %if.end4

if.else3:                                         ; preds = %if.end
  store i1 false, i1* %if.value1
  br label %if.end4

if.end4:                                          ; preds = %if.else3, %if.then2
  %2 = load i1, i1* %if.value1
  call void @Tuple2_bjE(%Tuple2_bjE* sret %callRet, i1 %2, i32 76)
  %3 = bitcast %Tuple2_bjE* %0 to i8*
  %4 = bitcast %Tuple2_bjE* %callRet to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 4 %4, i64 8, i1 false)
  ret void

unreachable:                                      ; No predecessors!
  ret void
}

define weak_odr void @Tuple4_iulmE(%Tuple4_iulmE* noalias sret, i32 %"0", %Unit.Type* %"1", i64 %"2", i64 %"3") comdat gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %"01" = getelementptr inbounds %Tuple4_iulmE, %Tuple4_iulmE* %0, i32 0, i32 0
  store i32 %"0", i32* %"01"
  %"12" = getelementptr inbounds %Tuple4_iulmE, %Tuple4_iulmE* %0, i32 0, i32 1
  %1 = bitcast %Unit.Type* %"12" to i8*
  %2 = bitcast %Unit.Type* %"1" to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 %2, i64 1, i1 false)
  %"23" = getelementptr inbounds %Tuple4_iulmE, %Tuple4_iulmE* %0, i32 0, i32 2
  store i64 %"2", i64* %"23"
  %"34" = getelementptr inbounds %Tuple4_iulmE, %Tuple4_iulmE* %0, i32 0, i32 3
  store i64 %"3", i64* %"34"
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p1i8.i64(i8* nocapture writeonly, i8 addrspace(1)* nocapture readonly, i64, i1) #4

declare void @llvm.gcwrite.agg.cj(i8 addrspace(1)*, i8 addrspace(1)*, i8 addrspace(1)*, i64) #5

define void @_ZN7default7func2817func341Efi6Optionuc(%record._ZN7default10Aggregate8E* noalias sret, i8 addrspace(1)* %context, float %param342, i32 %namedParam343, i8 addrspace(1)* %namedParam344, i32 %optionalParam345) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %callret = alloca %record._ZN7default10Aggregate8E
  %x = alloca %record._ZN7default10Aggregate8E
  %if.value6 = alloca %record._ZN7default10Aggregate8E
  %callRet4 = alloca %Tuple3_u6Option10Aggregate8jE
  %if.value1 = alloca %Tuple3_u6Option10Aggregate8jE
  %callRet = alloca %Tuple3_u6Option10Aggregate8jE
  %if.value = alloca %Tuple3_u6Option10Aggregate8jE
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  br i1 true, label %if.then, label %if.else

if.then:                                          ; preds = %chirblock.body
  %1 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E$Some1.init"(i64 0, %record._ZN7default10Aggregate8E* @_ZN7default6var354E)
  call void @Tuple3_u6Option10Aggregate8jE(%Tuple3_u6Option10Aggregate8jE* sret %callRet, %Unit.Type* @_ZN7default5var39E, i8 addrspace(1)* %1, i32 230)
  %2 = bitcast %Tuple3_u6Option10Aggregate8jE* %if.value to i8*
  %3 = bitcast %Tuple3_u6Option10Aggregate8jE* %callRet to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 8 %3, i64 24, i1 false)
  br label %if.end5

if.else:                                          ; preds = %chirblock.body
  %4 = load i1, i1* @_ZN7default5var99E
  br i1 %4, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.else
  %5 = load i16, i16* @_ZN7default6var221E
  %6 = bitcast i8 addrspace(1)* %context to %ObjLayout._ZN7default21__Auto__Environment_8 addrspace(1)*
  %7 = getelementptr %ObjLayout._ZN7default21__Auto__Environment_8, %ObjLayout._ZN7default21__Auto__Environment_8 addrspace(1)* %6, i32 0, i32 1
  %8 = bitcast %Tuple3_u6Option10Aggregate8jE* %if.value1 to i8*
  %9 = bitcast %Tuple3_u6Option10Aggregate8jE addrspace(1)* %7 to i8 addrspace(1)*
  call void @llvm.memcpy.p0i8.p1i8.i64(i8* align 8 %8, i8 addrspace(1)* align 8 %9, i64 24, i1 false)
  br label %if.end

if.else3:                                         ; preds = %if.else
  %10 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E$Some1.init"(i64 0, %record._ZN7default10Aggregate8E* @_ZN7default6var354E)
  %11 = load i32, i32* @_ZN7default6var383E
  call void @Tuple3_u6Option10Aggregate8jE(%Tuple3_u6Option10Aggregate8jE* sret %callRet4, %Unit.Type* @Unit.Val, i8 addrspace(1)* %10, i32 %11)
  %12 = bitcast %Tuple3_u6Option10Aggregate8jE* %if.value1 to i8*
  %13 = bitcast %Tuple3_u6Option10Aggregate8jE* %callRet4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %12, i8* align 8 %13, i64 24, i1 false)
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %14 = bitcast %Tuple3_u6Option10Aggregate8jE* %if.value to i8*
  %15 = bitcast %Tuple3_u6Option10Aggregate8jE* %if.value1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %14, i8* align 8 %15, i64 24, i1 false)
  br label %if.end5

if.end5:                                          ; preds = %if.end, %if.then
  %16 = getelementptr inbounds %Tuple3_u6Option10Aggregate8jE, %Tuple3_u6Option10Aggregate8jE* %if.value, i32 0, i32 1
  %17 = load i8 addrspace(1)*, i8 addrspace(1)** %16
  %18 = bitcast i8 addrspace(1)* %17 to %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E" addrspace(1)*
  %19 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E", %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E" addrspace(1)* %18, i32 0, i32 1
  %20 = load i64, i64 addrspace(1)* %19
  %icmpeq = icmp eq i64 %20, 0
  br i1 %icmpeq, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end5
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end5
  %conv = phi i1 [ false, %if.end5 ], [ true, %land.rhs ]
  br i1 %conv, label %if.then7, label %if.else8

if.then7:                                         ; preds = %land.end
  %21 = bitcast i8 addrspace(1)* %17 to %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E$Some1" addrspace(1)*
  %22 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E$Some1" addrspace(1)* %21, i32 0, i32 1
  %23 = bitcast %record._ZN7default10Aggregate8E* %x to i8*
  %24 = bitcast %record._ZN7default10Aggregate8E addrspace(1)* %22 to i8 addrspace(1)*
  call void @llvm.memcpy.p0i8.p1i8.i64(i8* align 1 %23, i8 addrspace(1)* align 1 %24, i64 1, i1 false)
  %25 = bitcast %record._ZN7default10Aggregate8E* %if.value6 to i8*
  %26 = bitcast %record._ZN7default10Aggregate8E* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %25, i8* align 1 %26, i64 1, i1 false)
  br label %if.end9

if.else8:                                         ; preds = %land.end
  %27 = load i1, i1* @_ZN7default6var399E
  %28 = load i1, i1* @_ZN7default6var399E
  %29 = call i8 addrspace(1)* @"_ZN7default7func2817func388E$optionalParam393___0bu"(i8 addrspace(1)* null, i1 %28, %Unit.Type* @_ZN7default5var39E)
  %30 = load i8, i8* @_ZN7default6var404E
  %31 = call i8 addrspace(1)* @_ZN7default7func2817func388Ebu7Class76a(i8 addrspace(1)* null, i1 %27, %Unit.Type* @_ZN7default5var39E, i8 addrspace(1)* %29, i8 %30)
  %32 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E$Some1.init"(i64 0, %record._ZN7default10Aggregate8E* @_ZN7default6var354E)
  %33 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E$Some1.init"(i64 0, %record._ZN7default10Aggregate8E* @_ZN7default6var354E)
  %34 = bitcast i8 addrspace(1)* %31 to %ObjLayout.Object addrspace(1)*
  %35 = getelementptr inbounds %ObjLayout.Object, %ObjLayout.Object addrspace(1)* %34, i32 0, i32 0
  %36 = load %KlassInfo*, %KlassInfo* addrspace(1)* %35
  %37 = getelementptr inbounds %KlassInfo, %KlassInfo* %36, i32 0, i32 4
  %38 = load i8**, i8*** %37
  %39 = getelementptr i8*, i8** %38, i64 1
  %40 = load i8*, i8** %39
  %41 = bitcast i8* %40 to void (%record._ZN7default10Aggregate8E*, i8 addrspace(1)*, i8 addrspace(1)*, i16, i8 addrspace(1)*)*
  call void %41(%record._ZN7default10Aggregate8E* sret %callret, i8 addrspace(1)* %31, i8 addrspace(1)* %32, i16 208, i8 addrspace(1)* %33)
  %42 = bitcast %record._ZN7default10Aggregate8E* %if.value6 to i8*
  %43 = bitcast %record._ZN7default10Aggregate8E* %callret to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %42, i8* align 1 %43, i64 1, i1 false)
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %if.then7
  %44 = bitcast %record._ZN7default10Aggregate8E* %0 to i8*
  %45 = bitcast %record._ZN7default10Aggregate8E* %if.value6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %44, i8* align 1 %45, i64 1, i1 false)
  ret void

unreachable:                                      ; No predecessors!
  ret void
}

define i8 addrspace(1)* @"_ZN7default7func2817func388E$optionalParam393___0bu"(i8 addrspace(1)* %context, i1 %optionalParam389, %Unit.Type* %optionalParam391) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %0 = call i8 addrspace(1)* @_ZN7default7Class764initEv()
  ret i8 addrspace(1)* %0

unreachable:                                      ; No predecessors!
  ret i8 addrspace(1)* null
}

define i8 addrspace(1)* @_ZN7default7func2817func388Ebu7Class76a(i8 addrspace(1)* %context, i1 %optionalParam389, %Unit.Type* %optionalParam391, i8 addrspace(1)* %optionalParam393, i8 %namedParam395) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %0 = call i8 addrspace(1)* @_ZN7default7Class764initEv()
  ret i8 addrspace(1)* %0

unreachable:                                      ; No predecessors!
  ret i8 addrspace(1)* null
}

define i8 addrspace(1)* @_ZN7default6func736func80Ef10Aggregate8h(i8 addrspace(1)* %context, float %param81, %record._ZN7default10Aggregate8E* %namedParam82, i8 %namedParam83) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %x49 = alloca i8 addrspace(1)*
  %if.value43 = alloca i8 addrspace(1)*
  %if.value40 = alloca i8 addrspace(1)*
  %if.value34 = alloca i64
  %caseVar242 = alloca i8 addrspace(1)*
  %if.value30 = alloca i64
  %if.value29 = alloca i8 addrspace(1)*
  %var253 = alloca %Tuple3_7Class76ajE
  %callRet = alloca %Tuple3_7Class76ajE
  %if.value24 = alloca %Unit.Type
  %caseVar132 = alloca i16
  %if.value14 = alloca i8 addrspace(1)*
  %if.value11 = alloca i8 addrspace(1)*
  %if.value3 = alloca i1
  %if.value2 = alloca i1
  %if.value1 = alloca i1
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %0 = bitcast i8 addrspace(1)* %context to %ObjLayout._ZN7default21__Auto__Environment_6 addrspace(1)*
  %1 = getelementptr %ObjLayout._ZN7default21__Auto__Environment_6, %ObjLayout._ZN7default21__Auto__Environment_6 addrspace(1)* %0, i32 0, i32 1
  %2 = load i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)* %1
  %3 = bitcast i8 addrspace(1)* %2 to %ObjLayout._ZN7default7Class76E addrspace(1)*
  %4 = getelementptr %ObjLayout._ZN7default7Class76E, %ObjLayout._ZN7default7Class76E addrspace(1)* %3, i32 0, i32 1
  %5 = load i1, i1 addrspace(1)* %4
  br i1 %5, label %if.then, label %if.else

if.then:                                          ; preds = %chirblock.body
  %6 = load i1, i1* @_ZN7default5var99E
  store i1 %6, i1* %if.value1
  br label %if.end9

if.else:                                          ; preds = %chirblock.body
  br i1 true, label %if.then4, label %if.else5

if.then4:                                         ; preds = %if.else
  store i1 true, i1* %if.value3
  br label %if.end

if.else5:                                         ; preds = %if.else
  store i1 false, i1* %if.value3
  br label %if.end

if.end:                                           ; preds = %if.else5, %if.then4
  %7 = load i1, i1* %if.value3
  br i1 %7, label %if.then6, label %if.else7

if.then6:                                         ; preds = %if.end
  store i1 true, i1* %if.value2
  br label %if.end8

if.else7:                                         ; preds = %if.end
  %8 = bitcast %Unit.Type* %if.value24 to i8*
  %9 = bitcast %Unit.Type* @Unit.Val to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %8, i8* align 1 %9, i64 1, i1 false)
  store i1 true, i1* %if.value2
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %10 = load i1, i1* %if.value2
  store i1 %10, i1* %if.value1
  br label %if.end9

if.end9:                                          ; preds = %if.end8, %if.then
  %11 = load i1, i1* %if.value1
  br i1 %11, label %if.then10, label %if.else23

if.then10:                                        ; preds = %if.end9
  %12 = call i8 addrspace(1)* @_ZN7default7Class764initEv()
  br i1 false, label %if.then12, label %if.else13

if.then12:                                        ; preds = %if.then10
  %13 = load i8 addrspace(1)*, i8 addrspace(1)** @_ZN7default6var126IuE
  store i8 addrspace(1)* %13, i8 addrspace(1)** %if.value11
  br label %if.end18

if.else13:                                        ; preds = %if.then10
  br i1 false, label %if.then15, label %if.else16

if.then15:                                        ; preds = %if.else13
  store i16 0, i16* %caseVar132
  %14 = load i8 addrspace(1)*, i8 addrspace(1)** @_ZN7default6var126IuE
  store i8 addrspace(1)* %14, i8 addrspace(1)** %if.value14
  br label %if.end17

if.else16:                                        ; preds = %if.else13
  %15 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIuE.init"(i64 1)
  store i8 addrspace(1)* %15, i8 addrspace(1)** %if.value14
  br label %if.end17

if.end17:                                         ; preds = %if.else16, %if.then15
  %16 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value14
  store i8 addrspace(1)* %16, i8 addrspace(1)** %if.value11
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %if.then12
  %17 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value11
  %18 = bitcast i8 addrspace(1)* %17 to %"ObjLayout._ZN7default12core$FS$core6OptionIuE" addrspace(1)*
  %19 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIuE", %"ObjLayout._ZN7default12core$FS$core6OptionIuE" addrspace(1)* %18, i32 0, i32 1
  %20 = load i64, i64 addrspace(1)* %19
  %icmpeq = icmp eq i64 %20, 0
  br i1 %icmpeq, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end18
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end18
  %conv = phi i1 [ false, %if.end18 ], [ true, %land.rhs ]
  br i1 %conv, label %if.then20, label %if.else21

if.then20:                                        ; preds = %land.end
  %21 = bitcast i8 addrspace(1)* %17 to %"ObjLayout._ZN7default12core$FS$core6OptionIuE$Some1" addrspace(1)*
  %22 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIuE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionIuE$Some1" addrspace(1)* %21, i32 0, i32 1
  %23 = bitcast %Unit.Type* %if.value24 to i8*
  %24 = bitcast %Unit.Type addrspace(1)* %22 to i8 addrspace(1)*
  call void @llvm.memcpy.p0i8.p1i8.i64(i8* align 1 %23, i8 addrspace(1)* align 1 %24, i64 1, i1 false)
  br label %if.end22

if.else21:                                        ; preds = %land.end
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %if.then20
  br label %if.end28

if.else23:                                        ; preds = %if.end9
  %25 = bitcast i8 addrspace(1)* %context to %ObjLayout._ZN7default21__Auto__Environment_6 addrspace(1)*
  %26 = getelementptr %ObjLayout._ZN7default21__Auto__Environment_6, %ObjLayout._ZN7default21__Auto__Environment_6 addrspace(1)* %25, i32 0, i32 1
  %27 = load i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)* %26
  %28 = bitcast i8 addrspace(1)* %27 to %ObjLayout._ZN7default7Class76E addrspace(1)*
  %29 = getelementptr %ObjLayout._ZN7default7Class76E, %ObjLayout._ZN7default7Class76E addrspace(1)* %28, i32 0, i32 2
  %30 = load i1, i1 addrspace(1)* %29
  br i1 %30, label %if.then25, label %if.else26

if.then25:                                        ; preds = %if.else23
  br label %if.end27

if.else26:                                        ; preds = %if.else23
  br label %if.end27

if.end27:                                         ; preds = %if.else26, %if.then25
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %if.end22
  %31 = call i8 addrspace(1)* @_ZN7default7Class764initEv()
  call void @Tuple3_7Class76ajE(%Tuple3_7Class76ajE* sret %callRet, i8 addrspace(1)* %31, i8 25, i32 9)
  %32 = bitcast %Tuple3_7Class76ajE* %var253 to i8*
  %33 = bitcast %Tuple3_7Class76ajE* %callRet to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %32, i8* align 8 %33, i64 16, i1 false)
  %34 = call i16 @"_ZN7default7func158E$optionalParam159___0v"(i8 addrspace(1)* null)
  %35 = load i1, i1* @_ZN7default6var185E
  %36 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIbE$Some1.init"(i64 0, i1 %35)
  br i1 true, label %if.then31, label %if.else32

if.then31:                                        ; preds = %if.end28
  store i8 addrspace(1)* %36, i8 addrspace(1)** %caseVar242
  store i64 114, i64* %if.value30
  br label %if.end33

if.else32:                                        ; preds = %if.end28
  %37 = load i64, i64* @_ZN7default6var248E
  store i64 %37, i64* %if.value30
  br label %if.end33

if.end33:                                         ; preds = %if.else32, %if.then31
  %38 = load i64, i64* %if.value30
  %39 = load i1, i1* @_ZN7default6var185E
  %40 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIbE$Some1.init"(i64 0, i1 %39)
  br i1 true, label %if.then35, label %if.else36

if.then35:                                        ; preds = %if.end33
  store i8 addrspace(1)* %40, i8 addrspace(1)** %caseVar242
  store i64 114, i64* %if.value34
  br label %if.end37

if.else36:                                        ; preds = %if.end33
  %41 = load i64, i64* @_ZN7default6var248E
  store i64 %41, i64* %if.value34
  br label %if.end37

if.end37:                                         ; preds = %if.else36, %if.then35
  %42 = load i64, i64* %if.value34
  %43 = call i32 @"_ZN7default7func158E$optionalParam162___0tm"(i8 addrspace(1)* null, i16 %34, i64 %42)
  %44 = call i1 @_ZN7default7func158Etmc(i8 addrspace(1)* null, i16 %34, i64 %38, i32 %43)
  br i1 %44, label %if.then38, label %if.else39

if.then38:                                        ; preds = %if.end37
  %45 = getelementptr inbounds %Tuple3_7Class76ajE, %Tuple3_7Class76ajE* %var253, i32 0, i32 0
  %46 = load i8 addrspace(1)*, i8 addrspace(1)** %45
  store i8 addrspace(1)* %46, i8 addrspace(1)** %if.value29
  br label %if.end53

if.else39:                                        ; preds = %if.end37
  %47 = load i1, i1* @_ZN7default6var185E
  br i1 %47, label %if.then41, label %if.else42

if.then41:                                        ; preds = %if.else39
  %48 = bitcast i8 addrspace(1)* %context to %ObjLayout._ZN7default21__Auto__Environment_6 addrspace(1)*
  %49 = getelementptr %ObjLayout._ZN7default21__Auto__Environment_6, %ObjLayout._ZN7default21__Auto__Environment_6 addrspace(1)* %48, i32 0, i32 1
  %50 = load i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)* %49
  store i8 addrspace(1)* %50, i8 addrspace(1)** %if.value40
  br label %if.end52

if.else42:                                        ; preds = %if.else39
  %51 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI7Class76E.init"(i64 1)
  %52 = bitcast i8 addrspace(1)* %51 to %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E" addrspace(1)*
  %53 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E", %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E" addrspace(1)* %52, i32 0, i32 1
  %54 = load i64, i64 addrspace(1)* %53
  %icmpeq44 = icmp eq i64 %54, 0
  br i1 %icmpeq44, label %land.rhs45, label %land.end46

land.rhs45:                                       ; preds = %if.else42
  br label %land.end46

land.end46:                                       ; preds = %land.rhs45, %if.else42
  %conv47 = phi i1 [ false, %if.else42 ], [ true, %land.rhs45 ]
  br i1 %conv47, label %if.then48, label %if.else50

if.then48:                                        ; preds = %land.end46
  %55 = bitcast i8 addrspace(1)* %51 to %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E$Some1" addrspace(1)*
  %56 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E$Some1" addrspace(1)* %55, i32 0, i32 1
  %57 = load i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)* %56
  store i8 addrspace(1)* %57, i8 addrspace(1)** %x49
  %58 = load i8 addrspace(1)*, i8 addrspace(1)** %x49
  store i8 addrspace(1)* %58, i8 addrspace(1)** %if.value43
  br label %if.end51

if.else50:                                        ; preds = %land.end46
  %59 = call i8 addrspace(1)* @_ZN7default7Class764initEv()
  store i8 addrspace(1)* %59, i8 addrspace(1)** %if.value43
  br label %if.end51

if.end51:                                         ; preds = %if.else50, %if.then48
  %60 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value43
  store i8 addrspace(1)* %60, i8 addrspace(1)** %if.value40
  br label %if.end52

if.end52:                                         ; preds = %if.end51, %if.then41
  %61 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value40
  store i8 addrspace(1)* %61, i8 addrspace(1)** %if.value29
  br label %if.end53

if.end53:                                         ; preds = %if.end52, %if.then38
  %62 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value29
  ret i8 addrspace(1)* %62

unreachable:                                      ; No predecessors!
  ret i8 addrspace(1)* null
}

define weak_odr void @Tuple3_7Class76ajE(%Tuple3_7Class76ajE* noalias sret, i8 addrspace(1)* %"0", i8 %"1", i32 %"2") comdat gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %"01" = getelementptr inbounds %Tuple3_7Class76ajE, %Tuple3_7Class76ajE* %0, i32 0, i32 0
  store i8 addrspace(1)* %"0", i8 addrspace(1)** %"01"
  %"12" = getelementptr inbounds %Tuple3_7Class76ajE, %Tuple3_7Class76ajE* %0, i32 0, i32 1
  store i8 %"1", i8* %"12"
  %"23" = getelementptr inbounds %Tuple3_7Class76ajE, %Tuple3_7Class76ajE* %0, i32 0, i32 2
  store i32 %"2", i32* %"23"
  ret void
}

define i16 @"_ZN7default7func158E$optionalParam159___0v"(i8 addrspace(1)* %context) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  ret i16 25

unreachable:                                      ; No predecessors!
  ret i16 0
}

define i32 @"_ZN7default7func158E$optionalParam162___0tm"(i8 addrspace(1)* %context, i16 %optionalParam159, i64 %namedParam161) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  ret i32 87

unreachable:                                      ; No predecessors!
  ret i32 0
}

define weak_odr void @Tuple2_t10Aggregate8E(%Tuple2_t10Aggregate8E* noalias sret, i16 %"0", %record._ZN7default10Aggregate8E* %"1") comdat gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %"01" = getelementptr inbounds %Tuple2_t10Aggregate8E, %Tuple2_t10Aggregate8E* %0, i32 0, i32 0
  store i16 %"0", i16* %"01"
  %"12" = getelementptr inbounds %Tuple2_t10Aggregate8E, %Tuple2_t10Aggregate8E* %0, i32 0, i32 1
  %1 = bitcast %record._ZN7default10Aggregate8E* %"12" to i8*
  %2 = bitcast %record._ZN7default10Aggregate8E* %"1" to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 %2, i64 1, i1 false)
  ret void
}

define i32 @"_ZN7default7Class767func491E$optionalParam493___0Tuple2_t10Aggregate8E"(i8 addrspace(1)* %context, %Tuple2_t10Aggregate8E* %param492) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  ret i32 252

unreachable:                                      ; No predecessors!
  ret i32 0
}

define i64 @"_ZN7default7Class767func641E$optionalParam643___0m"(i8 addrspace(1)* %context, i64 %param642) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  ret i64 48

unreachable:                                      ; No predecessors!
  ret i64 0
}

define float @"_ZN7default7Class767func641E$optionalParam645___0mm"(i8 addrspace(1)* %context, i64 %param642, i64 %optionalParam643) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  ret float -1.050000e+02

unreachable:                                      ; No predecessors!
  ret float 0.000000e+00
}

define i8 addrspace(1)* @"_ZN7default7Class764initE$optionalParam911___0u"(i8 addrspace(1)* %context, %Unit.Type* %namedParam910) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %0 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIdE.init"(i64 1)
  ret i8 addrspace(1)* %0

unreachable:                                      ; No predecessors!
  ret i8 addrspace(1)* null
}

define i8 addrspace(1)* @_ZN7default7Class764initEu6Optiond(%Unit.Type* %namedParam910, i8 addrspace(1)* %optionalParam911) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %caseVar948 = alloca i16
  %if.value30 = alloca i8 addrspace(1)*
  %x = alloca float
  %if.value26 = alloca float
  %if.value22 = alloca i8 addrspace(1)*
  %var924 = alloca %Tuple3_u6Option10Aggregate8jE
  %callRet21 = alloca %Tuple3_u6Option10Aggregate8jE
  %newVar-compiler = alloca %record._ZN7default10Aggregate8E
  %if.value17 = alloca i8 addrspace(1)*
  %var486 = alloca i8
  %var438 = alloca %record._ZN7default7default12Aggregate423I10Aggregate8cE
  %callRet = alloca %record._ZN7default7default12Aggregate423I10Aggregate8cE
  %var313 = alloca i1
  %var145 = alloca i1
  %if.value13 = alloca i1
  %if.value9 = alloca i1
  %if.value5 = alloca i1
  %if.value1 = alloca i1
  %var92 = alloca i1
  %if.value = alloca i1
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @_ZN7default7Class76E.objKlass)
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  br i1 false, label %if.then, label %if.else

if.then:                                          ; preds = %chirblock.body
  store i1 true, i1* %if.value
  br label %if.end

if.else:                                          ; preds = %chirblock.body
  store i1 false, i1* %if.value
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i1, i1* %if.value
  store i1 %1, i1* %var92
  br i1 true, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.end
  store i1 true, i1* %if.value1
  br label %if.end4

if.else3:                                         ; preds = %if.end
  store i1 false, i1* %if.value1
  br label %if.end4

if.end4:                                          ; preds = %if.else3, %if.then2
  %2 = load i1, i1* %if.value1
  br i1 false, label %if.then6, label %if.else7

if.then6:                                         ; preds = %if.end4
  store i1 true, i1* %if.value5
  br label %if.end8

if.else7:                                         ; preds = %if.end4
  store i1 false, i1* %if.value5
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %3 = load i1, i1* %if.value5
  br i1 false, label %if.then10, label %if.else11

if.then10:                                        ; preds = %if.end8
  store i1 true, i1* %if.value9
  br label %if.end12

if.else11:                                        ; preds = %if.end8
  store i1 false, i1* %if.value9
  br label %if.end12

if.end12:                                         ; preds = %if.else11, %if.then10
  %4 = load i1, i1* %if.value9
  br i1 false, label %if.then14, label %if.else15

if.then14:                                        ; preds = %if.end12
  store i1 true, i1* %if.value13
  br label %if.end16

if.else15:                                        ; preds = %if.end12
  store i1 false, i1* %if.value13
  br label %if.end16

if.end16:                                         ; preds = %if.else15, %if.then14
  %5 = load i1, i1* %if.value13
  store i1 %5, i1* %var145
  store i1 false, i1* %var313
  call void @_ZN7default7default12Aggregate423I10Aggregate8c4initEv(%record._ZN7default7default12Aggregate423I10Aggregate8cE* sret %callRet, i8 addrspace(1)* null)
  %6 = bitcast %record._ZN7default7default12Aggregate423I10Aggregate8cE* %var438 to i8*
  %7 = bitcast %record._ZN7default7default12Aggregate423I10Aggregate8cE* %callRet to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 %7, i64 1, i1 false)
  store i8 109, i8* %var486
  %8 = load i1, i1* %var92
  %9 = bitcast i8 addrspace(1)* %0 to %ObjLayout._ZN7default7Class76E addrspace(1)*
  %10 = getelementptr %ObjLayout._ZN7default7Class76E, %ObjLayout._ZN7default7Class76E addrspace(1)* %9, i32 0, i32 1
  store i1 %8, i1 addrspace(1)* %10
  %11 = load i1, i1* %var145
  %12 = bitcast i8 addrspace(1)* %0 to %ObjLayout._ZN7default7Class76E addrspace(1)*
  %13 = getelementptr %ObjLayout._ZN7default7Class76E, %ObjLayout._ZN7default7Class76E addrspace(1)* %12, i32 0, i32 2
  store i1 %11, i1 addrspace(1)* %13
  %14 = load i1, i1* %var313
  %15 = bitcast i8 addrspace(1)* %0 to %ObjLayout._ZN7default7Class76E addrspace(1)*
  %16 = getelementptr %ObjLayout._ZN7default7Class76E, %ObjLayout._ZN7default7Class76E addrspace(1)* %15, i32 0, i32 3
  store i1 %14, i1 addrspace(1)* %16
  %17 = bitcast i8 addrspace(1)* %0 to %ObjLayout._ZN7default7Class76E addrspace(1)*
  %18 = getelementptr %ObjLayout._ZN7default7Class76E, %ObjLayout._ZN7default7Class76E addrspace(1)* %17, i32 0, i32 4
  %19 = bitcast %record._ZN7default7default12Aggregate423I10Aggregate8cE addrspace(1)* %18 to i8 addrspace(1)*
  %20 = bitcast %record._ZN7default7default12Aggregate423I10Aggregate8cE* %var438 to i8*
  call void @llvm.memcpy.p1i8.p0i8.i64(i8 addrspace(1)* align 1 %19, i8* align 1 %20, i64 1, i1 false)
  %21 = load i8, i8* %var486
  %22 = bitcast i8 addrspace(1)* %0 to %ObjLayout._ZN7default7Class76E addrspace(1)*
  %23 = getelementptr %ObjLayout._ZN7default7Class76E, %ObjLayout._ZN7default7Class76E addrspace(1)* %22, i32 0, i32 5
  store i8 %21, i8 addrspace(1)* %23
  %24 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E$Some1.init"(i64 0, %record._ZN7default10Aggregate8E* @_ZN7default6var354E)
  br i1 false, label %if.then18, label %if.else19

if.then18:                                        ; preds = %if.end16
  store %record._ZN7default10Aggregate8E zeroinitializer, %record._ZN7default10Aggregate8E* %newVar-compiler
  %25 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E$Some1.init"(i64 0, %record._ZN7default10Aggregate8E* %newVar-compiler)
  store i8 addrspace(1)* %25, i8 addrspace(1)** %if.value17
  br label %if.end20

if.else19:                                        ; preds = %if.end16
  %26 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionI10Aggregate8E.init"(i64 1)
  store i8 addrspace(1)* %26, i8 addrspace(1)** %if.value17
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %if.then18
  %27 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value17
  call void @Tuple3_u6Option10Aggregate8jE(%Tuple3_u6Option10Aggregate8jE* sret %callRet21, %Unit.Type* @Unit.Val, i8 addrspace(1)* %27, i32 174)
  %28 = bitcast %Tuple3_u6Option10Aggregate8jE* %var924 to i8*
  %29 = bitcast %Tuple3_u6Option10Aggregate8jE* %callRet21 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %28, i8* align 8 %29, i64 24, i1 false)
  %30 = load i1, i1* @_ZN7default6var568E
  br i1 %30, label %if.then23, label %if.else24

if.then23:                                        ; preds = %if.end20
  %31 = call i8 addrspace(1)* @"_ZN7default12core$FS$core6OptionIfE.init"(i64 1)
  store i8 addrspace(1)* %31, i8 addrspace(1)** %if.value22
  br label %if.end25

if.else24:                                        ; preds = %if.end20
  %32 = load i8 addrspace(1)*, i8 addrspace(1)** @_ZN7default6var935IfE
  store i8 addrspace(1)* %32, i8 addrspace(1)** %if.value22
  br label %if.end25

if.end25:                                         ; preds = %if.else24, %if.then23
  %33 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value22
  %34 = bitcast i8 addrspace(1)* %33 to %"ObjLayout._ZN7default12core$FS$core6OptionIfE" addrspace(1)*
  %35 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIfE", %"ObjLayout._ZN7default12core$FS$core6OptionIfE" addrspace(1)* %34, i32 0, i32 1
  %36 = load i64, i64 addrspace(1)* %35
  %icmpeq = icmp eq i64 %36, 0
  br i1 %icmpeq, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end25
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end25
  %conv = phi i1 [ false, %if.end25 ], [ true, %land.rhs ]
  br i1 %conv, label %if.then27, label %if.else28

if.then27:                                        ; preds = %land.end
  %37 = bitcast i8 addrspace(1)* %33 to %"ObjLayout._ZN7default12core$FS$core6OptionIfE$Some1" addrspace(1)*
  %38 = getelementptr %"ObjLayout._ZN7default12core$FS$core6OptionIfE$Some1", %"ObjLayout._ZN7default12core$FS$core6OptionIfE$Some1" addrspace(1)* %37, i32 0, i32 1
  %39 = load float, float addrspace(1)* %38
  store float %39, float* %x
  %40 = load float, float* %x
  store float %40, float* %if.value26
  br label %if.end29

if.else28:                                        ; preds = %land.end
  %41 = load float, float* @_ZN7default7Class766var938E
  store float %41, float* %if.value26
  br label %if.end29

if.end29:                                         ; preds = %if.else28, %if.then27
  %42 = load float, float* %if.value26
  br i1 false, label %if.then31, label %if.else32

if.then31:                                        ; preds = %if.end29
  store i16 0, i16* %caseVar948
  %43 = call i8 addrspace(1)* @_ZN7default7Class764initEv()
  store i8 addrspace(1)* %43, i8 addrspace(1)** %if.value30
  br label %if.end33

if.else32:                                        ; preds = %if.end29
  %44 = load i8 addrspace(1)*, i8 addrspace(1)** @_ZN7default6var268E
  store i8 addrspace(1)* %44, i8 addrspace(1)** %if.value30
  br label %if.end33

if.end33:                                         ; preds = %if.else32, %if.then31
  %45 = load i8 addrspace(1)*, i8 addrspace(1)** %if.value30
  ret i8 addrspace(1)* %0

unreachable:                                      ; No predecessors!
  ret i8 addrspace(1)* null
}

define i8 addrspace(1)* @_ZN7default8CrcCheck4initEll(i64 %buffer_n, i64 %crc_n) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %__auto_v_145 = alloca i64
  %__auto_v_144 = alloca i64
  %__auto_v_143 = alloca i64
  %__auto_v_142 = alloca i64
  %__auto_v_141 = alloca i64
  %__auto_v_138 = alloca i64
  %__auto_v_137 = alloca i64
  %__auto_v_136 = alloca i64
  %__auto_v_135 = alloca i64
  %__auto_v_134 = alloca i64
  %__auto_v_133 = alloca i64
  %__auto_v_132 = alloca i64
  %__auto_v_131 = alloca i64
  %__auto_v_130 = alloca i64
  %__auto_v_127 = alloca i64
  %__auto_v_126 = alloca i64
  %__auto_v_125 = alloca i64
  %__auto_v_124 = alloca i64
  %__auto_v_123 = alloca i64
  %__auto_v_122 = alloca i64
  %__auto_v_121 = alloca i64
  %__auto_v_120 = alloca i64
  %__auto_v_119 = alloca i64
  %__auto_v_118 = alloca i64
  %__auto_v_117 = alloca i64
  %__auto_v_116 = alloca i64
  %__auto_v_115 = alloca i64
  %__auto_v_114 = alloca i64
  %__auto_v_113 = alloca i64
  %__auto_v_112 = alloca i64
  %__auto_v_111 = alloca i64
  %__auto_v_108 = alloca i64
  %__auto_v_107 = alloca i64
  %__auto_v_106 = alloca i64
  %__auto_v_105 = alloca i64
  %__auto_v_104 = alloca i64
  %__auto_v_103 = alloca i64
  %__auto_v_102 = alloca i64
  %__auto_v_101 = alloca i64
  %__auto_v_100 = alloca i64
  %__auto_v_99 = alloca i64
  %__auto_v_98 = alloca i64
  %__auto_v_97 = alloca i64
  %__auto_v_96 = alloca i64
  %__auto_v_95 = alloca i64
  %__auto_v_94 = alloca i64
  %__auto_v_93 = alloca i64
  %__auto_v_92 = alloca i64
  %__auto_v_91 = alloca i64
  %__auto_v_90 = alloca i64
  %__auto_v_89 = alloca i64
  %__auto_v_88 = alloca i64
  %__auto_v_87 = alloca i64
  %__auto_v_86 = alloca i64
  %__auto_v_85 = alloca i64
  %__auto_v_84 = alloca i64
  %__auto_v_83 = alloca i64
  %__auto_v_82 = alloca i64
  %__auto_v_81 = alloca i64
  %__auto_v_80 = alloca i64
  %__auto_v_79 = alloca i64
  %__auto_v_78 = alloca i64
  %__auto_v_77 = alloca i64
  %__auto_v_76 = alloca i64
  %0 = call i8 addrspace(1)* @gc.malloc.class(%KlassInfo* @_ZN7default8CrcCheckE.objKlass)
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  %1 = bitcast i8 addrspace(1)* %0 to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %2 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %1, i32 0, i32 5
  store i64 0, i64 addrspace(1)* %2
  %3 = bitcast i8 addrspace(1)* %0 to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %4 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %3, i32 0, i32 6
  store i64 0, i64 addrspace(1)* %4
  %5 = bitcast i8 addrspace(1)* %0 to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %6 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %5, i32 0, i32 6
  %7 = load i64, i64 addrspace(1)* %6
  %arr.alloc.size.valid = icmp sgt i64 %7, 0
  br i1 %arr.alloc.size.valid, label %arr.alloc.body, label %arr.alloc.empty

arr.alloc.empty:                                  ; preds = %chirblock.body
  br label %arr.alloc.body

arr.alloc.body:                                   ; preds = %arr.alloc.empty, %chirblock.body
  %arr.size = phi i64 [ %7, %chirblock.body ], [ 0, %arr.alloc.empty ]
  %8 = trunc i64 %arr.size to i32
  %9 = call i8 addrspace(1)* @gc.malloc.array(i32 %8, %KlassInfo* @Int64.arrayKlass)
  %10 = bitcast i8 addrspace(1)* %9 to %ArrayLayout.Int64 addrspace(1)*
  %11 = bitcast i8 addrspace(1)* %0 to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %12 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %11, i32 0, i32 3
  call void @llvm.gcwrite.cj(i8 addrspace(1)* %9, i8 addrspace(1)* %0, i8 addrspace(1)* addrspace(1)* %12)
  %arr.alloc.size.valid3 = icmp sgt i64 %buffer_n, 0
  br i1 %arr.alloc.size.valid3, label %arr.alloc.body2, label %arr.alloc.empty1

arr.alloc.empty1:                                 ; preds = %arr.alloc.body
  br label %arr.alloc.body2

arr.alloc.body2:                                  ; preds = %arr.alloc.empty1, %arr.alloc.body
  %arr.size4 = phi i64 [ %buffer_n, %arr.alloc.body ], [ 0, %arr.alloc.empty1 ]
  %13 = trunc i64 %arr.size4 to i32
  %14 = call i8 addrspace(1)* @gc.malloc.array(i32 %13, %KlassInfo* @Int64.arrayKlass)
  %15 = bitcast i8 addrspace(1)* %14 to %ArrayLayout.Int64 addrspace(1)*
  %16 = bitcast i8 addrspace(1)* %0 to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %17 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %16, i32 0, i32 1
  call void @llvm.gcwrite.cj(i8 addrspace(1)* %14, i8 addrspace(1)* %0, i8 addrspace(1)* addrspace(1)* %17)
  %add = add i64 %crc_n, 1
  %18 = bitcast i8 addrspace(1)* %0 to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %19 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %18, i32 0, i32 4
  store i64 %add, i64 addrspace(1)* %19
  %20 = bitcast i8 addrspace(1)* %0 to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %21 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %20, i32 0, i32 4
  %22 = load i64, i64 addrspace(1)* %21
  %arr.alloc.size.valid7 = icmp sgt i64 %22, 0
  br i1 %arr.alloc.size.valid7, label %arr.alloc.body6, label %arr.alloc.empty5

arr.alloc.empty5:                                 ; preds = %arr.alloc.body2
  br label %arr.alloc.body6

arr.alloc.body6:                                  ; preds = %arr.alloc.empty5, %arr.alloc.body2
  %arr.size8 = phi i64 [ %22, %arr.alloc.body2 ], [ 0, %arr.alloc.empty5 ]
  %23 = trunc i64 %arr.size8 to i32
  %24 = call i8 addrspace(1)* @gc.malloc.array(i32 %23, %KlassInfo* @Int64.arrayKlass)
  %25 = bitcast i8 addrspace(1)* %24 to %ArrayLayout.Int64 addrspace(1)*
  %26 = bitcast i8 addrspace(1)* %0 to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %27 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %26, i32 0, i32 2
  call void @llvm.gcwrite.cj(i8 addrspace(1)* %24, i8 addrspace(1)* %0, i8 addrspace(1)* addrspace(1)* %27)
  %icmpeq = icmp eq i64 %crc_n, 32
  br i1 %icmpeq, label %if.then, label %if.else

if.then:                                          ; preds = %arr.alloc.body6
  store i64 1, i64* %__auto_v_76
  store i64 0, i64* %__auto_v_77
  store i64 0, i64* %__auto_v_78
  store i64 0, i64* %__auto_v_79
  store i64 0, i64* %__auto_v_80
  store i64 0, i64* %__auto_v_81
  store i64 1, i64* %__auto_v_82
  store i64 0, i64* %__auto_v_83
  store i64 0, i64* %__auto_v_84
  store i64 1, i64* %__auto_v_85
  store i64 1, i64* %__auto_v_86
  store i64 0, i64* %__auto_v_87
  store i64 0, i64* %__auto_v_88
  store i64 0, i64* %__auto_v_89
  store i64 0, i64* %__auto_v_90
  store i64 0, i64* %__auto_v_91
  store i64 1, i64* %__auto_v_92
  store i64 0, i64* %__auto_v_93
  store i64 0, i64* %__auto_v_94
  store i64 0, i64* %__auto_v_95
  store i64 1, i64* %__auto_v_96
  store i64 1, i64* %__auto_v_97
  store i64 1, i64* %__auto_v_98
  store i64 0, i64* %__auto_v_99
  store i64 1, i64* %__auto_v_100
  store i64 1, i64* %__auto_v_101
  store i64 0, i64* %__auto_v_102
  store i64 1, i64* %__auto_v_103
  store i64 0, i64* %__auto_v_104
  store i64 0, i64* %__auto_v_105
  store i64 1, i64* %__auto_v_106
  store i64 1, i64* %__auto_v_107
  store i64 1, i64* %__auto_v_108
  %28 = load i64, i64* %__auto_v_76
  %29 = load i64, i64* %__auto_v_77
  %30 = load i64, i64* %__auto_v_78
  %31 = load i64, i64* %__auto_v_79
  %32 = load i64, i64* %__auto_v_80
  %33 = load i64, i64* %__auto_v_81
  %34 = load i64, i64* %__auto_v_82
  %35 = load i64, i64* %__auto_v_83
  %36 = load i64, i64* %__auto_v_84
  %37 = load i64, i64* %__auto_v_85
  %38 = load i64, i64* %__auto_v_86
  %39 = load i64, i64* %__auto_v_87
  %40 = load i64, i64* %__auto_v_88
  %41 = load i64, i64* %__auto_v_89
  %42 = load i64, i64* %__auto_v_90
  %43 = load i64, i64* %__auto_v_91
  %44 = load i64, i64* %__auto_v_92
  %45 = load i64, i64* %__auto_v_93
  %46 = load i64, i64* %__auto_v_94
  %47 = load i64, i64* %__auto_v_95
  %48 = load i64, i64* %__auto_v_96
  %49 = load i64, i64* %__auto_v_97
  %50 = load i64, i64* %__auto_v_98
  %51 = load i64, i64* %__auto_v_99
  %52 = load i64, i64* %__auto_v_100
  %53 = load i64, i64* %__auto_v_101
  %54 = load i64, i64* %__auto_v_102
  %55 = load i64, i64* %__auto_v_103
  %56 = load i64, i64* %__auto_v_104
  %57 = load i64, i64* %__auto_v_105
  %58 = load i64, i64* %__auto_v_106
  %59 = load i64, i64* %__auto_v_107
  %60 = load i64, i64* %__auto_v_108
  %61 = call i8 addrspace(1)* @gc.malloc.array(i32 33, %KlassInfo* @Int64.arrayKlass)
  %62 = bitcast i8 addrspace(1)* %61 to %ArrayLayout.Int64 addrspace(1)*
  %arr.index.0 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 0
  store i64 %28, i64 addrspace(1)* %arr.index.0
  %arr.index.1 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 1
  store i64 %29, i64 addrspace(1)* %arr.index.1
  %arr.index.2 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 2
  store i64 %30, i64 addrspace(1)* %arr.index.2
  %arr.index.3 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 3
  store i64 %31, i64 addrspace(1)* %arr.index.3
  %arr.index.4 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 4
  store i64 %32, i64 addrspace(1)* %arr.index.4
  %arr.index.5 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 5
  store i64 %33, i64 addrspace(1)* %arr.index.5
  %arr.index.6 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 6
  store i64 %34, i64 addrspace(1)* %arr.index.6
  %arr.index.7 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 7
  store i64 %35, i64 addrspace(1)* %arr.index.7
  %arr.index.8 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 8
  store i64 %36, i64 addrspace(1)* %arr.index.8
  %arr.index.9 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 9
  store i64 %37, i64 addrspace(1)* %arr.index.9
  %arr.index.10 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 10
  store i64 %38, i64 addrspace(1)* %arr.index.10
  %arr.index.11 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 11
  store i64 %39, i64 addrspace(1)* %arr.index.11
  %arr.index.12 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 12
  store i64 %40, i64 addrspace(1)* %arr.index.12
  %arr.index.13 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 13
  store i64 %41, i64 addrspace(1)* %arr.index.13
  %arr.index.14 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 14
  store i64 %42, i64 addrspace(1)* %arr.index.14
  %arr.index.15 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 15
  store i64 %43, i64 addrspace(1)* %arr.index.15
  %arr.index.16 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 16
  store i64 %44, i64 addrspace(1)* %arr.index.16
  %arr.index.17 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 17
  store i64 %45, i64 addrspace(1)* %arr.index.17
  %arr.index.18 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 18
  store i64 %46, i64 addrspace(1)* %arr.index.18
  %arr.index.19 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 19
  store i64 %47, i64 addrspace(1)* %arr.index.19
  %arr.index.20 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 20
  store i64 %48, i64 addrspace(1)* %arr.index.20
  %arr.index.21 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 21
  store i64 %49, i64 addrspace(1)* %arr.index.21
  %arr.index.22 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 22
  store i64 %50, i64 addrspace(1)* %arr.index.22
  %arr.index.23 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 23
  store i64 %51, i64 addrspace(1)* %arr.index.23
  %arr.index.24 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 24
  store i64 %52, i64 addrspace(1)* %arr.index.24
  %arr.index.25 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 25
  store i64 %53, i64 addrspace(1)* %arr.index.25
  %arr.index.26 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 26
  store i64 %54, i64 addrspace(1)* %arr.index.26
  %arr.index.27 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 27
  store i64 %55, i64 addrspace(1)* %arr.index.27
  %arr.index.28 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 28
  store i64 %56, i64 addrspace(1)* %arr.index.28
  %arr.index.29 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 29
  store i64 %57, i64 addrspace(1)* %arr.index.29
  %arr.index.30 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 30
  store i64 %58, i64 addrspace(1)* %arr.index.30
  %arr.index.31 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 31
  store i64 %59, i64 addrspace(1)* %arr.index.31
  %arr.index.32 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %62, i32 0, i32 1, i32 32
  store i64 %60, i64 addrspace(1)* %arr.index.32
  %63 = bitcast i8 addrspace(1)* %0 to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %64 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %63, i32 0, i32 2
  call void @llvm.gcwrite.cj(i8 addrspace(1)* %61, i8 addrspace(1)* %0, i8 addrspace(1)* addrspace(1)* %64)
  br label %if.end49

if.else:                                          ; preds = %arr.alloc.body6
  %icmpeq10 = icmp eq i64 %crc_n, 16
  br i1 %icmpeq10, label %if.then11, label %if.else29

if.then11:                                        ; preds = %if.else
  store i64 1, i64* %__auto_v_111
  store i64 1, i64* %__auto_v_112
  store i64 0, i64* %__auto_v_113
  store i64 0, i64* %__auto_v_114
  store i64 0, i64* %__auto_v_115
  store i64 0, i64* %__auto_v_116
  store i64 0, i64* %__auto_v_117
  store i64 0, i64* %__auto_v_118
  store i64 0, i64* %__auto_v_119
  store i64 0, i64* %__auto_v_120
  store i64 0, i64* %__auto_v_121
  store i64 0, i64* %__auto_v_122
  store i64 0, i64* %__auto_v_123
  store i64 0, i64* %__auto_v_124
  store i64 1, i64* %__auto_v_125
  store i64 0, i64* %__auto_v_126
  store i64 1, i64* %__auto_v_127
  %65 = load i64, i64* %__auto_v_111
  %66 = load i64, i64* %__auto_v_112
  %67 = load i64, i64* %__auto_v_113
  %68 = load i64, i64* %__auto_v_114
  %69 = load i64, i64* %__auto_v_115
  %70 = load i64, i64* %__auto_v_116
  %71 = load i64, i64* %__auto_v_117
  %72 = load i64, i64* %__auto_v_118
  %73 = load i64, i64* %__auto_v_119
  %74 = load i64, i64* %__auto_v_120
  %75 = load i64, i64* %__auto_v_121
  %76 = load i64, i64* %__auto_v_122
  %77 = load i64, i64* %__auto_v_123
  %78 = load i64, i64* %__auto_v_124
  %79 = load i64, i64* %__auto_v_125
  %80 = load i64, i64* %__auto_v_126
  %81 = load i64, i64* %__auto_v_127
  %82 = call i8 addrspace(1)* @gc.malloc.array(i32 17, %KlassInfo* @Int64.arrayKlass)
  %83 = bitcast i8 addrspace(1)* %82 to %ArrayLayout.Int64 addrspace(1)*
  %arr.index.012 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %83, i32 0, i32 1, i32 0
  store i64 %65, i64 addrspace(1)* %arr.index.012
  %arr.index.113 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %83, i32 0, i32 1, i32 1
  store i64 %66, i64 addrspace(1)* %arr.index.113
  %arr.index.214 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %83, i32 0, i32 1, i32 2
  store i64 %67, i64 addrspace(1)* %arr.index.214
  %arr.index.315 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %83, i32 0, i32 1, i32 3
  store i64 %68, i64 addrspace(1)* %arr.index.315
  %arr.index.416 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %83, i32 0, i32 1, i32 4
  store i64 %69, i64 addrspace(1)* %arr.index.416
  %arr.index.517 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %83, i32 0, i32 1, i32 5
  store i64 %70, i64 addrspace(1)* %arr.index.517
  %arr.index.618 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %83, i32 0, i32 1, i32 6
  store i64 %71, i64 addrspace(1)* %arr.index.618
  %arr.index.719 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %83, i32 0, i32 1, i32 7
  store i64 %72, i64 addrspace(1)* %arr.index.719
  %arr.index.820 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %83, i32 0, i32 1, i32 8
  store i64 %73, i64 addrspace(1)* %arr.index.820
  %arr.index.921 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %83, i32 0, i32 1, i32 9
  store i64 %74, i64 addrspace(1)* %arr.index.921
  %arr.index.1022 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %83, i32 0, i32 1, i32 10
  store i64 %75, i64 addrspace(1)* %arr.index.1022
  %arr.index.1123 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %83, i32 0, i32 1, i32 11
  store i64 %76, i64 addrspace(1)* %arr.index.1123
  %arr.index.1224 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %83, i32 0, i32 1, i32 12
  store i64 %77, i64 addrspace(1)* %arr.index.1224
  %arr.index.1325 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %83, i32 0, i32 1, i32 13
  store i64 %78, i64 addrspace(1)* %arr.index.1325
  %arr.index.1426 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %83, i32 0, i32 1, i32 14
  store i64 %79, i64 addrspace(1)* %arr.index.1426
  %arr.index.1527 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %83, i32 0, i32 1, i32 15
  store i64 %80, i64 addrspace(1)* %arr.index.1527
  %arr.index.1628 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %83, i32 0, i32 1, i32 16
  store i64 %81, i64 addrspace(1)* %arr.index.1628
  %84 = bitcast i8 addrspace(1)* %0 to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %85 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %84, i32 0, i32 2
  call void @llvm.gcwrite.cj(i8 addrspace(1)* %82, i8 addrspace(1)* %0, i8 addrspace(1)* addrspace(1)* %85)
  br label %if.end48

if.else29:                                        ; preds = %if.else
  %icmpeq31 = icmp eq i64 %crc_n, 8
  br i1 %icmpeq31, label %if.then32, label %if.else42

if.then32:                                        ; preds = %if.else29
  store i64 1, i64* %__auto_v_130
  store i64 0, i64* %__auto_v_131
  store i64 0, i64* %__auto_v_132
  store i64 0, i64* %__auto_v_133
  store i64 0, i64* %__auto_v_134
  store i64 0, i64* %__auto_v_135
  store i64 1, i64* %__auto_v_136
  store i64 1, i64* %__auto_v_137
  store i64 1, i64* %__auto_v_138
  %86 = load i64, i64* %__auto_v_130
  %87 = load i64, i64* %__auto_v_131
  %88 = load i64, i64* %__auto_v_132
  %89 = load i64, i64* %__auto_v_133
  %90 = load i64, i64* %__auto_v_134
  %91 = load i64, i64* %__auto_v_135
  %92 = load i64, i64* %__auto_v_136
  %93 = load i64, i64* %__auto_v_137
  %94 = load i64, i64* %__auto_v_138
  %95 = call i8 addrspace(1)* @gc.malloc.array(i32 9, %KlassInfo* @Int64.arrayKlass)
  %96 = bitcast i8 addrspace(1)* %95 to %ArrayLayout.Int64 addrspace(1)*
  %arr.index.033 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %96, i32 0, i32 1, i32 0
  store i64 %86, i64 addrspace(1)* %arr.index.033
  %arr.index.134 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %96, i32 0, i32 1, i32 1
  store i64 %87, i64 addrspace(1)* %arr.index.134
  %arr.index.235 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %96, i32 0, i32 1, i32 2
  store i64 %88, i64 addrspace(1)* %arr.index.235
  %arr.index.336 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %96, i32 0, i32 1, i32 3
  store i64 %89, i64 addrspace(1)* %arr.index.336
  %arr.index.437 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %96, i32 0, i32 1, i32 4
  store i64 %90, i64 addrspace(1)* %arr.index.437
  %arr.index.538 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %96, i32 0, i32 1, i32 5
  store i64 %91, i64 addrspace(1)* %arr.index.538
  %arr.index.639 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %96, i32 0, i32 1, i32 6
  store i64 %92, i64 addrspace(1)* %arr.index.639
  %arr.index.740 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %96, i32 0, i32 1, i32 7
  store i64 %93, i64 addrspace(1)* %arr.index.740
  %arr.index.841 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %96, i32 0, i32 1, i32 8
  store i64 %94, i64 addrspace(1)* %arr.index.841
  %97 = bitcast i8 addrspace(1)* %0 to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %98 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %97, i32 0, i32 2
  call void @llvm.gcwrite.cj(i8 addrspace(1)* %95, i8 addrspace(1)* %0, i8 addrspace(1)* addrspace(1)* %98)
  br label %if.end

if.else42:                                        ; preds = %if.else29
  store i64 1, i64* %__auto_v_141
  store i64 1, i64* %__auto_v_142
  store i64 0, i64* %__auto_v_143
  store i64 0, i64* %__auto_v_144
  store i64 1, i64* %__auto_v_145
  %99 = load i64, i64* %__auto_v_141
  %100 = load i64, i64* %__auto_v_142
  %101 = load i64, i64* %__auto_v_143
  %102 = load i64, i64* %__auto_v_144
  %103 = load i64, i64* %__auto_v_145
  %104 = call i8 addrspace(1)* @gc.malloc.array(i32 5, %KlassInfo* @Int64.arrayKlass)
  %105 = bitcast i8 addrspace(1)* %104 to %ArrayLayout.Int64 addrspace(1)*
  %arr.index.043 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %105, i32 0, i32 1, i32 0
  store i64 %99, i64 addrspace(1)* %arr.index.043
  %arr.index.144 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %105, i32 0, i32 1, i32 1
  store i64 %100, i64 addrspace(1)* %arr.index.144
  %arr.index.245 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %105, i32 0, i32 1, i32 2
  store i64 %101, i64 addrspace(1)* %arr.index.245
  %arr.index.346 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %105, i32 0, i32 1, i32 3
  store i64 %102, i64 addrspace(1)* %arr.index.346
  %arr.index.447 = getelementptr %ArrayLayout.Int64, %ArrayLayout.Int64 addrspace(1)* %105, i32 0, i32 1, i32 4
  store i64 %103, i64 addrspace(1)* %arr.index.447
  %106 = bitcast i8 addrspace(1)* %0 to %ObjLayout._ZN7default8CrcCheckE addrspace(1)*
  %107 = getelementptr %ObjLayout._ZN7default8CrcCheckE, %ObjLayout._ZN7default8CrcCheckE addrspace(1)* %106, i32 0, i32 2
  call void @llvm.gcwrite.cj(i8 addrspace(1)* %104, i8 addrspace(1)* %0, i8 addrspace(1)* addrspace(1)* %107)
  br label %if.end

if.end:                                           ; preds = %if.else42, %if.then32
  br label %if.end48

if.end48:                                         ; preds = %if.end, %if.then11
  br label %if.end49

if.end49:                                         ; preds = %if.end48, %if.then
  ret i8 addrspace(1)* %0

unreachable:                                      ; No predecessors!
  ret i8 addrspace(1)* null
}

declare i8 addrspace(1)* @gc.malloc.array(i32, %KlassInfo*)

define void @"_ZN7default7Class767func531E$optionalParam533___0m"(%record._ZN7default10Aggregate8E* noalias sret, i8 addrspace(1)* %context, i64 %namedParam532) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %callRet = alloca %record._ZN7default10Aggregate8E
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  call void @_ZN7default10Aggregate84initEv(%record._ZN7default10Aggregate8E* sret %callRet, i8 addrspace(1)* null)
  %1 = bitcast %record._ZN7default10Aggregate8E* %0 to i8*
  %2 = bitcast %record._ZN7default10Aggregate8E* %callRet to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 %2, i64 1, i1 false)
  ret void

unreachable:                                      ; No predecessors!
  ret void
}

define i32 @"_ZN7default7Class767func630E$optionalParam633___0hs"(i8 addrspace(1)* %context, i8 %param631, i16 %namedParam632) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  ret i32 207

unreachable:                                      ; No predecessors!
  ret i32 0
}

define i32 @"_ZN7default7Class767func630E$optionalParam635___0hsj"(i8 addrspace(1)* %context, i8 %param631, i16 %namedParam632, i32 %optionalParam633) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  ret i32 78

unreachable:                                      ; No predecessors!
  ret i32 0
}

define i1 @"_ZN7default7Class767func491E$optionalParam495___0Tuple2_t10Aggregate8Ej"(i8 addrspace(1)* %context, %Tuple2_t10Aggregate8E* %param492, i32 %optionalParam493) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %if.value1 = alloca i1
  %if.value = alloca i1
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  br i1 false, label %if.then, label %if.else

if.then:                                          ; preds = %chirblock.body
  store i1 true, i1* %if.value
  br label %if.end

if.else:                                          ; preds = %chirblock.body
  store i1 false, i1* %if.value
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %0 = load i1, i1* %if.value
  br i1 false, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.end
  store i1 true, i1* %if.value1
  br label %if.end4

if.else3:                                         ; preds = %if.end
  store i1 false, i1* %if.value1
  br label %if.end4

if.end4:                                          ; preds = %if.else3, %if.then2
  %1 = load i1, i1* %if.value1
  ret i1 %1

unreachable:                                      ; No predecessors!
  ret i1 false
}

define i16 @"_ZN7default7func281E$optionalParam282___0v"(i8 addrspace(1)* %context) gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  br label %chirblock.start

chirblock.start:                                  ; preds = %entry
  br label %chirblock.body

chirblock.body:                                   ; preds = %chirblock.start
  ret i16 231

unreachable:                                      ; No predecessors!
  ret i16 0
}

define weak_odr void @_ZN7default7default12Aggregate453IlbE(%record._ZN7default7default12Aggregate453IlbE* noalias sret, i8 %"0") comdat gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %"01" = getelementptr inbounds %record._ZN7default7default12Aggregate453IlbE, %record._ZN7default7default12Aggregate453IlbE* %0, i32 0, i32 0
  store i8 %"0", i8* %"01"
  ret void
}

declare void @MCC_ThrowException(i8 addrspace(1)*)

declare i8* @MCC_GetFuncPtrFromItab(i64*, i32, i32, i8*)

declare double @pow(double, double)

define i64 @cj_entry() gc "cangjie" personality i32 (...)* @__ccc_personality_v0 {
entry:
  %callret = alloca %Unit.Type
  invoke void @default_global_init()
          to label %try.then unwind label %try.landingpad

try.then:                                         ; preds = %entry
  %0 = invoke i64 @user.main()
          to label %try.then1 unwind label %try.landingpad

try.then1:                                        ; preds = %try.then
  ret i64 %0

try.landingpad:                                   ; preds = %try.then, %entry
  %1 = landingpad token
          catch i8* null
  %2 = call i8* @MCC_GetExceptionWrapper()
  %3 = call i8 addrspace(1)* @MCC_BeginCatch(i8* %2)
  %4 = call i1 @IsObjectInstanceOf(i8 addrspace(1)* %3, i8* bitcast (%KlassInfo* @"_ZN12core$FS$core9ThrowableE.objKlass" to i8*))
  call void @MCC_EndCatch()
  br i1 %4, label %if.then, label %if.else

if.then:                                          ; preds = %try.landingpad
  %5 = bitcast i8 addrspace(1)* %3 to %ObjLayout.Object addrspace(1)*
  %6 = getelementptr inbounds %ObjLayout.Object, %ObjLayout.Object addrspace(1)* %5, i32 0, i32 0
  %7 = load %KlassInfo*, %KlassInfo* addrspace(1)* %6
  %8 = getelementptr inbounds %KlassInfo, %KlassInfo* %7, i32 0, i32 4
  %9 = load i8**, i8*** %8
  %10 = getelementptr i8*, i8** %9, i64 3
  %11 = load i8*, i8** %10
  %12 = bitcast i8* %11 to void (%Unit.Type*, i8 addrspace(1)*)*
  call void %12(%Unit.Type* sret %callret, i8 addrspace(1)* %3)
  ret i64 1

if.else:                                          ; preds = %try.landingpad
  ret i64 255
}

declare i8* @MCC_GetExceptionWrapper()

declare i8 addrspace(1)* @MCC_BeginCatch(i8*)

declare i1 @IsObjectInstanceOf(i8 addrspace(1)*, i8*)

declare void @MCC_EndCatch()

define void @main() {
entry:
  call void @CjRuntimeInit()
  call void @CjRuntimeStart(i64 ()* @cj_entry)
  ret void
}

declare void @CjRuntimeInit()

declare void @CjRuntimeStart(i64 ()*)

attributes #0 = { "CFileKlass" }
attributes #1 = { "CFileVTable" }
attributes #2 = { "CFileITable" }
attributes #3 = { "GCRoot" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { "gc-leaf-function" }

!0 = !{!"object", !"ObjLayout._ZN7default21__Auto__Environment_6"}
!1 = !{!"object", !"ObjLayout._ZN7default7Class76E"}
!2 = !{!"object", !"ObjLayout._ZN7default8CrcCheckE"}
!3 = !{!"object", !"ObjLayout._ZN7default21__Auto__Environment_8"}
!4 = !{!"object", !"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE"}
!5 = !{!"object", !"ObjLayout._ZN7default12core$FS$core6OptionITuple2_bjEE$Some1"}
!6 = !{!"object", !"ObjLayout.Object"}
!7 = !{!"object", !"ObjLayout._ZN7default12core$FS$core6OptionIdE"}
!8 = !{!"object", !"ObjLayout._ZN7default12core$FS$core6OptionIdE$Some1"}
!9 = !{!"object", !"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E"}
!10 = !{!"object", !"ObjLayout._ZN7default12core$FS$core6OptionI7Class76E$Some1"}
!11 = !{!"object", !"ObjLayout._ZN7default12core$FS$core6OptionIfE"}
!12 = !{!"object", !"ObjLayout._ZN7default12core$FS$core6OptionIfE$Some1"}
!13 = !{!"object", !"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE"}
!14 = !{!"object", !"ObjLayout._ZN7default12core$FS$core6OptionI6OptionuE$Some1"}
!15 = !{!"object", !"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E"}
!16 = !{!"object", !"ObjLayout._ZN7default12core$FS$core6OptionI10Aggregate8E$Some1"}
!17 = !{!"object", !"ObjLayout._ZN7default12core$FS$core6OptionIbE"}
!18 = !{!"object", !"ObjLayout._ZN7default12core$FS$core6OptionIbE$Some1"}
!19 = !{!"object", !"ObjLayout._ZN7default12core$FS$core6OptionIuE"}
!20 = !{!"object", !"ObjLayout._ZN7default12core$FS$core6OptionIuE$Some1"}
!21 = !{!"interface", !"ObjLayout.Object"}
!22 = !{!"array_int64", !"ArrayLayout.Int64"}
[CodeGen Error]: Generate module error.
return code: 139
*/
