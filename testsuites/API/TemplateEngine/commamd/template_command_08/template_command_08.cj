//DEPENDENCE:../%n
//EXEC: %tool_path/engine %n/Mb.tpl %n/Mb1.tpl| compare %f
//ASSERT: scan  IllegalArgumentException Currently, only one template file can be processed at a time!
