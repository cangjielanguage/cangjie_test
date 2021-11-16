// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


//  e = #{1: "Aa", 2: "Bb", 3: "Cc"}    B103 不支持map类型

func foo_char(): Int64 {
    var res1 = true ? 'a' : 'b'
    var res2 = false ? 'a' : 'b'
    if res1 == 'a' && res2 == 'b' {
        return 0
    }
    return 1
}

func foo_string(): Int64 {
    var res1 = true ? "a" : "b"
    var res2 = false ? "1" : "2"
    if res1 == "a" && res2 == "2" {
        return 0
    }
    return 1
}

func foo_bool(): Int64 {
    var res1 = true ? false : true
    var res2 = false ? false : true
    if !res1 && res2 {
        return 0
    }
    return 1
}

func foo_unit(): Int64 {
    var x: Unit = ()
    var res1 = true ? x : x
    var res2 = false ? x : x
    if res1 == () && res2 -= () {
        return 0
    }
    return 1
}



func foo_range(): Int64 {
    var res1 = 1...4: 1
    var res2 = 1...4: 2
    if res1 != res2 {
        return 0
    }
    return 1
}
/**
func foo_array(): Int64{
    var res1 = true ? @{1,2,3} : @{1,2,3}
    var res2 = true ? @{2,3,4} : @{1,2,3}
    if res1 && res2 {
        return 0
    }
    return 1
}
*/



func main():Int64{
    return foo_char() + foo_string() + foo_bool() + foo_unit() + foo_range()
}
