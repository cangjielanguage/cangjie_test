// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( case01() != 0 ){
        return 1
    }
    if ( case02() != 0 ){
        return 2
    }
    return 0
}

func case01(){
    var a = """
    abc"""
    var b ="""
abc"""
    if ( "${a}" != "    abc") {
        return 1
    }
    if ( "${b}" != "abc") {
        return 1
    }
    return 0
}

func case02(){
    var a = #"\n    abc"#
    var b = #"abc"#
    if ( "${a}" != "\\n    abc") {
        return 1
    }
    if ( "${b}" != "abc") {
        return 1
    }
    return 0
}