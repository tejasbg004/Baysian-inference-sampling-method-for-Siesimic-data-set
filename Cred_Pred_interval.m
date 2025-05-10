f_vmean=zeros(400,1);
varian=zeros(400,1);
SDdev=zeros(400,1);
credup=zeros(400,1);
creddown=zeros(400,1);
predup=zeros(400,1);
preddown=zeros(400,1);
for i=1:400
    f_vmean(i)=sum(f_v(:,i))/5000;
end


xposmean=sum(xpos)/400;
xposstd=0;
for i=400
    xposstd=xposstd+(xposmean-xpos(i))^2;
end

%SD
for j=1:400
    for i=1:5000
        varian(j)=varian(j)+(f_vmean(j)-f_v(i,j))^2;
    end
    varian(j)=varian(j)/(5000-1);
    SDdev(j)=sqrt(varian(j));
end
  % 95% credible and predicting intrval

  for i=1:400
      credup(i)=f_vmean(i)+1.9604*SDdev(i)*sqrt(1/5000+(xpos(i)-xposmean)^2/xposstd);
      creddown(i)=f_vmean(i)-1.9604*SDdev(i)*sqrt(1/5000+(xpos(i)-xposmean)^2/xposstd);

      predup(i)=f_vmean(i)+1.9604*SDdev(i)*sqrt(1+1/5000+(xpos(i)-xposmean)^2/xposstd);
      preddown(i)=f_vmean(i)-1.9604*SDdev(i)*sqrt(1+1/5000+(xpos(i)-xposmean)^2/xposstd);
  end
  %{
figure(1)
plot(xpos(1:3),f_vmean(1:3))
hold on
plot(xpos(1:3),creddown((1:3)))
plot(xpos(1:3),credup(1:3))
hold off
figure(2)
plot(xpos(1:3),f_vmean(1:3))
hold on
plot(xpos(1:3),preddown(1:3))
plot(xpos(1:3),predup(1:3))
hold off
  %}
figure(1)
plot(xpos,f_vmean)

hold on
plot(xpos,credup)
plot(xpos,creddown)

plot(xpos,preddown)
plot(xpos,predup)
hold off
xlabel('position')
ylabel('predicted displacement from posteriori distribution' )
legend('Mean of the ensemble','Credidible Interval Upperlimit','Credidible Interval Lowerlimit','Predictive interval lowerlimt','Predictive interval upperlimt')
title('Plot of Credible and predictive intervals')
hold off

figure(2)
plot(xpos,f_vmean)
xlabel('position')
ylabel('predicted displacement from posteriori distribution' )
title('Mean plot of the ensemble at each position')