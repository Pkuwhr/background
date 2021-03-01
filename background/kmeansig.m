function outres = kmeansig( inrgb,n )
rgb=double(inrgb);
r=rgb(:,:,1);
g=rgb(:,:,2);
b=rgb(:,:,3);
[h,w,t]=size(rgb);
mask=zeros(h,w,n);
outres=zeros(h,w);
%随机生成类的中心
cen=zeros(3,n);
for i=1:n
    cen(:,i)=randi(255,3,1);
end
[cen,mask]=kmeans(r,g,b,cen,mask);

summax=0;
maxidx=0;
fixgate=h*w*0.20;

fnin='mask';


for idx=1:n
    fn=sprintf('%s%d.jpg',fnin,idx);
    imwrite(mask(:,:,idx),fn);
    sumcurr=sum(sum(mask(:,:,idx),1),2);
    flag=sumcurr>summax;
    if flag
        summax=sumcurr;
        maxidx=idx;
    end
end

for idx=1:n
    thismask=mask(:,:,idx);
    sumcurr=sum(sum(thismask(:,:),2),1);
    flag=sumcurr<summax*0.6 && idx~=maxidx &&sumcurr<fixgate;
    if flag
        outres=outres+mask(:,:,idx);
    end
end
end

