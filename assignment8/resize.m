%function resize will take a file name of an image and a positive number
%as input arguments and scale the image by the number using nearest neighbour,
%bilinear, and bicubic interpolations

function resize(ImageName,Scalar)

%read specified image file and convert to double between 0 and 255
A=imread(ImageName);
A=double(A)/255;

% determine size of the image
[h1,w1]=size(A);

%determines the number of new rows and new columns 
%where the minimum new image size is 1x1
h2=ceil(h1*Scalar); 
w2=ceil(w1*Scalar);
    
%determine coordinates(indices) of original image pixels
[x,y]=meshgrid(1:h1,1:w1);
    
%divide the original image with the new image size
xx=linspace(1,h1,h2);
yy=linspace(1,w1,w2);
    
%determine coordinates of query points
[xnew,ynew]=meshgrid(xx,yy);
    
%nearest neighbour interpolation
B=interp2(x,y,A,xnew,ynew,'nearest'); 
    
%linear interpolation
C=interp2(x,y,A,xnew,ynew,'linear');
    
%Spline interpolation
D=interp2(x,y,A,xnew,ynew,'spline'); 
    
%plot
figure
imshow(B)
title(['Nearest neighbour interpolation x',num2str(Scalar)])
axis([0,w2,0,h2])
axis on
    
figure
imshow(C)
title(['Linear interpolation x',num2str(Scalar)])
axis([0,w2,0,h2])
axis on

figure
imshow(D)
title(['Spline interpolation x',num2str(Scalar)])
axis([0,w2,0,h2])
axis on
