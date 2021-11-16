// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() : Int64 {
    var a:Int8 = 1

    if ( !(a == 'a')){
        return 1
    }
    if ( a == 'b' ){
        return 2
    }
    return 0
}

extend Int8 {
    redef operator func ==(right:Char):Bool { //error: 'redef' modifier is illegal for function declaration in extend body
        if (right == 'a') {
            return true
        }else{
            return false
        }
    }
}