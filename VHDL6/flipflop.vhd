entity ffd is
    port(
        D, Preset, Clear, Clock: in bit;
        Q: out bit
    );
end ffd;


architecture arrangement of ffd is
    signal Q_inter:bit;
begin

    PRC00: process(D, Preset, Clear, Clock)
        begin
            if(Clear='0') then
                Q_inter<='0';
            elsif(Preset='0') then
                Q_inter<='1';
            elsif(Clock'event and Clock='1') then
                if(D='1') then
                    Q_inter<='1';
                else
                    Q_inter<='0';
                end if;
            else
                Q_inter<=Q_inter;
            end if;
    end process PRC00;

    Q<=Q_inter;

end arrangement;
