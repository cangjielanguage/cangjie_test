// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func main(): Int64 {
    var map01 = #{'a':Option<Int32>.Some(100),'c':Option<Int32>.Some(1),'b':Option<Int32>.Some(50)}
    var map02 = #{'a':Option<Int32>.Some(100),'b':Option<Int32>.Some(50),'c':Option<Int32>.Some(1)}
    if (map01 == map02){// EXPECTED: regex error.*?invalid binary operator '==' on type 'Class-Map<Char, Enum-Option<Int32>>' and 'Class-Map<Char, Enum-Option<Int32>>'
        return 0
    }
    return 1
}
