// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

from std import unicode.*

func run(): Int64 {
        
    var s1: String = ""
    var s2: String = "\t\n\r\f"
    var s3: String = "sdfsd"
    var s4: String = "仓颉编程测试"
    var s5: String = "\n\b\t\b测试\b45\b\t\t\n\r\ftsaddf345a"
    let s6 = "\u{fffe}"
    let s7 = "A\u{fffe}bc1\u{fffe}23仓\u{fffe}颉\t\u{fffe}\n\b"
    
    if (s1.isBlank() !=true || s2.isBlank() !=true || s3.isBlank() != false)
    {
        return 1
    }
    if (s4.isBlank() != false ||s5.isBlank() !=false ||s6.isBlank() !=false ||s7.isBlank() !=false)
    {
        return 1
    }
    
return 0
}

func main(): Int64 {
    return run()
}