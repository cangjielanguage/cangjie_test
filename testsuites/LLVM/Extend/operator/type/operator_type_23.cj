// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() : Int64 {
    var a:?Int64 = Some(1)

    if ( !(a == 'a')){  // EXPECTED: regex invalid binary operator '==' on type 'Enum-Option<Int64>' and 'Char'
        return 1
    }
    if ( a == 'b' ){  // EXPECTED: regex invalid binary operator '==' on type 'Enum-Option<Int64>' and 'Char'
        return 2
    }
    return 0
}

extend ?Int64 { // error: extend type cannot use '?Type' sugar
    operator func ==(right:Char):Bool  {
        if (right == 'a') {
            return true
        }else{
            return false
        }
    }
}
