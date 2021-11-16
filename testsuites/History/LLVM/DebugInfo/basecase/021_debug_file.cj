// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {
    //变量初始化
    var file1_num: Int64

    //函数名处
    file1_num = demofile3_001()
    return file1_num
}


func demofile3_001(): Int64 {
    var a: Int64 = demofile3_002()
    return a
}
func demofile3_002(): Int64 {
    var a: Int64 = demofile3_003()
    return a
}
func demofile3_003(): Int64 {
    var a: Int64 = demofile3_004()
    return a
}
func demofile3_004(): Int64 {
    var a: Int64 = demofile3_005()
    return a
}
func demofile3_005(): Int64 {
    var a: Int64 = demofile3_006()
    return a
}
func demofile3_006(): Int64 {
    var a: Int64 = demofile3_007()
    return a
}
func demofile3_007(): Int64 {
    var a: Int64 = demofile3_008()
    return a
}
func demofile3_008(): Int64 {
    var a: Int64 = demofile3_009()
    return a
}
func demofile3_009(): Int64 {
    var a: Int64 = demofile3_010()
    return a
}

func demofile3_010(): Int64 {
    var a: Int64 = demofile3_011()
    return a
}
func demofile3_011(): Int64 {
    var a: Int64 = demofile3_012()
    return a
}
func demofile3_012(): Int64 {
    var a: Int64 = demofile3_013()
    return a
}
func demofile3_013(): Int64 {
    var a: Int64 = demofile3_014()
    return a
}
func demofile3_014(): Int64 {
    var a: Int64 = demofile3_015()
    return a
}
func demofile3_015(): Int64 {
    var a: Int64 = demofile3_016()
    return a
}
func demofile3_016(): Int64 {
    var a: Int64 = demofile3_017()
    return a
}
func demofile3_017(): Int64 {
    var a: Int64 = demofile3_018()
    return a
}
func demofile3_018(): Int64 {
    var a: Int64 = demofile3_019()
    return a
}
func demofile3_019(): Int64 {
    var a: Int64 = demofile3_020()
    return a
}

func demofile3_020(): Int64 {
    var a: Int64 = 10
    var b: Int64 = 20
    return a + b
}

// ASSERT:scan  8: call default.demofile3_001:l;
// ASSERT:scan  14: newobj default.demofile3_001_l_Context
// ASSERT:scan  14: call default.demofile3_002:l;
// ASSERT:scan  18: newobj default.demofile3_002_l_Context
// ASSERT:scan  18: call default.demofile3_003:l;
// ASSERT:scan  22: newobj default.demofile3_003_l_Context
// ASSERT:scan  22: call default.demofile3_004:l;
// ASSERT:scan  26: newobj default.demofile3_004_l_Context
// ASSERT:scan  26: call default.demofile3_005:l;
// ASSERT:scan  30: newobj default.demofile3_005_l_Context
// ASSERT:scan  30: call default.demofile3_006:l;
// ASSERT:scan  34: newobj default.demofile3_006_l_Context
// ASSERT:scan  34: call default.demofile3_007:l;
// ASSERT:scan  38: newobj default.demofile3_007_l_Context
// ASSERT:scan  38: call default.demofile3_008:l;
// ASSERT:scan  42: newobj default.demofile3_008_l_Context
// ASSERT:scan  42: call default.demofile3_009:l;
// ASSERT:scan  46: newobj default.demofile3_009_l_Context
// ASSERT:scan  46: call default.demofile3_010:l;
// ASSERT:scan  51: newobj default.demofile3_010_l_Context
// ASSERT:scan  51: call default.demofile3_011:l;
// ASSERT:scan  55: newobj default.demofile3_011_l_Context
// ASSERT:scan  55: call default.demofile3_012:l;
// ASSERT:scan  59: newobj default.demofile3_012_l_Context
// ASSERT:scan  59: call default.demofile3_013:l;
// ASSERT:scan  63: newobj default.demofile3_013_l_Context
// ASSERT:scan  63: call default.demofile3_014:l;
// ASSERT:scan  67: newobj default.demofile3_014_l_Context
// ASSERT:scan  67: call default.demofile3_015:l;
// ASSERT:scan  71: newobj default.demofile3_015_l_Context
// ASSERT:scan  71: call default.demofile3_016:l;
// ASSERT:scan  75: newobj default.demofile3_016_l_Context
// ASSERT:scan  75: call default.demofile3_017:l;
// ASSERT:scan  79: newobj default.demofile3_017_l_Context
// ASSERT:scan  79: call default.demofile3_018:l;
// ASSERT:scan  83: newobj default.demofile3_018_l_Context
// ASSERT:scan  83: call default.demofile3_019:l;
// ASSERT:scan  87: newobj default.demofile3_019_l_Context
// ASSERT:scan  87: call default.demofile3_020:l;
// ASSERT:scan  92: newobj default.demofile3_020_l_Context