function biNum = DecToBin(decNum)
%DECTOBIN Converts the given base 10 number to base 2
%   Calculate integer part, then fractional part, then join together
%   Rounds to a max of 16 digits
    integer = floor(decNum);
    fraction = decNum - integer;
        
    % integer conversion
    currentNum = integer;
    biNum = {};
    arraySize = 1;
    while currentNum > 0
        remainder = num2str(mod(currentNum, 2));
        biNum = [biNum remainder];
        currentNum = floor(currentNum/2);
    end
    
    biNum = flip(biNum);
    
    % fractional conversion
    frac = [];
    decCount = 1;
    while fraction > 0
        if decCount == 16
            break
        end
        fraction = fraction * 2;
        intPart = floor(fraction);
        frac = [frac num2str(intPart)];
        decCount = decCount + 1;
        fraction = fraction - intPart;
    end
    
    biNum = cellstr(biNum);
    frac = cellstr(frac);
    
    biNum = strjoin(biNum,'');
    frac = strjoin(frac,'');
    biNum = strcat(biNum,'.');
    biNum = strcat(biNum,frac);
    %biNum = str2double(biNum);
end

