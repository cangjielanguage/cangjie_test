// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A cast's range must use the destination signedness before a subsequent widening cast.
// EXEC: %compiler %enableO2 %f -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %compiler %enableO2 %disableConstPropagation %f -o %output.range
// EXEC: %run %run_opt %output.range %run_args
// EXEC: %compiler %enableO2 %disableConstPropagation --int-overflow wrapping %f -o %output.wrap
// EXEC: %run %run_opt %output.wrap %run_args
// EXEC: %compiler %enableO2 %disableConstPropagation --int-overflow saturating %f -o %output.sat
// EXEC: %run %run_opt %output.sat %run_args

func sourceValue(): Int64 { 65417 }
func byteValue(): Int64 { 255 }
func wordValue(): Int64 { 65535 }
func dwordValue(): Int64 { 4294967295 }

@OverflowWrapping
func signedNarrowing(): Int64 {
    return Int64(Int8(UInt16(wordValue())))
}

@OverflowWrapping
func unsignedNarrowing(): Int64 {
    return Int64(UInt8(Int16(-1)))
}

@OverflowSaturating
func saturatedSigned(): Int64 {
    return Int64(Int8(UInt16(wordValue())))
}

@OverflowSaturating
func saturatedUnsigned(): Int64 {
    return Int64(UInt8(Int16(-1)))
}

main(): Int64 {
    // Original reproducer: this used to fold to -119 after inlining.
    if (Int64(UInt16(sourceValue())) != 65417) { return 1 }

    // Set the source sign bit, including the highest representable unsigned value.
    let u8 = UInt8(byteValue())
    if (Int16(u8) != 255 || Int32(u8) != 255 || Int64(u8) != 255) { return 2 }
    if (Int16(UInt8(128)) != 128 || Int64(UInt8(128)) != 128) { return 3 }
    let u16 = UInt16(wordValue())
    if (Int32(u16) != 65535 || Int64(u16) != 65535) { return 4 }
    if (Int32(UInt16(32768)) != 32768 || Int64(UInt16(32768)) != 32768) { return 5 }
    let u32 = UInt32(dwordValue())
    if (Int64(u32) != 4294967295 || Int64(UInt32(2147483648)) != 2147483648) { return 6 }

    // Keep the unsigned interpretation through more than one widening operation.
    if (Int64(UInt32(UInt16(u8))) != 255) { return 7 }
    if (Int64(UInt64(u16)) != 65535 || UInt64(u32) != 4294967295) { return 8 }
    if (Int64(u16) + 1 != 65536 || Int64(u32) < 0) { return 9 }

    // The opposite conversion direction must retain a signed destination too.
    if (Int64(Int16(UInt8(127))) != 127 || UInt64(Int64(UInt32(2147483647))) != 2147483647) {
        return 10
    }
    if (signedNarrowing() != -1 || unsignedNarrowing() != 255) { return 11 }
    if (saturatedSigned() != 127 || saturatedUnsigned() != 0) { return 12 }
    return 0
}
