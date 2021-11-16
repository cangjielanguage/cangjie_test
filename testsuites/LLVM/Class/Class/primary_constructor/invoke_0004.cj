// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

open class Data{
  Data(var a!: Bool = false){

  }
}

open class Data2 <: Data{}
open class Data3 <: Data2{}
open class Data4 <: Data3{}
open class Data5 <: Data4{}
open class Data6 <: Data5{}
open class Data7 <: Data6{}
open class Data8 <: Data7{}
open class Data9 <: Data8{}
open class Data10 <: Data9{}
open class Data11 <: Data10{}
open class Data12 <: Data11{
	Data12(var aa!: Data = Data()){

	}
}

func main(): Int64 {
  var a: Data12 = Data12()
  if(a.aa.a){
    return 1
  }
  return 0
}

