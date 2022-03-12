clear all; 
close all;
clc;

%%  Alínea a)
dz=0.01;
dx=0.1;

%Perfil do feixe para valores de z: 
z=0:dz:4;

%Definir x:
x=-51.2:dx:51.1;

%Gaussiana do tipo: q(0,x)=exp(-x^2/2)
q0=exp(-(x.^2)/2);

Nz=length(z);
Nx=length(x);

dk=2*pi/(Nx*dx);

k=-Nx*dk/2:dk:(Nx/2-1)*dk;

q=zeros(Nz,Nx);

q(1,:)=q0;

qt0=fftshift(fft(q0));

for l=2:Nz   
    qt=qt0.*exp(-1i*(k.^2)*z(l)/2);
    q(l,:)=ifft(ifftshift(qt));
end

mesh(x,z,(abs(q)));

