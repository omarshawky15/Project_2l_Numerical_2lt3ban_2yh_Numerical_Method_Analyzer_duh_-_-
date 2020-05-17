function root = bisect(func , nOfItr,percision ,Xlower,Xupper)
fprintf('i    Xupper  Xlower  Xrnew \tEr\t  f(Xr)\n');
xro = nan ;
xrn = nan ;
root= nan;
i=0;
funcLo = vpa(subs(func,Xlower));
funcUp = vpa(subs(func,Xupper));
funcMul = vpa(funcUp*funcLo) ;
if(funcMul >0)
    return ;
end
while isnan(xro)||isnan(xrn)||(i<=nOfItr&& abs(xro-xrn)>percision)
    xro = xrn ;
    xrn = vpa((Xlower+Xupper)/2);
    funNew = vpa(subs(func,xrn));
    funMul = vpa(funNew*funcLo) ;
    fprintf('%d\t%0.5f\t%0.5f\t%0.5f\t%0.5f\t%0.5f\n',i+1,Xupper,Xlower,xrn,abs(xro-xrn),funNew);
    if funMul < 0
        Xupper = xrn ;
    else
        if funMul>0
            Xlower = xrn ;
            funcLo = funNew;
        else
            break ;
        end
    end
    i= i+1;
end
root = xrn ;
end