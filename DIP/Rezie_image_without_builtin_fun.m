g=imread('zone.png');

[r c]=size(g);

t=[];

temp=1;

gemp=1;

for i=1:2:r

    for j=1:2:c

        t(temp,gemp)=g(i,j);

        gemp=gemp+1;

    end

    temp=temp+1;

    gemp=1;

end

img_resized=uint8(t);

figure;

imshow(g);

truesize

figure;

imshow(img_resized)

truesize
