// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


// for循环自动调用对象的iterator()方法
func getLongString(): String{
    var str: String = "仓颉"
    var count = 1
    while (count < 1000){
        if(count%2 == 0) {
            str = str + "仓颉"
        } else {
            str = str + "Cangjie"
        }
        count = count + 1
    }
    str = str + "end"
    str
}


func main():Int64 {
    var c1: Char = '仓'
    var c2: Char = 'C'
    var c3: Char = 'a'
    for (i in "仓颉") {
        c1 = i
    }
    for (i in "Cangjie") {
        c2 = i
    }
    for (i in getLongString()) {
        c3 = i
    }

    if (c1 == '颉' && c2 == 'e' && c3 == 'd') {
        return 0
    }
    return 1
}
