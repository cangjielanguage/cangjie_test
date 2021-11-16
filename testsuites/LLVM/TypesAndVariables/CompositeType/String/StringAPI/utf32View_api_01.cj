// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a = "0Aa !~\n".utf32View
    var b = a.iterator()
    if ( a.size() != 7 ){
        return 2
    }
    if ( a.isEmpty() ){
        return 3
    }
    var r2 = foo(b.next())
    if ( r2 != 48 ){
        return 4
    }
    if ( foo(b.next()) != 65 ){
        return 5
    }
    var r3 = a.iterator()
    if ( foo(r3.next()) != 48 ){
        return 6
    }
    return 0
}

func foo(x:Option<UInt32>){
    var a = match(x){
        case Some(v) => v
        case None => 1000
    }
    return a
}
