// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func main(): Int64 {

    var b:Int64=4
    var c:String=""
    let arrayTest = Array<Int32>([0, 1, 2])

    try {
        let lastElement = arrayTest[3]
    } catch (_) {
        var a1 = Array<String>(["catch an exception!"]) 
        c = a1[0]
        print(c)
    }
    if(c == "catch an exception!"){
        return 0;
    }
    return 1;
}
