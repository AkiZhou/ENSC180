%function resize(ImageName,Scalar)

%{
Scalar=0;
counter=0;
while Scalar<=0
    if counter>0
        fprintf('Scaling factor must be greater than zero\n')
    end
    Scalar=input('Enter positive scaling factor\n');
    counter=counter+1;
end
%}

ImageName='a8_img.jpg'; %test image
Scalar=[1.5 3.1 0.3]; %test scalars
%0.1 error
%0.2 no error
%0.3 no error
%read specified image file and convert to double between 0 and 255
A=imread(ImageName);
A=double(A)/255;
%A=[1 2 3 4 5];
%A=[120 121 100;0 150 200;1 1 1];
[h1,w1]=size(A);

TitleArray=["Nearest neighbor interpolation","Linear interpolation","Spline interpolation"];

for i=1:3
    %define the new matrix size
    h2=ceil(h1*Scalar(i));
    w2=ceil(w1*Scalar(i));
    
    %Nearest neighbor interpolation
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    %{
       obtain corresponding indeces of original matrix for interpolated matrix
       i.e.
       original            ineterpolated(scaled by 2)
       1 2 3 4             1 1 2 2 3 4 4

       their indeces are
       original                    ineterpolated(scaled by 2)
       (1,1) (1,2) (1,3) (1,4)     (1,1) (1,1) (1,2) (1,2) (1,3) (1,3) (1,4) (1,4)

       the following calculates the indeces of which row or column of the
       original matrix should be copied 
     %}
    
  
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
    %{
    IRow=ceil(([1:h2]-0.5)./Scalar(i)+0.000001);
    ICol=ceil(([1:w2]-0.5)./Scalar(i)+0.000001);
    
    IRow(find(IRow>h1))=h1;
    ICol(find(ICol>w1))=w1;
    %}
    %row nearest neighbor interpolation
    B = A(:,IRow);

    %column nearest neighbor interpolation
    B = B(ICol,:);
    
    C=imresize(A,Scalar(i),'nearest');
    [beef,chicken]=find(C-B);
    %disp([beef chicken])
    
    figure
    plot(beef,chicken,'*')
    grid on 
    grid minor
    xlim([0 794])
    ylim([0 794])
    
    %{
    B=zeros(h2,w2);
      for y=0:h2-1
        for x=0:w2-1
            px=ceil((x-0.5)/Scalar(i)+0.000001)+1;
            py=ceil((y-0.5)/Scalar(i)+0.000001)+1;
            
            px(find(px>w1))=w1;
            py(find(py>h1))=h1;
            
            
            B((y+1),(x+1))=A(py,px);
            %{
            B(47,x)=A(16,px);
            B(140,x)=A(45,px);
            B(171,x)=A(55,px);
            
            B(y,47)=A(py,15);
            B(y,140)=A(py,45);
            B(y,171)=A(py,55);
            %}
        end
        
    end
   
    
    %plot
    subplot(3,3,i)
    imshow(B)
    title([TitleArray(1),' x',Scalar(i)]);
    axis([0,512,0,512])
    axis on
    %}
    B=[]; %reset B
    %{
    %Linear interpolation
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    C=zeros(h2,w2);
    
    spreadx=ceil([0:w1-1].*Scalar(i))+1;
    spready=ceil([0:h1-1].*Scalar(i))+1;
    
    y=1; x=1; %matlab indeces start from 1
    for row=1:h1
        y=spready(row); %length of spready=length of h1
        for col=1:w1
            x=spreadx(col); %length of spreadx=length of w1
            C(y,x)=A(row,col);
        end
    end
    C
    subplot(3,3,3+i)
    imshow(C)
    title([TitleArray(2),' x',Scalar(i)]);
    axis([0,800,0,800])
    axis on
    
    C=[]; %reset C
    %}
    %Spline interpolation
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
end

