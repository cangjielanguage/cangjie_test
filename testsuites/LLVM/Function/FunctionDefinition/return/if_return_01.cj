// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( foo01() != () ) {
        return 1
    }
    if ( foo02() != () ) {
        return 1
    }
    if ( foo03() != () ) {
        return 1
    }
    if ( foo04() != 1 ) {
        return 1
    }
    return 0
}

// 函数体最后一个表达式的类型，T0为一个没有else的if表达式，即unit
func foo01(){
    if(true){
        1
    }
}

// 函数体最后一个表达式的类型，T0为一个声明，即unit
func foo02(){
    var a = if(true){
        1
    }
}

// 函数体最后一个表达式的类型，T0为是没有else的if表达式是unit，实际return返回(),T0和T1相同，正确
func foo03(){
    if(true){
        return ()
    }
}

// 函数体最后一个表达式的类型，T0为return 1表达式，为bottom，实际return 1中1为int64，最小公共父类为int64
func foo04(){
    return 1
}

