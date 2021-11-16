// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import macro define.*
from ast import ast.*

enum E{e}

func x(input:Int64){input}

class A{}

@M func test<T>(b:T,a!:Int64=1):T where T <: A{
    func foo<T>(input:T):T{input}
    var x = { input:T => input}
    {b}
    var c = 1
    c = 2
    var my_x = x ~> x
    c = c |> my_x
    true&&true
    true||true
    a|a
    a^a
    a&a
    a+a-a*a/a%a**a
    !true
    -a
    c++
    c--
    a>>a
    a<<a
    a<a
    a<=a
    a>a
    a>=a
    a==a
    a!=a
    x(1)
    var d = [a]
    d[0]
    var f = (a,a)
    f[0]
    if (true) {a} else {a}

    var e = E.e
    match (e){
        case $e if (false) => 0
        case x : Int64 => 1
        case _ => 2
    }
    match (1){
        case $a => 1
        case _ => 0
    }
    while (false) {a}
    do{()} while (false)
    for (i in 0..10) {
        print("${a}")
        if (false) {
            continue
        } else {
            break
        }
    }
    quote(1)
    quote(1)
    chr(1)
    ord('1')
    return b
}

func main(){
    return test()
}