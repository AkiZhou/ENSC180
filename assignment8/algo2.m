clear

ImageName='a8_img.jpg'; %test image

A=imread(ImageName);
A=double(A)/255;
%A=[1 2 3 4 5];
%A=[120 121 100;0 150 200;1 1 1];

Scalar=[1.5 3.1 0.3]; %test scalars
[h1,w1]=size(A);
%{
subplot(2,2,1)
   imshow(A)
   title('original');
   axis([0,794,0,794])
   axis on
   %}
for i=1:3
    %define the new matrix size
    h2=ceil(h1*Scalar(i));
    w2=ceil(w1*Scalar(i));
    
    %Nearest neighbor interpolation
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
      
    IRow=ceil(([1:h2]-0.5)./Scalar(i)+0.000001);
    ICol=ceil(([1:w2]-0.5)./Scalar(i)+0.000001);
    
    IRow(find(IRow>h1))=h1;
    ICol(find(ICol>w1))=w1;
    
    %row nearest neighbor interpolation
    B = A(IRow,:);

    %column nearest neighbor interpolation
    B = B(:,ICol);
    
    %check with imresize
    C=imresize(A,Scalar(i),'nearest');
    [beef,chicken]=find(C-B);
    %disp([beef chicken])
    %{
     subplot(2,2,i+1)
    imshow(B)
    title(['x',num2str(Scalar(i))]);
    axis([0,794,0,794])
    axis on
    %}
   figure
    plot(beef,chicken,'*')
    grid on 
    grid minor
    xlim([0 794])
    ylim([0 794])
    
   
    B=[]; %reset B
    
end

