// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {

    //无入参：Functioncall001=30
    var Functioncall001: Int8 = funcbp001()

    //external函数被调用,无入参：： Functioncall002=30
    var Functioncall002: Int16 = funcbp002()

    //单入参： Functioncall003=2
    var Functioncall003: Int32 = funcbp003(2)

    //双入参： Functioncall004=2
    var Functioncall004: Int64 = funcbp004(2,1)

    //命名形参： Functioncall005=4
    var Functioncall005: UInt8 = funcbp005(2, b: 2)

    //可选形参： Functioncall006=3
    var Functioncall006: UInt16 = funcbp006(2)

    //return： Functioncall007=
    //var Functioncall007: Unit = funcbp007(10, 20)

    //函数体第1行:变量初始化行： Functioncall008=30
    var Functioncall008: UInt32 = funcbp008(10, 20)

    //函数体第1行:return行： Functioncall009=30
    var Functioncall009: UInt64 = funcbp009(10, 20)

    //函数体第1行:函数定义行： Functioncall010=60
    var Functioncall010: Int64 = funcbp010(10, 20)

    //函数重载: Functioncall011=30 Functioncall011_1=20
    var Functioncall011: Int64 = funcbp011(10)
    var Functioncall011_1: Int64 = funcbp011(10, 10)

    //lambda表达式-函数断点不生效
    let f1: (Int64, Int64)->Int64 = {a: Int64, b: Int64 => a + b}
    var lamdba001: Int64 = f1(10, 10)

    //闭尾包：Functioncall012=1
    var Functioncall012: Int64 = funcbp012(1, { i => i * i })

    //函数嵌套: Functioncall013=20
    var Functioncall013: Int64 = funcbp013(10)

    //函数调用: Functioncall014=30
    var Functioncall014: Int64 = funcbp014()

    var var_rt: Int64 = 20
    return var_rt

}

func funcbp001(): Int8 {
    var a: Int8 = 10
    var b: Int8 = 20
    return a + b
}

external func funcbp002(): Int16 {
    var a: Int16 = 10
    var b: Int16 = 20
    return a + b
}

func funcbp003(a: Int32): Int32 {
    if (a >= 1) {
        return a
    } else {
        return 0
    }
}

func funcbp004(a: Int64, b: Int64): Int64 {
    if (a >= b) {
        return a
    } else {
        return b
    }
}


func funcbp005(a: UInt8, b!: UInt8 = 1): UInt8 {
    var a1: UInt8 = a
    var b1: UInt8 = b
    return a1 + b1
}

func funcbp006(a: UInt16, b!: UInt16 = 1): UInt16 {
    var a1: UInt16 = a
    var b1: UInt16 = b
    return a1 + b1
}

// func funcbp007(a: Int32, b: Int32): Unit {
//     if (a >= b) {
//         return
//     } else {
//         return
//     }
// }

func funcbp008(a: UInt32, b: UInt32 ): UInt32 {
    var a1: UInt32
    a1 = a
    return a1 + b
}
func funcbp009(a: UInt64, b: UInt64 ): UInt64 {
    return a + b
}

func funcbp010(a: Int64, b: Int64 ): Int64 {
    func funcbp010_1(a: Int64, b: Int64 ): Int64 {
        var a1: Int64 = a
        var b1: Int64 = b
        return a1 + b1
    }
    var Functioncall010_1: Int64 = funcbp010_1(a, b)
    return a + b + Functioncall010_1
}

func funcbp011(a: Int64 ): Int64 {
    return a + 20
}


func funcbp011(a: Int64, b: Int64 ): Int64 {
    return a + b
}

func funcbp012(a: Int64, fn: (Int64)->Int64) { fn(a) }

func funcbp013(a: Int64): Int64 {
    func funcbp013_1(a: Int64): Int64 {
        func funcbp013_2(a: Int64): Int64 {
            func funcbp013_3(a: Int64): Int64 {
                func funcbp013_4(a: Int64): Int64 {
                    var a5: Int64 = 10
                    return a5 + a
                }
                var a4: Int64 = funcbp013_4(a)
                return a4
            }
            var a3: Int64 = funcbp013_3(a)
            return a3 
        }
        var a2: Int64 = funcbp013_2(a)
        return a2
    }
    var a1: Int64 = funcbp013_1(a)
    return  a1
}

func funcbp014(): Int64 {
    var a: Int64 = funcbp015()
    return a 
}
func funcbp015(): Int64 {
    var a: Int64 = 10
    var b: Int64 = 20
    return a + b 
}

// ASSERT:scan  6: call default.funcbp001:a;
// ASSERT:scan  58: newobj default.funcbp001_a_Context
// ASSERT:scan  9: call default.funcbp002:s;
// ASSERT:scan  64: newobj default.funcbp002_s_Context
// ASSERT:scan  12: call default.funcbp003:i;i;
// ASSERT:scan  70: newobj default.funcbp003_i_i_Context
// ASSERT:scan  70: jgez
// ASSERT:scan  15: call default.funcbp004:l;l;l;
// ASSERT:scan  78: newobj default.funcbp004_l_l_l_Context
// ASSERT:scan  81: jgez
// ASSERT:scan  18: call default.funcbp005:h;h;h;
// ASSERT:scan  87: newobj default.funcbp005_h_h_h_Context
// ASSERT:scan  21: call default.funcbp006:t;t;t;
// ASSERT:scan  93: newobj default.funcbp006_t_t_t_Context
// ASSERT:scan  27: call default.funcbp008:j;j;j;
// ASSERT:scan  108: newobj default.funcbp008_j_j_j_Context
// ASSERT:scan  30: call default.funcbp009:m;m;m;
// ASSERT:scan  112: newobj default.funcbp009_m_m_m_Context
// ASSERT:scan  33: call default.funcbp010:l;l;l;
// ASSERT:scan  116: newobj default.funcbp010_l_l_l_Context
// ASSERT:scan  36: call default.funcbp011:l;l;
// ASSERT:scan  126: newobj default.funcbp011_l_l_Context
// ASSERT:scan  37: call default.funcbp011:l;l;l;
// ASSERT:scan  131: newobj default.funcbp011_l_l_l_Context
// ASSERT:scan  40: newobj default
// ASSERT:scan  41: call.virt lambda
// ASSERT:scan  44: newobj default.main
// ASSERT:scan  44: call default.funcbp012
// ASSERT:scan  134: newobj default.funcbp012
// ASSERT:scan  47: call default.funcbp013:l;l;
// ASSERT:scan  137: newobj default.funcbp013_l_l_Context
// ASSERT:scan  153: call.virt
// ASSERT:scan  50: call default.funcbp014:l;
// ASSERT:scan  158: newobj default.funcbp014_l_Context
// ASSERT:scan  158: call default.funcbp015:l;
// ASSERT:scan  162: newobj default.funcbp015_l_Context