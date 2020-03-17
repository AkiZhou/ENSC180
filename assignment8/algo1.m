clear

ImageName='a8_img.jpg'; %test image

%read specified image file and convert to double between 0 and 255
A=imread(ImageName);
A=double(A)/255;

Scalar=[1.5 3.1 0.3]; %test scalars
[h1,w1]=size(A);


   
for i=1:3
    %define the new matrix size
    h2=ceil(h1*Scalar(i));
    w2=ceil(w1*Scalar(i));
    
    %Nearest neighbor interpolation
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
    IRow=([1:h2]-0.5)./Scalar(i);
    ICol=([1:w2]-0.5)./Scalar(i);
    
    index=find(IRow==round(IRow));
    dRow=diff(IRow);
    if max(index)>length(dRow)
        IRow(max(index))=size(A,1)-0.00001;
        index(length(index))=[];
    end
    IRow(index)=IRow(index)-(dRow(index-1)>dRow(index))/100000;

    
    index=find(ICol==round(ICol));
    dCol=diff(ICol);
    if max(index)>length(dCol)
        ICol(max(index))=size(A,2)-0.00001;
        index(length(index))=[];
    end
    ICol(index)=ICol(index)-(dCol(index-1)>dCol(index))/100000;
    
    
    IRow=ceil(IRow+0.00001);
    ICol=ceil(ICol+0.00001);
    
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
    
    
    subplot(2,2,i+1)
    imshow(B)
    title(['x',num2str(Scalar(i))]);
    axis([0,794,0,794])
    axis on
    %{
   figure
    plot(beef,chicken,'*')
    grid on 
    grid minor
    xlim([0 794])
    ylim([0 794])
    %}
    B=[]; %reset B
   
end

