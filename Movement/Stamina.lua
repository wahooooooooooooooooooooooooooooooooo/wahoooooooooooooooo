for i, v in next, getgc(true) do
    if typeof(v) == 'table' and rawget(v, 'GetMaxStamina') then
        c = hookfunction(v.SetStamina, function(...) end)
    end
end
