clc;
close all;
clear all;

storedStructure = imread('IM-0001-0050.jpg');
%imageArray = storedStructure.X;

I = storedStructure ;
I2 = Thresholding(I);
cc = bwconncomp(I2, 8);
n = cc.NumObjects;

Area = zeros(n, 1);
Perimeter = zeros(n, 1);
MajorAxis = zeros(n, 1);
MinorAxis = zeros (n, 1);

k = regionprops(I2, 'Area', 'Perimeter','MajorAxisLength', 'MinorAxisLength' );

for i = 1:n
    grain = false(size(I2));
    grain(cc.PixelIdxList{i}) = true;
    figure(i);
    imshow(grain);
    Area(i) = k(i).Area;
    Perimeter(i) = k(i).Perimeter;
    MajorAxis(i)= k(i).MajorAxisLength;
    MinorAxis(i)= k(i).MinorAxisLength;
end

graindata(1,1)= mean(Area);
graindata(2,1)= mean(Perimeter);
graindata(3,1)= mean(MajorAxis);
graindata(4,1)= mean(MinorAxis);

    