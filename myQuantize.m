function y = myQuantize(x,w)
    bitDepth = w;
    q=2/(2^bitDepth);
    y = zeros(length(x), 1);
    for i= 1 : length(x)
        y(i)= max(min((round(x(i)*2^bitDepth-1))/(2^(bitDepth-1))-sign(x(i))*q/2, 1 - delta) , -1);
    end
end