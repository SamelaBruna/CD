entity bcdcontador is
    port(
        inHex1, inHex0: in bit_vector(3 downto 0);
        bUD_bcd, load_bcd, Clr_bcd, Clock_bcd: in bit;
        outHex0, outHex1: out bit_vector(3 downto 0)
    );
end bcdcontador;

architecture arrangement of bcdcontador is

    component contadorModulo is
  port(A: in bit_vector(3 downto 0);
       bUD,Clr,load,en,Clock: in bit; --bit up/dowm
       S: out bit_vector(3 downto 0)
              
    );
end component;

    signal out_hex0: bit_vector(3 downto 0);
    signal carry_borrow: bit;

begin

    carry_borrow<=(not bUD_bcd and (out_hex0(3) and not out_hex0(2) and not out_hex0(1) and out_hex0(0))) or (bUD_bcd and (not out_hex0(3) and not out_hex0(2) and not out_hex0(1) and not out_hex0(0)));

    HEX0: contadorModulo port map(
        A=>inHex0,
        bUD=>bUD_bcd,
        Clr=>Clr_bcd,
        load=>load_bcd,
        en=>'1',
        Clock=>Clock_bcd,
        S=>out_hex0
    );

    HEX1: contadorModulo port map(
        A=>inHex1,
        BUD=>bUD_bcd,
        Clr=>Clr_bcd,
        load=>load_bcd,
        en=>carry_borrow,
        Clock=>Clock_bcd,
        s=>outHex1
    );

     outHex0<=out_hex0;
     


end arrangement;
