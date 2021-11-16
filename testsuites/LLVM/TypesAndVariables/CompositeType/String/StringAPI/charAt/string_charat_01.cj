// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s1: String = "hello char lang"
    var s2 = "hello char lang \n\r"
    var s3 = "hello char lang \u{5324}"
    var s4 = s1.substring(0, 6)
    var s5 = s1.substring(0, 7)
    var s6 = "    "

    var i1: Char = s1.charAt(14)
    var i2: Char = s2.charAt(16)
    var i3: Char = s3.charAt(16)
    var i4: Char = s4.charAt(5)
    var i5: Char = s5.charAt(6)
    var i6: Char = s6.charAt(3)
    var i7: Char = "hello Char lang".charAt(14)

    print("s1 = " + s1 + "\n")
    print("s1.charAt() = " + i1.toString() + "\n")
    print("s2 = " + s2 + "\n")
    print("s2.charAt() = " + i2.toString() + "\n")
    print("s3 = " + s3 + "\n")
    print("s3.charAt() = " + i3.toString() + "\n")
    print("s4 = " + s4 + "\n")
    print("s4.charAt() = " + i4.toString() + "\n")
    print("s5 = " + s5 + "\n")
    print("s5.charAt() = " + i5.toString() + "\n")
    print("s6 = [" + s6 + "]" + "\n")
    print("s6.charAt() = " + i6.toString() + "\n")
    print("\"hello Char lang\".charAt() = " + i7.toString()  + "\n")

    if (i1 == 'g' && i2 == '\n' && i3 == '\u{5324}' && i4 == ' ' && i5 == 'c' && i6 == ' ' && i7 == 'g'){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
