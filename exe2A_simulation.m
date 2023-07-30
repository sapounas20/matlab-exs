clear;
%% number of particles
N=input('Select number of nanoparticles (700,12.000,130.000): ');
%% variables
N1=N;
t=100000;
dt=[1:t]';
A=rand(t,1);
Na=zeros(t,1);
%% simulation
tic
for i=1:t
    if A(i,1) < N1/N
        N1=N1-1;
    else
        N1=N1+1;
    end
    Na(i,1)=N1;
end
Nth=(N/2)*(1+exp(-2*dt./N));
%% Graph
plot(dt,Na,'k.',dt,Nth,'b-','LineWidth',2);
xlabel('Time');
ylabel('Nano-particles in box A');
legend('Simulation','Theoritical');
toc
fprintf('Program run on ryzen 3 3200U\n');
