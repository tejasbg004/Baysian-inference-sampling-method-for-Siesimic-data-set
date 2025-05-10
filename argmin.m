%argmin
v0=linspace(0,80,100);
x0=linspace(-50,50,100);
D=linspace(0,80,100);
v=zeros(100,100,100);
for i=1:100
    for j=1:100
        for k=1:100
            v(i,j,k)=0;
            for l=1:200
                v(i,j,k)=v(i,j,k)+(vdat(l,2)-(v0(i)/pi)*atan((vdat(l,1)-x0(j))/D(k)))^2;
            end
        end
    end
end