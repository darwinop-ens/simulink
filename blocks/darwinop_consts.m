function consts = darwinop_consts

    try
        if ispref('darwinoplib','consts')
            pref = getpref('darwinoplib','consts');
            if strcmp(pref,'darwinop_consts')
                consts = darwinop_consts_en;
            else
                consts = eval(pref);
            end
        else
            consts = darwinop_consts_en;
        end
    catch
        consts = darwinop_consts_en;
    end 

end
