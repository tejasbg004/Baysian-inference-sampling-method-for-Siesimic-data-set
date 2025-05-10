min=v(1,1,1);
for i=1:100
    for j=1:100
        for k=1:100
            if i==1 && j==1 && k==1
                continue;
            end
            if v(i,j,k)<min
                min=v(i,j,k);
                I=i;
                J=j;
                K=k;
            end
        end
    end
end


disp(v0(I));
disp(x0(J));
disp(D(K))