entity Final is
  port(A: bit_vector(3 downto 0);
       En: in bit;
       Clr: in bit_vector(1 downto 0);
       S: out bit_vector(3 downto 0);
       Clock: in bit
    );
end Final;

 architecture funcionamento of final is
    component ffd is
        port( D, Preset, Clear, Clock: in bit;
              Q: out bit
        );
    end component;

    signal preVet, clrVet, yVet,xVet, notclrVet : bit_vector (3 downto 0);
           
begin
    
    clrVet(3) <= (not Clr(1)) and ((not En) or A(3));
    clrVet(2) <= (not Clr(1)) and ((not En) or A(2));
    clrVet(1) <= (not Clr(1)) and ((not En) or A(1));
    clrVet(0) <= (not Clr(1)) and ((not En) or A(0));

    preVet(3) <= not(En and A(3) and (not Clr(1)));
    preVet(2) <= not(En and A(2) and (not Clr(1)));
    preVet(1) <= not(En and A(1) and (not Clr(1)));
    preVet(0) <= not(En and A(0) and (not Clr(1)));

    notclrVet(3)<= not Clr(0);
    notclrVet(2)<= not Clr(0);
    notclrVet(1)<= not Clr(0);
    notclrVet(0)<= not Clr(0);

    FLIPCP3: ffd port map (
        D => '0',
        Preset => preVet(3),
        Clear => clrVet(3),
        Clock => Clock,
        Q => yVet(3));
    
    FLIPCP2: ffd port map (
        D => yVet(3),
        Preset => preVet(2),
        Clear => clrVet(2),
        Clock => Clock,
        Q => yVet(2));

    FLIPCP1: ffd port map (
        D => yVet(2),
        Preset => preVet(1),
        Clear => clrVet(1),
        Clock => Clock,
        Q => yVet(1));

    FLIPCP0: ffd port map (
        D => yVet(1),
        Preset => preVet(0),
        Clear => clrVet(0),
        Clock => Clock,
        Q => yVet(0));


    FLIPS3: ffd port map(
        D => yVet(0),
        Preset => '1',
        Clear => notclrVet(3),
        Clock => Clock,
        Q => xVet(3)

    );

    FLIPS2: ffd port map(
        D => xVet(3),
        Preset => '1',
        Clear => notclrVet(2),
        Clock => Clock,
        Q => xVet(2)

    );

    FLIPS1: ffd port map(
        D => xVet(2),
        Preset => '1',
        Clear => notclrVet(1),
        Clock => Clock,
        Q => xVet(1)

    );

    FLIPS0: ffd port map(
        D => xVet(1),
        Preset => '1',
        Clear => notclrVet(0),
        Clock => Clock,
        Q => xVet(0)

    );
    
    S <= xVet;

end funcionamento;



    







