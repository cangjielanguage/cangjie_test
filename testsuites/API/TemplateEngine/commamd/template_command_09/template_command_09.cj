//DEPENDENCE:../%n
//EXEC: %tool_path/engine %n/ | compare %f
//ASSERT: scan  IllegalArgumentException The command must contain template names and must be separated by spaces!
