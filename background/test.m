function rate = test( picnum )
pfoldpath='ivrgPhotos//orderedImages//';
tfoldpath='ivrgPhotos//orderedTruths//';
pfilepath=sprintf('%s%d.jpg',pfoldpath,picnum);
tfilepath=sprintf('%s%d_gt.bmp',tfoldpath,picnum);
pim=imread(pfilepath);
[h,w,t]=size(pim);
tim=imread(tfilepath);
imwrite(pim,'origin.bmp');
res=buildbg(pim,30);
imwrite(tim,'truth.bmp');
rate=sum(sum(sum(abs(double(res)-double(tim)))))/(h*w*t);
end

