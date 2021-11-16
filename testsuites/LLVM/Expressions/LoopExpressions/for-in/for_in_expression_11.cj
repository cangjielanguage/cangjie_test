// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case01() != 20 ) {
        return 1
    }
    if ( case02() != 20 ) {
        return 2
    }
    return 0
}

func case01(){
    func x(input:Int64):Int64{input*2}
    var s: Int64 = 5
    let arr: ArrayList<Int64> = ArrayList<Int64>(s,x)
    var a: Int64 = 0
    for (item in arr) {
        a = a + item
    }
    a
}

func case02(){
    func x(input:Int64):Int64{input*2}
    var s: Int64 = 5
    let arr: ArrayList<Int64> = ArrayList<Int64>(s,x)
    var a: Int64 = 0
    let it = arr.iterator()
    while (true) {
        match (it.next()) {
            case $None => break
            case Some(v) => match (v) {
                case w  =>  a = a + w
                case _ =>  continue
            }
        }
    }
    a
}
