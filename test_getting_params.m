load("untitled1_ert_rtw/codeInfo.mat")

N = length(codeInfo.Parameters);
struct_array = repmat(struct('name','empty', 'type','empty'), N, 1);

fid=fopen('params.json','w');

for i = 1:length(codeInfo.Parameters)
    codeInfo.Parameters(1,i).GraphicalName;
    codeInfo.Parameters(1,i).Type.BaseType.Name;
    type = 'float';
    if(matches(codeInfo.Parameters(1,i).Type.BaseType.Name, 'double'))
        type = 'float';
    else
        type='bool';
    end
    
    struct_array(i).name = codeInfo.Parameters(1,i).GraphicalName;
    struct_array(i).type = type;
end

fprintf(fid, jsonencode(struct_array, PrettyPrint=true)); 
fclose('all'); 
