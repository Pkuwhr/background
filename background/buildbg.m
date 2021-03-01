function voteres = buildbg( inrgb,r )
f1 =fspecial('gaussian',20,1000);
rgb=imfilter(inrgb,f1,'replicate');
[h,w,t]=size(rgb);
voteres=zeros(h,w);
for idx=1:r
    voteres=voteres+kmeansig(rgb,15);
end
voteres=voteres/r;
voteres=int8(voteres);
voteres=double(voteres);
imwrite(voteres,'voteres.jpg');

end

