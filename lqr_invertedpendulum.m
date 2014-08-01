clear all
close all
clc
g=9.81;
l=1;
c=2;
global K;
%System parameters and LQR parameters
A=[0 1;(g/l) 0];
B=[0;-1];
Q=[1 0;0 0];
R=1/(c^2);
%Calculating the gain matrix, K using lqr
[K,S,e]=lqr(A,B,Q,R)

%initial and final time setting for solution of diff eqn
tspan=[0 5];
%initial conditions of theta and angular velocity
initial=[0.4 , .7];

%The differential equation is solved in the loop so as to get the
%updated states as the input U=K*x is applied.


for time=1:375
            
    [t,x]=ode45(@invertedpendulum,tspan,initial);
    
end

%plotting 
for j=1:80

subplot(2,2,2)
plot(t(j),x(j,2),'*')
axis([-2 4 -2 2]);
title('angular velocity (theta) vs time');
hold on
grid on
subplot(2,2,1)
plot(t(j),x(j,1),'*')
axis([-2 4 -2 2]);
title('vertical angle (theta) vs time');

hold on
grid on

end
