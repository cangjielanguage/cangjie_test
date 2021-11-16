// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o a.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o b.%middle
// EXEC-PIPE-1: %compiler %cmp_opt a.%middle b.%middle %f -o %output 2>&1 | compare %f

//catelog:# 包和模块管理## 包### 包的导入#### 导入多个包--8
package p0
import p1.foo // EXPECTED: regex-not error
import p2.foo // EXPECTED: regex-not error

func main(): Int64 {
    var a2 = foo // EXPECTED: regex erro.*there occurs type ambiguity about class_decl func_decl on imported declaration 'foo'
    var a3 = p1.foo() // EXPECTED: regex-not error
    var a4 = p2.foo() // EXPECTED: regex-not error
    return 0
}