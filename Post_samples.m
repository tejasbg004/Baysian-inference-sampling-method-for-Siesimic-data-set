[m,n]=size(x_0);
xpos=linspace(-100,100,400);
f_v=zeros(5000,1);

for j=1:400
    for i=1:5000
        id=randsample(n,1);
        sam=x_0(:,id);
        f_v(i,j)=(sam(1)/pi)*atan((xpos(j)-sam(2))/sam(3));
    end
end


