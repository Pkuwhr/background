function [newcen,newmask] = kmeans( r,g,b,oldcen,oldmask )
[h,w,n]=size(oldmask);
tempmask=zeros(h,w,n);
dist=zeros(h,w,n);
tempcen=zeros(3,n);


%����㵽���е����ĵ�ľ������
for i=1:n
    cr=oldcen(1,i);
    cg=oldcen(2,i);
    cb=oldcen(3,i);
    dist(:,:,i)=cal_dist(r,g,b,cr,cg,cb);
end


%���ݾ�����з���,����������newmask����
for i=1:h
    for j=1:w
    [x,idx]=min(dist(i,j,:));
    tempmask(i,j,idx)=1;
    end
end

%���ݷ��ཫ���ĵ����
for i=1:n
    tm=double(tempmask(:,:,i));
    tr=tm.*double(r);
    tg=tm.*double(g);
    tb=tm.*double(b);
    tpnum=sum(tm(:,:));
    cr=sum(tr(:,:))/tpnum;
    cg=sum(tg(:,:))/tpnum;
    cb=sum(tb(:,:))/tpnum;
    tempcen(1,i)=cr(1);
    tempcen(2,i)=cg(1);
    tempcen(3,i)=cb(1);
end

bias=0;
%�ݹ�
for i=1:n
    tbias=tempcen(:,i)-oldcen(:,i);
    bsum=(tbias(1)*tbias(1)+tbias(2)*tbias(2)+tbias(3)*tbias(3))^0.5;
    bias=bsum;
end

if bias>1
    [newcen,newmask]=kmeans(r,g,b,tempcen,tempmask);
else
    newcen=tempcen;
    newmask=tempmask;
end

end

