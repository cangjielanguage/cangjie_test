// DEPENDENCE: ../src ../module.json
// EXEC: cpm clean
// EXEC: cpm build

import tools.*

func main() {
  let a = tools.Add(1,2)
  print("hello world! ${a}")
}