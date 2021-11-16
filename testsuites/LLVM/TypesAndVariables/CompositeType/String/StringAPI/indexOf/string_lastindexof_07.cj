// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s: String = "indexOf Test"
    var ch1: Char = 'f'
    var i5: Int64 = s.lastIndexOf(ch1, 0) ?? -1
    var i6: Int64 = s.lastIndexOf(ch1, 1) ?? -1
    var i7: Int64 = s.lastIndexOf(ch1, 6) ?? -1
    var i8: Int64 = s.lastIndexOf(ch1, 7) ?? -1
    var i9: Int64 = s.lastIndexOf(ch1, s.size()-2) ?? -1
    var i10: Int64 = s.lastIndexOf(ch1, s.size()-1) ?? -1
    var i11: Int64 = s.lastIndexOf(ch1, s.size()) ?? -1
    var i12: Int64 = s.lastIndexOf(ch1, s.size()+1) ?? -1
    var i13: Int64 = s.lastIndexOf(ch1, 9223372036854775805) ?? -1
    var i14: Int64 = s.lastIndexOf(ch1, 9223372036854775806) ?? -1
    var i15: Int64 = s.lastIndexOf(ch1, 9223372036854775807) ?? -1

    print("s = " + s + "\n")
    print("lastIndexOf('f', 0)=" + Int32(i5).toString() + "\n")
    print("lastIndexOf('f', 1)=" + Int32(i6).toString() + "\n")
    print("lastIndexOf('f', 6)=" + Int32(i7).toString() + "\n")
    print("lastIndexOf('f', 7)=" + Int32(i8).toString() + "\n")
    print("lastIndexOf('f', 10)=" + Int32(i9).toString() + "\n")
    print("lastIndexOf('f', 11)=" + Int32(i10).toString() + "\n")
    print("lastIndexOf('f', 12)=" + Int32(i11).toString() + "\n")
    print("lastIndexOf('f', 13)=" + Int32(i12).toString() + "\n")
    print("lastIndexOf('f', 18446744073709551613)=" + Int32(i13).toString() + "\n")
    print("lastIndexOf('f', 18446744073709551614)=" + Int32(i14).toString() + "\n")
    print("lastIndexOf('f', 18446744073709551615)=" + Int32(i15).toString() + "\n")

    if (i5 == 6 && i6 == 6 && i7 == 6 && i8 == -1 && i9 == -1 && i10 == -1 && i11 == -1 && i12 == -1 && i13 == -1 && i14 == -1 && i15 == -1){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
