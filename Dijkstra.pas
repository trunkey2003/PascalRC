const INP = 'input.txt';
var
        f : text;
        n, i, j, a, b, sum : integer;
        len, s, p : array[1..1000] of integer;
        G : array[1..100,1..100] of integer;
BEGIN

        {doc du lieu tu tep}
        assign(f, INP);
        reset(f);

        readln(f, n, a, b);
        writeln(n, ' ', a, ' ', b);
        sum :=0;
        for i:=1 to n do
        begin
                for j:=1 to n do
                begin
                        read(f, G[i, j]);
                        sum := sum + G[i, j];
                end;
                readln(f);
        end;

        {dat vo cung cho tat ca cap dinh khong co duong di}
        for i:=1 to n do
                for j:=1 to n do
                        if (i <> j) and (G[i, j] = 0) then
                                G[i, j] := sum;

        for i:=1 to n do
        begin
                len[i] := sum; {khoi tao do dai tu a toi moi dinh la vo cung}
                s[i] := 0;     {danh sach cac diem da xet}
                p[i] := a;     {diem bat dau cua moi dinh la a}
        end;                   {do dai tu a den a la 0}
        len[a] := 0;

        while (s[b] = 0) do     {trong khi dinh b chua duoc duyet}
        begin
                for i:=1 to n do    {tim 1 dinh chua xet ma co the di tu a den no}
                begin
                        if (s[i]=0) and (len[i] < sum) then
                        begin
                                break;
                        end;
                end;
                if i>n then      {khong tim thay dinh nao, dung lai}
                begin
                        break;
                end;

                for j:=1 to n do     {tim dinh ma duong di tu a den no la nho nhat}
                        if (s[j] = 0) and (len[i] > len[j]) then i := j;

                s[i] := 1;            {danh dau da duyet}

                for j:=0 to n do      {tinh lai duong di den cac dinh chua xet}
                        if (s[j] = 0) and (len[i] + G[i, j] < len[j]) then
                        begin
                                len[j] := len[i] + G[i, j];
                                p[j] := i;
                        end;
        end;

        i := b;
        while(i <>a) do
        begin
                write(i, ' <-- ');
                i := p[i];
        end;
        writeln(a);
END.
