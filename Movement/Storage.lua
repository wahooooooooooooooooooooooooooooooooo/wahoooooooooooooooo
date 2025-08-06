for i , v in pairs(getgc(true)) do
    if type(v) == "table" and rawget(v,"SpaceTaken") then
       v.SpaceTaken = 0;
    end;
end;