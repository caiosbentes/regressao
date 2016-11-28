function T = minimos( tamanho, n )
    T = ones(tamanho, 1);
    T(1:tamanho,2)= 1:tamanho;
    if n>1
        for i=2:n
            T(1:tamanho,i+1)= (T(:,2)).^i;
        end
    end
end

