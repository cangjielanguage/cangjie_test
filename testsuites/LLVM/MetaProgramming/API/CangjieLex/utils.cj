from ast import ast.*

external func check(a:Tokens,b:Tokens){
    if (a.size() != b.size() + 1) { // a have END
        print("ERROR: size not equal!")
        a.dump()
        b.dump()
        return 1
    }
    for (i in 0..b.size()) {
        var res_a = a[i]
        var res_b = b[i]
        var x = res_a
        var y = res_b
        let xk = x.kind
        let yk = y.kind
        var res =  xk == yk && x.value == y.value
        if (!res) {
            print("ERROR: token not equal!")
            x.dump()
            y.dump()
            return 1
        }
    }
    return 0
}
