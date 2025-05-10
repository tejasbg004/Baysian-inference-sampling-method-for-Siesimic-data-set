%MCMC
Loopstep=1000000;%calculated based on trial and error
initial=[45.2525,18.686,35.5557];% Calculated from the argmin value of sum(vi-fi)^2

x_0=initial;
%Sig=[0.26, 0, 0 ;0 ,0.48 ,0 ;0 ,0 ,0.47 ]; 
Sig=[0.20, -0.1, 0.1 ;-0.1 ,0.56 ,-0.1 ;0.1 ,-0.1 ,0.8 ];%%Calculated from the optimal Acceptance ratio

SSq_prev=0;
            for l=1:200
                SSq_prev=SSq_prev+(vdat(l,2)-(x_0(1)/pi)*atan((vdat(l,1)-x_0(2))/x_0(3)))^2;
            end
x_0=zeros(3,1);
x_0(:,1)=initial;
accept=0;
for ii=2:Loopstep
    yi_1=mvnrnd(x_0(:,ii-1),Sig,1);
    SSq=0;
    for l=1:200
        SSq=SSq+(vdat(l,2)-(yi_1(1)/pi)*atan((vdat(l,1)-yi_1(2))/yi_1(3)))^2;
    end
    alpha=exp(-(SSq-SSq_prev)/2);%%q(x/y) and q(y/x) cancels as they are symmetric distribution
    U=unifrnd(0,1);
    if U<alpha
        x_0(:,ii)=yi_1;
        accept=accept+1;
        SSq_prev=SSq;
    else
        x_0(:,ii)=x_0(:,ii-1);
        
    end
end
acceptanceratio=accept/Loopstep;
disp(acceptanceratio)

figure(1)
plot(x_0(1,:)')
xlabel('No of Iterations/Time step','FontSize',20)
ylabel('Value of the parameter V0','FontSize',20)
title('Marginal path of the parameter V0','FontSize',20)

figure(2)
plot(x_0(2,:)')
xlabel('No of Iterations/Time step','FontSize',20)
ylabel('Value of the parameter X0','FontSize',20)
title('Marginal path of the parameter X0','FontSize',20)

figure(3)
plot(x_0(3,:)')
xlabel('No of Iterations/Time step','FontSize',20)
ylabel('Value of the parameter D','FontSize',20)
title('Marginal path of the parameter D','FontSize',20)
