clear;
%% number of particles
first=input('Enter your first name: ','s');
last=input('Enter your last name: ','s');
ON = uint8(first);
EP = uint8(last);
N_1 = sum(ON);
N_2 = sum(EP);
if N_1<N_2
    l=N_1/N_2;
else
    l=N_2/N_1;
end
fprintf('l= %d\n',l);
N = N_1 + N_2;
%% variables
t=100000;
dt=[1:t]';
A=rand(t,1);
Na=zeros(t,1);
Nb=zeros(t,1);
%% simulation
tic
for i=1:t
    if A(i,1) < N_1/N
        N_1=N_1-1;
        N_2=N_2+1;
    else
        N_1=N_1+1;
        N_2=N_2-1;
    end
    Na(i,1)=N_1;
    Nb(i,1)=N_2;
end
%% Graph
plot(dt,Na,'k.');
xlabel('Time');
ylabel('Nano-particles in box A');
legend('box A');
toc
fprintf('Program run on ryzen 3 3200U\n');