// DEPENDENCE: ../src ../cfg-ast
// EXEC:%compiler -g %cmp_opt -c src/pkgs1/pkg1.cj  -o pkgs1.%middle
// EXEC:%compiler -g %cmp_opt -c src/pkgs2/pkg2.cj  -o pkgs2.%middle
// EXEC:%compiler -g %cmp_opt -c src/pkgs1/pkgs101/pkg101.cj -o pkgs101.%middle
// EXEC:%compiler -g %cmp_opt -c src/pkgs1/pkgs101/pkgs102/pkg102.cj -o pkgs102.%middle
// EXEC:%compiler -g %cmp_opt -c src/pkgs1/pkgs101/pkgs102/pkgs103/pkg103.cj -o pkgs103.%middle
// EXEC:%compiler -g %cmp_opt -c src/pkgs1/pkgs101/pkgs102/pkgs103/pkgs104/pkg104.cj -o pkgs104.%middle
// EXEC:%compiler -g %cmp_opt -c src/pkgs1/pkgs101/pkgs102/pkgs103/pkgs104/pkgs105/pkg105.cj -o pkgs105.%middle
// EXEC:%compiler -g %cmp_opt %n.cj pkgs1.%middle pkgs2.%middle pkgs101.%middle pkgs102.%middle pkgs103.%middle pkgs104.%middle pkgs105.%middle -o %output | compare %f





import  pkgs1.varpkg1
import  pkgs2.varpkg2
import  pkgs1.pkgs101.fun101
import  pkgs1.pkgs101.pkgs102.fun102
import  pkgs1.pkgs101.pkgs102.pkgs103.fun103
import  pkgs1.pkgs101.pkgs102.pkgs103.pkgs104.fun104
import  pkgs1.pkgs101.pkgs102.pkgs103.pkgs104.pkgs105.fun105

func main(): Int64 {
    let test1: Int64 = varpkg1
    let test2: Int64 = varpkg2
    var Functioncall101: Int64 = fun101() //单行中只有一个调用 ,无入参： Functioncall101=20
    var Functioncall102: Int32 = fun102(2, 1) //单行中只有一个调用 ,双入参 Functioncall102=2
    var Functioncall103: Int16 = fun103(2) //单行中只有一个调用 ,单入参/ Functioncall103=2
    var Functioncall104: Int32 = fun104(2, b: 2) //命名形参 Functioncall104=4
    var Functioncall1041: Int32 = fun104(2) //可选形参  Functioncall1041=3
    var Functioncall105: Int32 = fun105(5) //函数递归/ Functioncall105=15
    return 1
}


// ASSERT:scan  26: call pkgs1/pkgs101
// ASSERT:scan  27: call pkgs1/pkgs101/pkgs102
// ASSERT:scan  28: call pkgs1/pkgs101/pkgs102/pkgs103
// ASSERT:scan  29: call pkgs1/pkgs101/pkgs102/pkgs103/pkgs104
// ASSERT:scan  30: call pkgs1/pkgs101/pkgs102/pkgs103/pkgs104
// ASSERT:scan  31: call pkgs1/pkgs101/pkgs102/pkgs103/pkgs104/pkgs105
// ASSERT:scan-not  7: