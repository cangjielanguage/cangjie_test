// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan pass1
// ASSERT: scan pass2
// ASSERT: scan-not Exception

from ffi import c.*

@c
record teststruct {
    var ptrbool: CPointer<Bool>
    var ptrchar: CPointer<Char>
    var ptri8: CPointer<Int8>
    var ptrui8: CPointer<UInt8>
    var ptri16: CPointer<Int16>
    var ptrui16: CPointer<UInt16>
    var ptri32: CPointer<Int32>
    var ptrui32: CPointer<UInt32>
    var ptri64: CPointer<Int64>
    var ptrui64: CPointer<UInt64>
    var ptrf32: CPointer<Float32>
    var ptrf64: CPointer<Float64>
}

foreign func testfunc1():teststruct

foreign func testfunc2(st: teststruct):Int8

unsafe func main():Int64 {
    var count: Int8 = 0
    var struct1 = testfunc1()

    if ( (struct1.ptrbool.read(0) == true) && (struct1.ptrbool.read(1) == false) && (struct1.ptrbool.read(2) == true) ){
        count+=1
    }
    if ( (struct1.ptrchar.read(0) == 'a') && (struct1.ptrchar.read(1) == 'b') && (struct1.ptrchar.read(2) == 'c') ){
        count+=1
    }

    if ( (struct1.ptri8.read(0) == -128) && (struct1.ptri8.read(1) == 123) && (struct1.ptri8.read(2) == 127) ){
        count+=1
    }

    if ( (struct1.ptrui8.read(0) == 0) && (struct1.ptrui8.read(1) == 2) && (struct1.ptrui8.read(2) == 255) ){
        count+=1
    }

    if ( (struct1.ptri16.read(0) == -32768) && (struct1.ptri16.read(1) == 0) && (struct1.ptri16.read(2) == 32767) ){
        count+=1
    }

    if ( (struct1.ptrui16.read(0) == 0) && (struct1.ptrui16.read(1) == 2) && (struct1.ptrui16.read(2) == 65535) ){
        count+=1
    }

    if ( (struct1.ptri32.read(0) == -2147483648) && (struct1.ptri32.read(1) == 0) && (struct1.ptri32.read(2) == 2147483647) ){
        count+=1
    }

    if ( (struct1.ptrui32.read(0) == 0) && (struct1.ptrui32.read(1) == 2) && (struct1.ptrui32.read(2) == 4294967295) ){
        count+=1
    }

    if ( (struct1.ptri64.read(0) == -9223372036854775808) && (struct1.ptri64.read(1) == 0) && (struct1.ptri64.read(2) == 9223372036854775807) ){
        count+=1
    }

    if ( (struct1.ptrui64.read(0) == 0) && (struct1.ptrui64.read(1) == 2) && (struct1.ptrui64.read(2) == 18446744073709551615) ){
        count+=1
    }

    if ( (struct1.ptrf32.read(0) == 3.14) && (struct1.ptrf32.read(1) == 0.0) && (struct1.ptrf32.read(2) == -3.14) ){
        count+=1
    }

    if ( (struct1.ptrf64.read(0) == 3.1415926) && (struct1.ptrf64.read(1) == 0.0) && (struct1.ptrf64.read(2) == -3.1415926) ){
        count+=1
    }

    if (count == 12){
        print("pass1\n")
    }

    struct1.ptrbool.write(0, false)
    struct1.ptrchar.write(0, 'd')    
    struct1.ptri8.write(0, -127)
    struct1.ptrui8.write(0, 1)
    struct1.ptri16.write(0, -32767)
    struct1.ptrui16.write(0, 1)
    struct1.ptri32.write(0, -2147483647)
    struct1.ptrui32.write(0, 1)
    struct1.ptri64.write(0, -9223372036854775807)
    struct1.ptrui64.write(0, 1)
    struct1.ptrf32.write(0, 3.24)
    struct1.ptrf64.write(0, 3.2415926)
    
    testfunc2(struct1)

    return 0
}
