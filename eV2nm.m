%Sapounas Antonios%
%AEM 15172%
%exe1.4%
%eV to nm and reverse converter%
clear;
h=4.1357e-15;
c=3e8;
FLAG=false;
while ~FLAG
x=input('Please insert the unit you want to convert (choose between eV or nm):  ','s');
    if x=='eV'
     FLAG=true;
    E=input('Insert the value in eV  ');
    l=h*c/E;
    ln=l*10^9;
    fprintf('The wavelenght is %d nm \n',ln)
elseif x=='nm'
    FLAG=true;
    ln=input('Insert the value in nm  ');
    l=ln*10^-9;
    E=h*c/l;
    fprintf('The energy is %d eV \n',E)
    else
     FLAG= false;
     fprintf('Error! Make sure to type eV or nm \n')
 end
end