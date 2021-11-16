// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o p2.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

//catelog:# 包和模块管理## 包### 包的导入#### 导入多个包--8
package p0
import p1.foo
import p2.foo as foo

func main(): Int64 {
    var a2 = foo.f
    if ( a2 != 12 ){
        return 1
    }
    return 0
}
