function D = obtemD(anos)
    D = [eye(11,11);-1*ones(1,11)];
    if anos>1
        for i=2:anos
            D = [D;[eye(11,11);-1*ones(1,11)]];
        end
    end
end

