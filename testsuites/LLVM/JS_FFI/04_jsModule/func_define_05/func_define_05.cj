// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

// 形参默认值，使用js中的值
@JsModule["./momentModule"]
foreign func moment1(a!: Int64 = 0) : String

unsafe func main() {
  if(moment1() == "1" && moment1(a: 2) == "2"){
    return 0;
  }
  return 1;
}