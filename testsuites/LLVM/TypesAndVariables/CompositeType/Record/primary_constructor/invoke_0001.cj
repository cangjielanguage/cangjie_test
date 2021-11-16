// EXEC-PIPE-1: %compiler %cmp_opt -c %f 2>&1 | compare %f

record Data { // EXPECTED: regex value type recursive detected: 'Data->Data'
  Data(){

  }
  var b = Data() 

}

record Data2 { // EXPECTED: regex value type recursive detected: 'Data2->Data2'
  var b = Data2() 
}



func run(): Int64 {
  var value = Data()
  return 0
}

func main(): Int64 {
  return run()
}

